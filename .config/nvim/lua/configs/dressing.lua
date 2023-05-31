require('dressing').setup({
    input = {
        default_prompt = "❯❯ ",
        insert_only = true,
        prompt_align = "left",
        start_in_insert = true,
        anchor = "SW",
        relative = "cursor",
        border = "single",
        prefer_width = 40,
        max_width = nil,
        min_width = 20,
        get_config = nil,
        win_options = {
            winblend = 0,
        }
    },
    select = {
        backend = { "telescope", "builtin"},
        telescope = require('telescope.themes').get_cursor(),
        builtin = {
            anchor = "NW",
            relative = "cursor",
            border = "single",
            width = nil,
            max_width = 0.8,
            min_width = 40,
            height = nil,
            max_height = 0.9,
            min_height = 10,
        },
        win_options = {
            winblend = 0,
        },
        get_config = nil,
    },
})
