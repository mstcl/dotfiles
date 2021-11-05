require("better_escape").setup {
    mapping = {"jk"},
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false,
    keys = "<Esc>",
}
