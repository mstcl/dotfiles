require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = true,
	hijack_cursor = true,
	sync_root_with_cwd = false,
	actions = {
		open_file = {
			resize_window = false,
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
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	view = {
		width = 25,
		side = "left",
		hide_root_folder = true,
		mappings = {
			custom_only = false,
			list = {},
		},
		signcolumn = "yes",
	},
	renderer = {
		highlight_opened_files = "name",
		indent_markers = {
			enable = true,
		},
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
				folder = {
					default = "",
					empty = " ",
					empty_open = " ",
					open = " ",
					symlink = " ",
					symlink_open = " ",
				},
			},
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

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.state')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)
