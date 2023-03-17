return {
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		ft = "python",
		config = function()
			require("dap-python").setup("/usr/bin/python3", { justMyCode = false })
		end,
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		ft = "python",
		config = function()
			require("configs.dap")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
		dependencies = "nvim-dap",
		config = function()
			require("nvim-dap-virtual-text").setup({})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = { "mfussenegger/nvim-dap" },
	},
	--[[ {
		"gerw/vim-HiLinkTrace",
	}, ]]
}
