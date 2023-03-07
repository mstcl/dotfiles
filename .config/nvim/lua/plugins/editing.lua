return {
	{
		"b3nj5m1n/kommentary",
		lazy = true,
		event = "CursorMoved",
		config = function()
			require("configs.comment")
		end,
	},
	{
		"max397574/better-escape.nvim",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("configs.escape")
		end,
	},
	{
		"LunarWatcher/auto-pairs",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("configs.autopairs")
		end,
	},
	{
		"junegunn/vim-easy-align",
		lazy = true,
		keys = "<Plug>(EasyAlign)",
	},
	{
		"mbbill/undotree",
		lazy = true,
		cmd = "UndotreeToggle",
		config = function()
			require("configs.undotree")
		end,
	},
	{
		"ur4ltz/surround.nvim",
		lazy = true,
		keys = {
			{ "s", mode = { "n", "v" } },
		},
		config = function()
			require("surround").setup({
				mappings_style = "surround",
				space_on_alias = false,
				space_on_closing_char = false,
			})
		end,
	},
	{
		"tversteeg/registers.nvim",
		lazy = true,
		cmd = "Registers",
		keys = {
			{ '"', mode = { "n", "v" } },
			{ "<C-R>", mode = "i" },
		},
		config = function()
			require("configs.registers")
		end,
	},
	{
		"godlygeek/tabular",
		lazy = true,
		dependencies = { "vim-markdown" },
		-- ft = {"markdown"},
	},
	{
		"chentoast/marks.nvim",
		lazy = true,
		ft = "markdown",
		config = function()
			require("configs.marks")
		end,
	},
	{
		"nmac427/guess-indent.nvim",
		lazy = true,
		event = "BufRead",
		config = function()
			require("guess-indent").setup()
		end,
	},
	--[[ {
		"tzachar/local-highlight.nvim",
		lazy = true,
		ft = { "python", "cpp", "lua", "bash", "sh" },
		config = function()
			require("local-highlight").setup({
				file_types = { "python", "cpp", "lua", "bash", "sh" },
				hlgroup = "LocalHighlight",
				cw_hlgroup = "LocalHighlight",
			})
		end,
	}, ]]
	{
		"gbprod/stay-in-place.nvim",
		lazy = true,
		event = "CursorMoved",
		config = function()
			require("stay-in-place").setup({})
		end,
	},
}
