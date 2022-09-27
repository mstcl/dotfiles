---@diagnostic disable: undefined-global
-- :.config/nvim/lua/plugins.lua
-- vim: set foldmethod=marker foldenable foldlevel=0 noexpandtab:
return require("packer").startup({
	function()
		-- -_-_-_-_- META -_-_-_-_-
		-- IMPATIENT: faster startup time {{{
		use({
			"lewis6991/impatient.nvim",
			rocks = "mpack",
		})
		-- }}}
		-- PACKER: package manager {{{
		use({
			"wbthomason/packer.nvim",
			event = "VimEnter",
			config = function()
				require("utils.mappings")
				vim.cmd([[ source $HOME/.config/nvim/colors/despair.lua ]])
			end,
		})
		-- }}}
		-- -_-_-_ NAVIGATION -_-_-_
		-- TREE: sidebar to navigate files {{{
		use({
			"kyazdani42/nvim-tree.lua",
			event = "BufWinEnter",
			config = function()
				require("configs.tree")
			end,
		})
		--}}}
		-- TELESCOPE: fuzzy searcher {{{
		use({
			"nvim-telescope/telescope.nvim",
			module = "telescope",
			cmd = { "Telescope" },
			config = function()
				require("configs.telescope")
			end,
			requires = {
				{
					"nvim-lua/plenary.nvim",
				},
				{
					"nvim-telescope/telescope-file-browser.nvim",
					module = "telescope",
				},
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					cmd = "Telescope",
					run = "make",
				},
				{
					"jvgrootveld/telescope-zoxide",
					cmd = "Telescope",
				},
				{
					"rudism/telescope-dict.nvim",
					filetype = { "markdown", "tex" },
				},
			},
		})
		-- }}}
		-- -_-_-_- AESTHETIC -_-_-_
		-- GALAXYLINE: fancy status line {{{
		use({
			"NTBBloodbath/galaxyline.nvim",
			event = "VimEnter",
			branch = "main",
			wants = "nvim-web-devicons",
			config = function()
				require("configs.statusline")
			end,
		})
		-- }}}
		-- ALPHA: splash screen in lua {{{
		use({
			"goolord/alpha-nvim",
			cmd = { "Alpha" },
			config = function()
				require("configs.alpha")
			end,
		})
		-- }}}
		-- COLORIZER: add a colored background for color codes {{{
		use({
			"norcalli/nvim-colorizer.lua",
			ft = {
				"html",
				"css",
				"sass",
				"vim",
				"lua",
				"javascript",
				"typescript",
				"dosini",
				"ini",
				"conf",
				"json",
				"cfg",
			},
			cmd = { "ColorizerToggle" },
			config = function()
				require("colorizer").setup()
				vim.cmd("ColorizerAttachToBuffer")
			end,
		})
		-- }}}
		-- BARBAR: fancy buffer bar {{{
		use({
			"JA-Bar/barbar.nvim",
			event = "BufEnter",
			wants = "nvim-web-devicons",
			config = function()
				require("configs.barbar")
			end,
		})
		use("nvim-lua/lsp-status.nvim")
		-- }}}
		-- WEB-DEVICONS: icons for bars {{{
		use({
			"kyazdani42/nvim-web-devicons",
			event = "VimEnter",
			config = function()
				require("configs.devicons")
			end,
		})
		-- }}}
		-- ZEN-MODE: lightweight goyo replacement {{{
		use({
			"folke/zen-mode.nvim",
			wants = "twilight.nvim",
			cmd = "ZenMode",
			config = function()
				require("configs.zen")
			end,
		})
		-- }}}
		-- TWILIGHT: limelight replacement {{{
		use({
			"folke/twilight.nvim",
			cmd = "Twilight",
			config = function()
				require("twilight").setup()
			end,
		})
		--}}}
		-- INDENT-BLANKLINE: display indent lines (even on blank lines) {{{
		use({
			"lukas-reineke/indent-blankline.nvim",
			cmd = {
				"IndentBlanklineEnable",
				"IndentBlanklineToggle",
			},
			config = function()
				require("configs.indent")
			end,
		})
		-- }}}
		-- NEOSCROLL: smooth scrolling {{{
		use({
			"karb94/neoscroll.nvim",
			event = "WinScrolled",
			config = function()
				require("configs.neoscroll")
			end,
		})
		-- }}}
		-- DRESSING: implement built-in input and select {{{
		use({
			"stevearc/dressing.nvim",
			config = function()
				require("configs.dressing")
			end,
		})
		-- }}}
		-- -_-_-_ TREESITTER -_-_-_
		-- TREESITTER: syntax aware utilities {{{
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("configs.treesitter")
			end,
		})
		-- }}}
		-- TS-RAINBOW: treesitter rainbow parentheses {{{
		use({
			"p00f/nvim-ts-rainbow",
			event = "BufRead",
		})
		-- }}}
		-- TS-PLAYGROUND: see treesitter syntax tree {{{
		use({
			"nvim-treesitter/playground",
			cmd = { "TSPlaygroundToggle" },
		})
		-- }}}
		-- -_-_-_ COMPLETION -_-_-_
		-- ULTISNIPS (VS): snippets utility {{{
		use({
			"sirver/ultisnips",
			event = "InsertEnter",
			setup = function()
				vim.g.UltiSnipsExpandTrigger = "<nop>"
				vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
				vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
				vim.g.UltiSnipsRemoveSelectModeMappings = 0
			end,
			config = function()
				vim.cmd('let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/ultisnips"]')
			end,
		})
		-- }}}
		-- CMP: popup completion {{{
		use({
			"hrsh7th/nvim-cmp",
			after = "ultisnips",
			config = function()
				require("configs.cmp")
			end,
		})
		-- }}}
		-- CMP-SOURCES: sources for nvim-cmp {{{
		use({
			"quangnguyen30192/cmp-nvim-ultisnips",
			after = "nvim-cmp",
		})
		use({
			"hrsh7th/cmp-nvim-lsp",
			after = "nvim-cmp",
		})
		use({
			"hrsh7th/cmp-path",
			after = "cmp-nvim-lsp",
		})
		use({
			"hrsh7th/cmp-buffer",
			after = "cmp-path",
		})
		-- }}}
		-- -_-_-_-_ COMMAND -_-_-_-
		-- WILDER (VS): vim command fuzzy popup completion {{{
		use({
			"gelguy/wilder.nvim",
			run = ":UpdateRemotePlugins",
			event = "CmdlineEnter",
			config = function()
				vim.cmd([[ source $HOME/.config/nvim/lua/configs/wilder.vim ]])
			end,
		})
		-- }}}
		-- -_-_-_- TERMINAL -_-_-_-
		-- FTERM: Floating terminal {{{
		use({
			"numToStr/FTerm.nvim",
			module = "FTerm",
			config = function()
				require("configs.fterm")
			end,
		})
		-- }}}
		-- -_-_-_-_-_ GIT -_-_-_-_-
		-- GITSIGNS: display git diffs in sign column {{{
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("configs.gitsigns")
			end,
		})
		-- }}}
		-- DIFFVIEW: neat way to view diffs within vim {{{
		use({
			"sindrets/diffview.nvim",
			cmd = {
				"DiffviewOpen",
				"DiffviewFileHistory",
			},
			config = function()
				require("configs.diffview")
			end,
		})
		-- }}}
		-- -_-_-_-_-_ LSP -_-_-_-_-
		-- LSP-CONFIG: native lsp configuration {{{
		use({
			"neovim/nvim-lspconfig",
			event = "BufRead",
			after = "cmp-nvim-lsp",
			config = function()
				require("configs.lspconfig")
			end,
		})
		--- }}}
		-- LSP-SIGNATURE: async signature helper {{{
		use({
			"ray-x/lsp_signature.nvim",
			event = "InsertEnter",
		})
		-- }}}
		-- SYMBOLS-OUTLINE: displays code outline panel {{{
		use({
			"simrat39/symbols-outline.nvim",
			cmd = {
				"SymbolsOutline",
				"SymbolsOutlineOpen",
				"SymbolsOutlineClose",
			},
			setup = function()
				require("configs.outline")
			end,
		})
		-- }}}
		-- GLOW-HOVER: uses glow for lsp hover diagnostics {{{
		--[[ use({
			"JASONews/glow-hover",
			config = function()
				require("glow-hover").setup({
					max_width = 50,
					padding = 10,
					border = "rounded",
					glow_path = "glow",
				})
			end,
		}) ]]
		-- }}}
		-- TEXLABCONFIG: texlab stuff {{{
		use({
			"f3fora/nvim-texlabconfig",
			config = function()
				require("texlabconfig").setup()
			end,
			ft = { "tex", "bib" },
			cmd = { "TexlabInverseSearch" },
		})
		-- }}}
		-- TROUBLE: pretty list of diagnostics {{{
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("configs.trouble")
			end,
		})
		-- }}}
		-- NULL-LS: LSP goodies {{{
		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			config = function()
				require("configs.null")
			end,
		})
		-- }}}
		-- LSP-LINES: replace virtual text with diagnostic lines {{{
		--[[ use({
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			event = "BufRead",
			config = function()
				require("lsp_lines").register_lsp_virtual_lines()
			end,
		}) ]]
		-- }}}
		-- -_-_-_-_ EDITING -_-_-_-_
		-- KOMMENTARY: comment keymaps {{{
		use({
			"b3nj5m1n/kommentary",
			event = "CursorMoved",
			config = function()
				require("configs.comment")
			end,
		})
		-- }}}
		-- BETTER-ESCAPE: use alphanumeric escape mappings without delay {{{
		use({
			"max397574/better-escape.nvim",
			event = "InsertEnter",
			config = function()
				require("configs.escape")
			end,
		})
		-- }}}
		-- AUTOPAIRS (VS): auto insert pairs {{{
		use({
			"LunarWatcher/auto-pairs",
			event = "BufEnter",
			config = function()
				require("configs.autopairs")
			end,
		})
		-- }}}
		-- EASYALIGN (VS): auto align by delimiters {{{
		use({
			"junegunn/vim-easy-align",
			keys = "<Plug>(EasyAlign)",
		})
		-- }}}
		-- UNDOTREE: display a panel with non-linear undo branches {{{
		use({
			"mbbill/undotree",
			cmd = "UndotreeToggle",
			config = function()
				require("configs.undotree")
			end,
		})
		-- }}}
		-- SURROUND: lua surround with brackets and co. {{{
		use({
			"ur4ltz/surround.nvim",
			event = "BufEnter",
			config = function()
				require("surround").setup({
					mappings_style = "surround",
					space_on_alias = false,
					space_on_closing_char = false,
				})
			end,
		})
		-- }}}
		-- REGISTERS: hover floating window showing register {{{
		use({
			"tversteeg/registers.nvim",
			event = "BufEnter",
			config = function()
				vim.g.registers_show_empty_registers = 0
				vim.g.registers_hide_only_whitespace = 1
				vim.g.registers_window_border = "rounded"
				vim.g.registers_window_max_width = 50
				vim.g.registers_window_min_height = 3
			end,
		})
		-- }}}
		-- TABULAR (VS): Format pretty tables {{{
		use({
			"godlygeek/tabular",
			after = { "vim-markdown" },
			-- ft = {"markdown"},
		})
		-- }}}
		-- MARKS: show marks in sign column {{{
		use({
			"chentau/marks.nvim",
			ft = "markdown",
			config = function()
				require("configs.marks")
			end,
		})
		-- }}}
		-- GUESS-INDENT: guess indentation {{{
		use({
			"nmac427/guess-indent.nvim",
			event = "BufEnter",
			config = function()
				require("guess-indent").setup()
			end,
		})
		-- }}}
		-- -_-_-_- FILETYPES -_-_-_-
		-- TEX CONCEAL (VS): Further concealment of MathZone for tex files {{{
		use({
			"KeitaNakamura/tex-conceal.vim",
			ft = { "tex" },
		})
		-- }}}
		-- MARKDOWN (VS): better markdown syntax {{{
		use({
			"hhn-pham/vim-markdown",
			branch = "main",
			ft = { "markdown" },
			setup = function()
				require("configs.markdown")
			end,
			wants = "tabular",
		})
		-- }}}
		-- SXHKD (VS): syntax for sxhkdrc {{{
		use({
			"kovetskiy/sxhkd-vim",
			ft = "sxhkd",
		})
		-- }}}
		-- -_-_-_-_ FOLDING -_-_-_-_
		-- FOLDSIGNS: LSP signs for folded code {{{
		use({
			"lewis6991/foldsigns.nvim",
			event = "BufRead",
			config = function()
				require("foldsigns").setup({
					exclude = { "LspDiagnosticsSignWarning" },
				})
			end,
		})
		-- }}}
		-- CLEANFOLD: Minimal foldtext {{{
		--[[ use({
			"lewis6991/cleanfold.nvim",
			commit = "ed54df0",
			event = "BufRead",
			config = function()
				require("cleanfold").setup()
			end,
		}) ]]
		-- }}}
		-- -_-_-_-_- DAP _-_-_-_-_-_
		-- DAP-PYTHON: Debugging python {{{
		use({
			"mfussenegger/nvim-dap-python",
			after = "nvim-dap",
			config = function()
				require("dap-python").setup(
					"/home/lckdscl/.local/share/applications/debugpy/bin/python",
					{ justMyCode = false }
				)
			end,
		})
		-- }}}
		-- DAP: API for debuggers {{{
		use({
			"mfussenegger/nvim-dap",
			module = "dap",
			config = function()
				require("configs.dap")
			end,
		})
		-- }}}
		-- DAP-VIRTUAL-TEXT: Display variable expressions as virtual text {{{
		use({
			"theHamsta/nvim-dap-virtual-text",
			after = "nvim-dap",
			config = function()
				require("nvim-dap-virtual-text").setup()
			end,
		})
		-- }}}
		-- DAP-UI: Sane ui for debuggers {{{
		use({
			"rcarriga/nvim-dap-ui",
			module = "dapui",
			requires = { "mfussenegger/nvim-dap" },
		})
		-- }}}
		-- HILINKTRACE: See current highlight group {{{
		--[[ use({
			"gerw/vim-HiLinkTrace",
		}) ]]
		-- }}}
	end,
	-- PACKER OPTIONS {{{
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
		profile = {
			enable = true,
			threshold = 0.2,
		},
	},
	-- }}}
})
