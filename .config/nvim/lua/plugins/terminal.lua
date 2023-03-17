return {
	{
		"numToStr/FTerm.nvim",
		lazy = true,
		config = function()
			require("configs.fterm")
		end,
	},
	--[[ {
		'willothy/flatten.nvim',
		config = true,
		-- or pass configuration with
		-- opts = {  }
		-- Ensure that it runs first to minimize delay when opening file from terminal
		lazy = false,
		priority = 1001,
	} ]]
}
