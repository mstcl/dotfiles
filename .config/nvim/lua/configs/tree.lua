vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_hijack_netrw = 1
vim.g.nvim_tree_auto_resize = 1
vim.g.nvim_tree_disable_netrw = 1
vim.g.nvim_tree_symlink_arrow = '  '
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
        'packer',
        'qf'
    },
    buftype = {
        'terminal'
    }
}
