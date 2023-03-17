local present, null_ls = pcall(require, "null-ls")
local navic = require("nvim-navic")
if not present then
	return
end

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "<C-K>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<Leader>qD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "<Leader>qf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
	buf_set_keymap("n", "<Leader>qR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ wrap = false, float = false })<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ wrap = false, float = false })<CR>", opts)
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = { border = "single" },
		floating_window = true,
		floating_window_above_cur_line = true,
		fix_pos = false,
		hint_enable = false,
	})
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

local sources = {
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.formatting.black,
	null_ls.builtins.diagnostics.chktex,
	null_ls.builtins.diagnostics.cppcheck,
	null_ls.builtins.diagnostics.codespell,
	null_ls.builtins.diagnostics.vint,
	null_ls.builtins.diagnostics.proselint,
	null_ls.builtins.diagnostics.pylint,
	null_ls.builtins.diagnostics.shellcheck,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.latexindent.with({
		args = { "-m", "-l", "/home/lckdscl/downloads/textwrap.yaml", "-" },
	}),
	null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
	sources = sources,
	log = {
		enable = true,
		level = "error",
		use_console = "async",
	},
	on_attach = on_attach,
})
