local present, ts = pcall(require, "nvim-treesitter.configs")
if not present then
   return
end

ts.setup {
    ensure_installed = {
        "python",
        "html",
        "c",
        "cpp",
        "bibtex",
        "css",
        "json",
        "vim",
        "java",
        "javascript",
        "cmake",
        -- "latex",
        "lua",
        "bash",
        "toml",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
        disable = { "latex", "markdown"},
    },
    autopairs = {
        enable = true
    },
    rainbow = {
        enable = true,
        loaded = true,
        extended_mode = true,
        max_file_lines = 1400,
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
  }
}

vim.cmd('autocmd Filetype * silent! TSEnableAll rainbow')
vim.cmd('autocmd VimEnter *.zsh silent! TSBufDisable highlight')
