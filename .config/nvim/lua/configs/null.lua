local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.chktex,
    null_ls.builtins.diagnostics.cppcheck,
    null_ls.builtins.diagnostics.codespell,
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({ sources = sources })
