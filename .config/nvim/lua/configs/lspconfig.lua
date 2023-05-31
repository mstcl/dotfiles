local present, lsp = pcall(require, "lspconfig")
local navic = require("nvim-navic")
if not present then
	return
end

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
	["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = "single", focusable = false, silent = true }
	),
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ update_in_insert = false }
	),
}

local handlers_pyright = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ update_in_insert = false }
	),
}

local function applyFoldsAndThenCloseAllFolds(bufnr, providerName)
	require("async")(function()
		bufnr = bufnr or vim.api.nvim_get_current_buf()
		require("ufo").attach(bufnr)
		local ok, ranges = pcall(await, require("ufo").getFolds(bufnr, providerName))
		if ok and ranges then
			ok = require("ufo").applyFolds(bufnr, ranges)
		end
	end)
end

local on_attach_fold_lsp = function(client, bufnr)
	applyFoldsAndThenCloseAllFolds(bufnr, "lsp")

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }
	if client.server_capabilities.hoverProvider then
		buf_set_keymap("n", "<C-K>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	end
	if client.server_capabilities.definitionProvider then
		buf_set_keymap("n", "<Leader>qD", "<cmd>lua Scroll('declaration')<CR>", opts)
	end
	if client.server_capabilities.documentFormattingProvider then
		buf_set_keymap("n", "<Leader>qf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
	end
	if client.server_capabilities.renameProvider then
		buf_set_keymap("n", "<Leader>qR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	end
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ wrap = false, float = false })<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ wrap = false, float = false })<CR>", opts)
	require("lsp_signature").on_attach({
		bind = false,
		handler_opts = { border = "single" },
		transparency = 0,
		floating_window = true,
		floating_window_above_cur_line = true,
		fix_pos = false,
		hint_enable = false,
		hi_parameter = "LspSignatureActiveParameter",
	})
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

local on_attach_fold_indent = function(client, bufnr)
	applyFoldsAndThenCloseAllFolds(bufnr, "indent")

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }
	if client.server_capabilities.hoverProvider then
		buf_set_keymap("n", "<C-K>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	end
	if client.server_capabilities.definitionProvider then
		buf_set_keymap("n", "<Leader>qD", "<cmd>lua Scroll('declaration')<CR>", opts)
	end
	if client.server_capabilities.documentFormattingProvider then
		buf_set_keymap("n", "<Leader>qf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
	end
	if client.server_capabilities.renameProvider then
		buf_set_keymap("n", "<Leader>qR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	end
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ wrap = false, float = false })<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ wrap = false, float = false })<CR>", opts)
	require("lsp_signature").on_attach({
		bind = false,
		handler_opts = { border = "single" },
		transparency = 0,
		floating_window = true,
		floating_window_above_cur_line = true,
		fix_pos = false,
		hint_enable = false,
		hi_parameter = "LspSignatureActiveParameter",
	})
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

local on_attach_pyright = function(client, bufnr)
	applyFoldsAndThenCloseAllFolds(bufnr, "indent")
	client.server_capabilities.codeActionProvider = true
	client.server_capabilities.completionProvider = false
	client.server_capabilities.hoverProvider = false
	client.server_capabilities.definitionProvider = false
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentSymbolProvider = false
	client.server_capabilities.renameProvider = false
	client.server_capabilities.signatureHelpProvider = false
	client.server_capabilities.referencesProvider = false
end

local on_attach_ruff = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	client.server_capabilities.hoverProvider = false
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.renameProvider = false
	local opts = { noremap = true, silent = true }
	if client.server_capabilities.hoverProvider then
		buf_set_keymap("n", "<C-K>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	end
	if client.server_capabilities.definitionProvider then
		buf_set_keymap("n", "<Leader>qD", "<cmd>lua Scroll('declaration')<CR>", opts)
	end
	if client.server_capabilities.documentFormattingProvider then
		buf_set_keymap("n", "<Leader>qf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
	end
	if client.server_capabilities.renameProvider then
		buf_set_keymap("n", "<Leader>qR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	end
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ wrap = false, float = false })<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ wrap = false, float = false })<CR>", opts)
	require("lsp_signature").on_attach({
		bind = false,
		handler_opts = { border = "single" },
		transparency = 0,
		floating_window = true,
		floating_window_above_cur_line = true,
		fix_pos = false,
		hint_enable = false,
		hi_parameter = "LspSignatureActiveParameter",
	})
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local servers_fold_indent = { "clangd", "bashls" }

for _, server in ipairs(servers_fold_indent) do
	lsp[server].setup({
		on_attach = on_attach_fold_indent,
		capabilities = capabilities,
		handlers = handlers,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

lsp.vimls.setup({
	on_attach = on_attach_fold_lsp,
	capabilities = capabilities,
	handlers = handlers,
	flags = {
		debounce_text_changes = 150,
	},
})

lsp.ruff_lsp.setup({
	on_attach = on_attach_ruff,
	capabilities = capabilities,
	handlers = handlers,
	flags = {
		debounce_text_changes = 150,
	},
})

lsp.jedi_language_server.setup({
	capabilities = capabilities,
	handlers = handlers,
	flags = {
		debounce_text_changes = 150,
	},
})

lsp.pyright.setup({
	on_attach = on_attach_pyright,
	capabilities = capabilities,
	handlers = handlers_pyright,
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				autoSearchPaths = false,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
})

lsp.texlab.setup({
	on_attach = on_attach_fold_lsp,
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
				args = { "-pdflatex=lualatex", "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f", "-shell-escape" },
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
				executable = "sioyek",
				args = {
					"--reuse-window",
					"--inverse-search",
					[[nvim-texlabconfig -file %1 -line %2]],
					"--forward-search-file",
					"%f",
					"--forward-search-line",
					"%l",
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

lsp.lua_ls.setup({
	on_attach = on_attach_fold_lsp,
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
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

local signs = { Error = " ✘", Warn = " !", Hint = " ?", Info = " i" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local icons = {
	Class = "⁐ Class",
	Color = " Color",
	Constant = "π Constant",
	Constructor = "☂ Constructor",
	Enum = "ζ Enum",
	EnumMember = "⁜ EnumMember",
	Event = " Event",
	Field = "⊟ Field",
	File = "⊡ File",
	Folder = "₪ Folder",
	Function = "ƒ Function",
	Interface = "♺ Interface",
	Keyword = "✮ Keyword",
	Reference = "⇒ Reference",
	Method = "ƒ Method",
	Module = "◫ Module",
	Operator = "⁑ Operator",
	Property = "✓ Property",
	Snippet = " Snippet",
	Struct = "◧ Structure",
	Text = "☰ Text",
	TypeParameter = "⊞ Parameter",
	Unit = " Unit",
	Value = "λ Value",
	Variable = "Ψ Variable",
}

local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
	kinds[i] = icons[kind] or kind
end

vim.diagnostic.config({
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
			border = "single",
			source = "if_many",
			prefix = " ",
			header = "",
			scope = "cursor",
			focus = false,
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

return on_attach_fold_lsp
