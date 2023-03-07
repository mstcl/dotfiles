return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = { "BufWinEnter" },
		build = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
			{
				"nvim-treesitter/playground",
				cmd = "TSPlaygroundToggle",
			},
			"JoosepAlviste/nvim-ts-context-commentstring",
			{
				"m-demare/hlargs.nvim",
				config = function()
					require("hlargs").setup({ color = "#a77212" })
				end,
			},
		},
	},
	-- { "nvim-treesitter/nvim-treesitter-context", event = "BufRead" }
}
