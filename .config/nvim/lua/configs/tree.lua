local g = vim.g

g.nvim_tree_highlight_opened_files = 2
g.nvim_tree_root_folder_modifier = table.concat({ ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" })
g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
}
g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		deleted = "",
		ignored = "◌",
		renamed = "➜",
		staged = "✓",
		unmerged = "",
		unstaged = "✗",
		untracked = "★",
	},
	folder = {
		default = "",
		empty = " ",
		empty_open = " ",
		open = " ",
		symlink = " ",
		symlink_open = " ",
	},
}

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = { "alpha" },
	open_on_tab = true,
	hijack_cursor = true,
	update_cwd = false,
	actions = {
		open_file = {
			window_picker = {
				exclude = {
					filetype = { "notify", "packer", "qf" },
					buftype = { "terminal" },
				},
			},
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	view = {
		width = 25,
		side = "left",
		auto_resize = false,
		hide_root_folder = true,
		mappings = {
			custom_only = false,
			list = {},
		},
        signcolumn = "yes",
	},
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
	git = {
		enable = true,
		ignore = false,
	},
	filters = {
		dotfiles = false,
	},
})
require("nvim-tree.view").View.winopts.cursorline = false
require("nvim-tree.view").View.winopts.wrap = true
