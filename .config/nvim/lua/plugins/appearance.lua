return {
	{
		'mstcl/nvim-highlite',
		lazy = false,
		priority = 1000,
		config = function()
			vim.api.nvim_command 'colorscheme highlite'
		end,
	},
	{
		"AkashKarnatak/galaxyline.nvim",
		lazy = true,
		event = "VeryLazy",
		branch = "main",
		dependencies = { "nvim-web-devicons" },
		config = function()
			require("configs.statusline")
		end,
	},
	{
		"goolord/alpha-nvim",
		lazy = true,
		cmd = { "Alpha" },
		config = function()
			require("configs.alpha")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		lazy = true,
		ft = {
			"html",
			"css",
			"sass",
			"vim",
			"lua",
			"javascript",
			"typescript",
			"dosini",
			"ini",
			"conf",
			"json",
			"cfg",
		},
		cmd = { "ColorizerToggle" },
		config = function()
			require("colorizer").setup()
			vim.cmd("ColorizerAttachToBuffer")
		end,
	},
	{
		"JA-Bar/barbar.nvim",
		lazy = true,
		event = "BufAdd",
		dependencies = { "nvim-web-devicons" },
		config = function()
			require("configs.barbar")
		end,
	},
	{
		"kyazdani42/nvim-web-devicons",
		lazy = true,
		event = "VimEnter",
		config = function()
			require("configs.devicons")
		end,
	},
	{
		"folke/zen-mode.nvim",
		lazy = true,
		dependencies = { "twilight.nvim" },
		cmd = "ZenMode",
		config = function()
			require("configs.zen")
		end,
	},
	{
		"folke/twilight.nvim",
		lazy = true,
		cmd = "Twilight",
		config = function()
			require("twilight").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		cmd = {
			"IndentBlanklineEnable",
			"IndentBlanklineToggle",
		},
		config = function()
			require("configs.indent")
		end,
	},
	{
		"declancm/cinnamon.nvim",
		lazy = true,
		event = "WinScrolled",
		opts = {
			default_keymaps = true,
			centered = true,
			disable = false,
			scroll_limit = 150,
			hide_cursor = true,
			default_delay = 7,
		},
	},
	{
		"stevearc/dressing.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("configs.dressing")
		end,
	},
	--[[ {
		"typicode/bg.nvim",
		lazy = true,
		event = "BufRead",
	}, ]]
	--[[ {
		"sunjon/shade.nvim",
		lazy = true,
		event = "BufEnter",
		opts = {
			overlay_opacity = 50,
			opacity_step = 1,
			keys = {
				brightness_up = "<C-Up>",
				brightness_down = "<C-Down>",
			},
		},
	}, ]]
}
