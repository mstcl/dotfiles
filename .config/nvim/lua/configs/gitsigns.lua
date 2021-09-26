local present, gs = pcall(require, "gitsigns")
if not present then
   return
end

gs.setup {
    numhl = false,
    linehl = false,
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    current_line_blame = false,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    word_diff = false,
    keymaps = {},
}
