return {
	{
		"lewis6991/foldsigns.nvim",
		lazy = true,
		event = "BufRead",
		config = function()
			require("foldsigns").setup({
				exclude = { "LspDiagnosticsSignWarning" },
			})
		end,
	},
	--[[ {
			"lewis6991/cleanfold.nvim",
			lazy = true,
			commit = "ed54df0",
			event = "BufRead",
			config = function()
				require("cleanfold").setup()
			end,
	}, ]]
	{
		"kevinhwang91/nvim-ufo",
		lazy = true,
		event = "VeryLazy",
		dependencies = { "kevinhwang91/promise-async", "neovim/nvim-lspconfig" },
		config = function()
			require("configs.ufo")
		end,
	},
	--[[ {
		"tmhedberg/SimpylFold",
		lazy = true,
		ft = "python",
	} ]]
}
