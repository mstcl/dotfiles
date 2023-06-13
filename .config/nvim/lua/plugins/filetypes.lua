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
	{
		"nvim-orgmode/orgmode",
		config = function()
			require("orgmode").setup{
				org_agenda_files = { "/mnt/sshftps/orgzly/Main.org", "/mnt/sshftps/shared/orgzly/*" },
            }
			require("orgmode").setup_ts_grammar()
		end,
	},
}
