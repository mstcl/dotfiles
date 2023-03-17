local present, telescope = pcall(require, "telescope")
if not present then
	return
end

telescope.setup({
	defaults = {
		use_less = false,
		initial_mode = "insert",
		selection_strategy = "reset",
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		path_display = { "truncate" },
        color_devicons = true,
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		winblend = 0,
		layout_config = {
			prompt_position = "top",
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
			"steam",
			"dosdevices",
			"drive_c",
			"compatdata",
			"cargo",
			".conan",
			"gem",
			"Brave",
			".paradox-launcher",
			".cache",
			"Trash",
			"unity3d",
			"Paradox Interactive",
			"autostart",
			"pulse",
			"droidcam",
			"swap",
			"kdeconnect",
			"OpenTabletDriver",
			".icons",
			"downloads",
			"secret",
			".librewolf",
			"kernel",
			"dic",
			"vivaldi",
			"krita",
			"mime",
			"chromium",
			"inkscape",
			"syncthing",
			"xournalpp",
			".ssh",
			"feh",
			"discord",
			"BetterDiscord",
			"lutris",
			"secrets",
			".var",
			"pictures",
			"easyeffects",
			".android",
			".cmake",
			".dotnet",
			".nuget",
			".vnc",
			".themes",
		},
	},
	pickers = {
		buffers = {
			sort_lastused = true,
			prompt_prefix = "   ",
			previewer = false,
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				},
				n = {
					["<c-d>"] = require("telescope.actions").delete_buffer,
				},
			},
		},
		file_browser = {
			prompt_prefix = "   ",
			hidden = true,
			initial_mode = "normal",
		},
		find_files = {
			find_command = {
				"rg",
				"--no-ignore",
				"--files",
				"--hidden",
			},
			prompt_prefix = "   ",
			-- theme = "dropdown",
			-- previewer = false,
		},
		oldfiles = {
			prompt_prefix = "   ",
			previewer = false,
		},
		colorscheme = {
			prompt_prefix = "   ",
			previewer = false,
			-- theme = "dropdown",
		},
		highlights = {
			prompt_prefix = "   ",
		},
		live_grep = {
			prompt_prefix = "   ",
		},
		git_commits = {
			prompt_prefix = " ﰖ  ",
		},
		git_bcommits = {
			prompt_prefix = " ﰖ  ",
		},
		git_branches = {
			prompt_prefix = " שׂ  ",
		},
		git_status = {
			prompt_prefix = "   ",
			git_icons = {
				added = "+",
				changed = "~",
				copied = ">",
				deleted = "-",
				renamed = "➡",
				unmerged = "‡",
				untracked = "?",
			},
		},
		git_files = {
			prompt_prefix = " שׂ  ",
		},
		commands = {
			prompt_prefix = "   ",
			-- theme = "ivy",
			--[[ layout_config = {
				height = 10,
			}, ]]
		},
		registers = {
			prompt_prefix = "   ",
			-- theme = "ivy",
			--[[ layout_config = {
				height = 10,
			}, ]]
		},
		spell_suggests = {
			prompt_prefix = "   ",
			-- theme = "ivy",
			--[[ layout_config = {
				height = 10,
			}, ]]
		},
		keymaps = {
			prompt_prefix = "   ",
			-- theme = "ivy",
			--[[ layout_config = {
				height = 10,
			}, ]]
		},
		lsp_code_actions = {
			prompt_prefix = "   ",
			theme = "cursor",
		},
		lsp_references = {
			--[[ prompt_prefix = "   ",
			theme = "ivy",
			layout_config = {
				height = 20,
			}, ]]
		},
		lsp_implentations = {
			prompt_prefix = "   ",
			-- theme = "ivy",
			--[[ layout_config = {
				height = 20,
			}, ]]
		},
		lsp_document_diagnostics = {
			prompt_prefix = " 律 ",
			--[[ theme = "ivy",
			layout_config = {
				height = 20,
			}, ]]
		},
		extensions = {
			file_browser = {
				hijack_netrw = true,
				auto_depth = true,
				hidden = true,
				cwd_to_path = true,
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			undo = {
				use_delta = true,
				side_by_side = true,
				layout_strategy = "vertical",
				layout_config = {
					preview_height = 0.8,
				},
			},
			--[[ fzf_writer = {
				minimum_grep_characters = 2,
				minimum_files_characters = 2,
			}, ]]
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("zoxide")
telescope.load_extension("file_browser")
telescope.load_extension("frecency")
telescope.load_extension("undo")
telescope.load_extension("dap")
telescope.load_extension("lazy")
