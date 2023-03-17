return {
    {
		"gelguy/wilder.nvim",
		lazy = true,
		build = ":UpdateRemotePlugins",
		event = "CmdlineEnter",
		config = function()
			require('configs.wilder')
		end,
	},
}
