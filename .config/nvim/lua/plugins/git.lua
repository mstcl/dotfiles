return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.gitsigns")
		end,
	},
	{
		"sindrets/diffview.nvim",
		lazy = true,
		cmd = {
			"DiffviewOpen",
			"DiffviewFileHistory",
		},
		config = function()
			require("configs.diffview")
		end,
	},
}
