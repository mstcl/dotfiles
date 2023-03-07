return {
	{
		"KeitaNakamura/tex-conceal.vim",
		lazy = true,
		ft = { "tex" },
	},
	{
		"hhn-pham/vim-markdown",
		lazy = true,
		branch = "main",
		ft = { "markdown" },
		init = function()
			require("configs.markdown")
		end,
		wants = "tabular",
	},
	{
		"kovetskiy/sxhkd-vim",
		lazy = true,
		ft = "sxhkd",
	},
}
