local present, lsp = pcall(require, "lspconfig")
if not present then
	return
end

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ update_in_insert = false }
	),
}

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "<C-K>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<Leader>qD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "<Leader>qf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	buf_set_keymap("n", "<Leader>qR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ wrap = false, float = false })<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ wrap = false, float = false })<CR>", opts)
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = { border = "rounded" },
		floating_window = true,
		floating_window_above_cur_line = true,
		fix_pos = false,
		hint_enable = false,
	})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = { "clangd", "pyright", "vimls", "bashls" }

for _, server in ipairs(servers) do
	lsp[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = handlers,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

lsp.texlab.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { "texlab" },
	filetypes = { "tex", "bib" },
	settings = {
		texlab = {
			auxDirectory = ".",
			bibtexFormatter = "texlab",
			build = {
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f", "-shell-escape" },
				executable = "latexmk",
				forwardSearchAfter = true,
				onSave = true,
			},
			chktex = {
				onEdit = true,
				onOpenAndSave = true,
			},
			diagnosticsDelay = 300,
			formatterLineLength = 80,
			forwardSearch = {
				executable = "zathura",
				args = {
					"--synctex-editor-command",
					[[nvim --headless -c 'TexlabInverseSearch %{input} %{line}']],
					"--synctex-forward",
					"%l:1:%f",
					"%p",
				},
			},
			latexFormatter = "latexindent",
			latexindent = {
				modifyLineBreaks = false,
			},
		},
	},
})

lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { "/usr/bin/lua-language-server", "-E", "/usr/share/lua-language-server/main.lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = "/usr/bin/luajit",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local icons = {
	Class = "ﴯ Class",
	Color = " Color",
	Constant = " Constant",
	Constructor = " Constructor",
	Enum = "了 Enum",
	EnumMember = "  EnumMember",
	Event = " Event",
	Field = " Field",
	File = " File",
	Folder = " Folder",
	Function = " Function",
	Interface = " Interface",
	Keyword = " Keyword",
	Reference = " Reference",
	Method = "ƒ Method",
	Module = " Module",
	Operator = " Operator",
	Property = "ﰠ Property",
	Snippet = " Snippet",
	Struct = " Structure",
	Text = " Text",
	TypeParameter = " Parameter",
	Unit = " Unit",
	Value = " Value",
	Variable = " Variable",
}

local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
	kinds[i] = icons[kind] or kind
end

vim.diagnostic.config({
	--[[ virtual_text = {
        show = false,
		prefix = "",
	}, ]]
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	float = {
		show_header = false,
		source = "if_many",
	},
	severity_sort = true,
})

function format_range_operator()
	local old_func = vim.go.operatorfunc
	_G.op_func_formatting = function()
		local start = vim.api.nvim_buf_get_mark(0, "[")
		local finish = vim.api.nvim_buf_get_mark(0, "]")
		vim.lsp.buf.range_formatting({}, start, finish)
		vim.go.operatorfunc = old_func
		_G.op_func_formatting = nil
	end
	vim.go.operatorfunc = "v:lua.op_func_formatting"
	vim.api.nvim_feedkeys("g@", "n", false)
end

vim.api.nvim_set_keymap("n", "gm", "<cmd>lua format_range_operator()<CR>", { noremap = true })

vim.api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "if_many",
			prefix = " ",
			header = "",
			scope = "cursor",
			focus = false,
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

return on_attach
