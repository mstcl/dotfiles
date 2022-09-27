local present, null_ls = pcall(require, "null-ls")
if not present then
	return
end

local on_attach = require("configs.lspconfig")

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
