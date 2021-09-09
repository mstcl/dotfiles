local present, telescope = pcall(require, "telescope")
if not present then
    return
end

telescope.setup {
    defaults = {
        use_less = false,
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        prompt_prefix = "  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = 'top',
            horizontal = {
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
        },
        file_ignore_patterns = {
            'steam',
            'dosdevices',
            'drive_c',
            'compatdata',
            'cargo',
            '.conan',
            'gem',
            'Brave',
            '.paradox-launcher',
            '.cache',
            'Trash',
            'discord',
            'BetterDiscord',
            'lutris',
            'secrets',
            '.var',
            'go',
            '.android',
            '.cmake',
            '.dotnet',
            '.nuget',
        },
    },
    pickers = {
        buffers = {
            sort_lastused = true,
            prompt_prefix = ' ﬘  ',
            previewer = false,
            layout_config = {
                width = 0.37,
                height = 0.50,
            },
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer",
                },
                n = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        },
        file_browser = {
            prompt_prefix = '    ',
            hidden = true,
        },
        find_files = {
            find_command= {
                'rg',
                '--no-ignore',
                '--hidden',
                '--files',
            },
            prompt_prefix = '   ',
        },
        oldfiles = {
            prompt_prefix = '   ',
        },
        colorscheme = {
            prompt_prefix = '   ',
        },
        highlights = {
            prompt_prefix = '   ',
        },
        live_grep = {
            prompt_prefix = '   ',
        },
        git_commits = {
            prompt_prefix = '   ',
        },
        git_bcommits = {
            prompt_prefix = '   ',
        },
        git_branches = {
            prompt_prefix = '   ',
        },
        git_status = {
            prompt_prefix = '   ',
        },
        git_files = {
            prompt_prefix = ' ﯙ  ',
        },
        commands = {
            prompt_prefix = '   ',
        },
        registers = {
            prompt_prefix = '   ',
        },
        spell_suggests = {
            prompt_prefix = '   ',
        },
        keymaps = {
            prompt_prefix = '   ',
        },
        extensions = {
            fzf = {
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    },
}
telescope.load_extension('fzf')
telescope.load_extension('zoxide')
