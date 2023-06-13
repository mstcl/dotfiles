local present, ts = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local rainbow = require("ts-rainbow")

ts.setup({
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
        "comment",
        "org"
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = {'org'},
        disable = { "latex", "markdown" },
    },
    autopairs = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        query = {
            "rainbow-parens",
            html = "rainbow-tags",
            latex = "rainbow-blocks",
        },
        strategy = {
            rainbow.strategy["global"],
            html = rainbow.strategy["local"],
            latex = function()
                if vim.fn.line("$") > 10000 then
                    return nil
                elseif vim.fn.line("$") > 1000 then
                    return rainbow.strategy["global"]
                end
                return rainbow.strategy["local"]
            end,
        },
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
        },
    },
})

vim.cmd("autocmd Filetype * silent! TSEnableAll rainbow")
vim.cmd("autocmd VimEnter *.zsh silent! TSBufDisable highlight")
