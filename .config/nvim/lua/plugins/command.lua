return {
    {
		"gelguy/wilder.nvim",
		lazy = true,
		build = ":UpdateRemotePlugins",
		event = "CmdlineEnter",
		config = function()
			vim.cmd([[ source $HOME/.config/nvim/lua/configs/wilder.vim ]])
		end,
	},
}
