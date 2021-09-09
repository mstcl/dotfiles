local present, ts = pcall(require, "nvim-treesitter.configs")
if not present then
   return
end


ts.setup {
    ensure_installed = { "python", "html", "cpp", "css", "vim", "latex", "lua", "bash", "toml" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = { "latex" },
    },
    autopairs = {
        enable = true
    },
    rainbow = {
        enable = true,
        loaded = true,
        extended_mode = true,
        colors = { "#bf616a", "#d08770", "#ebcb8b", "#a3be8c", "#88c0d0", "#5e81ac", "#b48ead" },
        max_file_lines = 1400,
    }
}

vim.cmd('autocmd Filetype * silent! TSEnableAll rainbow')
vim.cmd('autocmd VimEnter *.zsh silent! TSBufDisable highlight')
