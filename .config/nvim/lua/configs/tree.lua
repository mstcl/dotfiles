require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = true,
    ignore_ft_on_setup  = {'alpha'},
    auto_close          = true,
    open_on_tab         = true,
    hijack_cursor       = true,
    update_cwd          = false,
    update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    view = {
        width = 30,
        side = 'left',
        auto_resize = false,
        hide_root_folder = true,
        mappings = {
            custom_only = false,
            list = {}
        }
    }
}
