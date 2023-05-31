return {
	--[[ {
			"nvim-lua/lsp-status.nvim",
			lazy = true,
	}, ]]
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = "BufRead",
		dependencies = { "cmp-nvim-lsp" },
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		lazy = true,
		event = "LspAttach",
	},
	--[[ {
		"VidocqH/lsp-lens.nvim",
		lazy = true,
	}, ]]
	{
		"utilyre/barbecue.nvim",
		lazy = true,
		version = "*",
        even = "BufEnter",
		branch = "main",
		dependencies = { "nvim-web-devicons", "smiteshp/nvim-navic" },
		config = function()
			require("configs.barbecue")
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		lazy = true,
		cmd = {
			"SymbolsOutline",
			"SymbolsOutlineOpen",
			"SymbolsOutlineClose",
		},
		config = function()
			require("configs.outline")
		end,
	},
	--[[ {
			"JASONews/glow-hover",
			lazy = true,
			config = function()
				require("glow-hover").setup({
					max_width = 50,
					padding = 10,
					border = "single",
					glow_path = "glow",
				}
			end,
	}, ]]
	{
		"f3fora/nvim-texlabconfig",
		lazy = true,
		config = function()
			require("texlabconfig").setup()
		end,
		ft = { "tex", "bib" },
		build = "go build",
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		event = "LspAttach",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("configs.trouble")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = true,
		event = "BufRead",
		config = function()
			require("configs.null")
		end,
	},
	--[[ {
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			lazy = true,
			event = "BufRead",
			config = function()
				require("lsp_lines").register_lsp_virtual_lines()
			end,
	}, ]]
	--[[ {
			"williamboman/mason.nvim",
			lazy = true,
			config = function()
				require("mason").setup()
			end,
	}, ]]
	--[[ {
		"zbirenbaum/neodim",
		lazy = true,
		event = "LspAttach",
		config = function()
			require("neodim").setup({
				alpha = 0.75,
				blend_color = "#f5f5f5",
				update_in_insert = {
					enable = true,
					delay = 100,
				},
				hide = {
					virtual_text = true,
					signs = true,
					underline = true,
				},
			})
		end,
	}, ]]
	{
		"dnlhc/glance.nvim",
		lazy = true,
		event = "LspAttach",
		config = function()
			require('glance').setup({
				list = {
					width = 0.5
				}
			})
		end,
	},
}
