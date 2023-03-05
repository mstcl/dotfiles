-- vim: set foldmethod=marker foldenable foldlevel=0 noexpandtab:
require("lazy").setup({
	-- -_-_-_ NAVIGATION -_-_-_
	-- TREE: sidebar to navigate files {{{
	{
		"kyazdani42/nvim-tree.lua",
		lazy = true,
		event = "BufWinEnter",
		config = function()
			require("configs.tree")
		end,
	},
	--}}}
	-- TELESCOPE: fuzzy searcher {{{
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		config = function()
			require("configs.telescope")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"jvgrootveld/telescope-zoxide",
			{
				"rudism/telescope-dict.nvim",
				ft = { "markdown", "tex" },
			},
			{
				"nvim-telescope/telescope-frecency.nvim",
				dependencies = { "kkharji/sqlite.lua" },
			},
		},
	},
	--}}}
	-- -_-_-_- AESTHETIC -_-_-_
	-- GALAXYLINE: fancy status line {{{
	{
		"AkashKarnatak/galaxyline.nvim",
		lazy = true,
		event = "VimEnter",
		branch = "main",
		dependencies = { "nvim-web-devicons" },
		config = function()
			require("configs.statusline")
		end,
	},
	-- }}}
	-- ALPHA: splash screen in lua {{{
	{
		"goolord/alpha-nvim",
		lazy = true,
		cmd = { "Alpha" },
		config = function()
			require("configs.alpha")
		end,
	},
	-- }}}
	-- COLORIZER: add a colored background for color codes {{{
	{
		"norcalli/nvim-colorizer.lua",
		lazy = true,
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
	},
	-- }}}
	-- BARBAR: fancy buffer bar {{{
	{
		"JA-Bar/barbar.nvim",
		lazy = true,
		event = "BufEnter",
		dependencies = { "nvim-web-devicons" },
		config = function()
			require("configs.barbar")
		end,
	},
	-- }}}
	-- WEB-DEVICONS: icons for bars {{{
	{
		"kyazdani42/nvim-web-devicons",
		lazy = true,
		event = "VimEnter",
		config = function()
			require("configs.devicons")
		end,
	},
	-- }}}
	-- ZEN-MODE: lightweight goyo replacement {{{
	{
		"folke/zen-mode.nvim",
		lazy = true,
		dependencies = { "twilight.nvim" },
		cmd = "ZenMode",
		config = function()
			require("configs.zen")
		end,
	},
	-- }}}
	-- TWILIGHT: limelight replacement {{{
	{
		"folke/twilight.nvim",
		lazy = true,
		cmd = "Twilight",
		config = function()
			require("twilight").setup()
		end,
	},
	--}}}
	-- INDENT-BLANKLINE: display indent lines (even on blank lines) {{{
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		cmd = {
			"IndentBlanklineEnable",
			"IndentBlanklineToggle",
		},
		config = function()
			require("configs.indent")
		end,
	},
	-- }}}
	-- NEOSCROLL: smooth scrolling {{{
	{
		"karb94/neoscroll.nvim",
		lazy = true,
		event = "WinScrolled",
		config = function()
			require("configs.neoscroll")
		end,
	},
	-- }}}
	-- DRESSING: implement built-in input and select {{{
	{
		"stevearc/dressing.nvim",
		config = function()
			require("configs.dressing")
		end,
	},
	-- }}}
	-- BG: implement built-in input and select {{{
	{
		"typicode/bg.nvim"
	},
	-- }}}

	-- -_-_-_ TREESITTER -_-_-_
-- TREESITTER: syntax aware utilities {{{
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		cmd = {"NvimTreeToggle"},
		build = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
	},
-- }}}
	-- TS-RAINBOW: treesitter rainbow parentheses {{{
	{
		"p00f/nvim-ts-rainbow",
		lazy = true,
		event = "BufRead",
	},
	-- }}}
	-- TS-PLAYGROUND: see treesitter syntax tree {{{
	{
		"nvim-treesitter/playground",
		lazy = true,
		cmd = "TSPlaygroundToggle",
	},
	-- }}}
	-- TS-CONTEXT: context in code {{{
	-- ({ "nvim-treesitter/nvim-treesitter-context", event = "BufRead" })
	-- }}}
	-- -_-_-_ COMPLETION -_-_-_
	-- ULTISNIPS (VS): snippets utility {{{
	{
		"sirver/ultisnips",
		lazy = true,
		event = "InsertEnter",
		init = function()
			vim.g.UltiSnipsExpandTrigger = "<nop>"
			vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
			vim.g.UltiSnipsRemoveSelectModeMappings = 0
		end,
		config = function()
			vim.cmd('let g:UltiSnipsSnippetDirectories=["/home/lckdscl/.config/nvim/ultisnips"]')
		end,
	},
	-- }}}
	-- CMP: popup completion {{{
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		dependencies = {
			"ultisnips"
		},
		config = function()
			require("configs.cmp")
		end,
	},
	-- }}}
	-- CMP-SOURCES: sources for nvim-cmp {{{
	{
		"quangnguyen30192/cmp-nvim-ultisnips",
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		dependencies = { "nvim-cmp" },
	},
	{
		"hrsh7th/cmp-path",
		dependencies = { "cmp-nvim-lsp" },
	},
	{
		"hrsh7th/cmp-buffer",
		dependencies = "cmp-path",
	},
	-- }}}
	-- -_-_-_-_ COMMAND -_-_-_-
	-- WILDER (VS): vim command fuzzy popup completion {{{
	{
		"gelguy/wilder.nvim",
		lazy = true,
		build = ":UpdateRemotePlugins",
		event = "CmdlineEnter",
		config = function()
			vim.cmd([[ source $HOME/.config/nvim/lua/configs/wilder.vim ]])
		end,
	},
	-- }}}
	-- -_-_-_- TERMINAL -_-_-_-
	-- FTERM: Floating terminal {{{
	{
		"numToStr/FTerm.nvim",
		lazy = true,
		config = function()
			require("configs.fterm")
		end,
	},
	-- }}}
	-- -_-_-_-_-_ GIT -_-_-_-_-
	-- GITSIGNS: display git diffs in sign column {{{
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.gitsigns")
		end,
	},
	-- }}}
	-- DIFFVIEW: neat way to view diffs within vim {{{
	{
		"sindrets/diffview.nvim",
		lazy = true,
		cmd = {
			"DiffviewOpen",
			"DiffviewFileHistory",
		},
		config = function()
			require("configs.diffview")
		end,
	},
	-- }}}
	-- -_-_-_-_-_ LSP -_-_-_-_-
	-- LSP-STATUS: statusline lsp components {{{
	--[[ {
			"nvim-lua/lsp-status.nvim",
			lazy = true,
		}, ]]
	-- }}}
	-- LSP-CONFIG: native lsp configuration {{{
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = "BufRead",
		dependencies = { "cmp-nvim-lsp" },
		config = function()
			require("configs.lspconfig")
		end,
	},
	--- }}}
	-- LSP-SIGNATURE: async signature helper {{{
	{
		"ray-x/lsp_signature.nvim",
		lazy = true,
		event = "InsertEnter",
	},
	-- }}}
	-- BARBECUE: statusline with code context {{{
	{
		"utilyre/barbecue.nvim",
		-- branch = "dev",
		dependencies = { "nvim-web-devicons", "smiteshp/nvim-navic" },
		config = function()
			vim.cmd([[ source $HOME/.config/nvim/colors/despair.lua ]])
			require("configs.barbecue")
		end,
	},
	-- }}}
	-- SYMBOLS-OUTLINE: displays code outline panel {{{
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
	-- }}}
	-- GLOW-HOVER: s glow for lsp hover diagnostics {{{
	--[[ {
			"JASONews/glow-hover",
			lazy = true,
			config = function()
				require("glow-hover").setup({
					max_width = 50,
					padding = 10,
					border = "rounded",
					glow_path = "glow",
				}
			end,
		}, ]]
	-- }}}
	-- TEXLABCONFIG: texlab stuff {{{
	{
		"f3fora/nvim-texlabconfig",
		lazy = true,
		config = function()
			require("texlabconfig").setup()
		end,
		ft = { "tex", "bib" },
		build = "go build",
	},
	-- }}}
	-- TROUBLE: pretty list of diagnostics {{{
	{
		"folke/trouble.nvim",
		lazy = true,
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("configs.trouble")
		end,
	},
	-- }}}
	-- NULL-LS: LSP goodies {{{
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = true,
		event = "BufRead",
		config = function()
			require("configs.null")
		end,
	},
	-- }}}
	-- LSP-LINES: replace virtual text with diagnostic lines {{{
	--[[ {
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			lazy = true,
			event = "BufRead",
			config = function()
				require("lsp_lines").register_lsp_virtual_lines()
			end,
		}, ]]
	-- }}}
	-- MASON: LSP, linter, etc. manager {{{
	--[[ {
			"williamboman/mason.nvim",
			lazy = true,
			config = function()
				require("mason").setup()
			end,
		}, ]]
	-- }}}
	-- -_-_-_-_ EDITING -_-_-_-_
	-- KOMMENTARY: comment keymaps {{{
	{
		"b3nj5m1n/kommentary",
		lazy = true,
		event = "CursorMoved",
		config = function()
			require("configs.comment")
		end,
	},
	-- }}}
	-- BETTER-ESCAPE:  alphanumeric escape mappings without delay {{{
	{
		"max397574/better-escape.nvim",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("configs.escape")
		end,
	},
	-- }}}
	-- AUTOPAIRS (VS): auto insert pairs {{{
	{
		"LunarWatcher/auto-pairs",
		lazy = true,
		event = "BufEnter",
		config = function()
			require("configs.autopairs")
		end,
	},
	-- }}}
	-- EASYALIGN (VS): auto align by delimiters {{{
	{
		"junegunn/vim-easy-align",
		lazy = true,
		keys = "<Plug>(EasyAlign)",
	},
	-- }}}
	-- UNDOTREE: display a panel with non-linear undo branches {{{
	{
		"mbbill/undotree",
		lazy = true,
		cmd = "UndotreeToggle",
		config = function()
			require("configs.undotree")
		end,
	},
	-- }}}
	-- SURROUND: lua surround with brackets and co. {{{
	{
		"ur4ltz/surround.nvim",
		lazy = true,
		event = "BufEnter",
		config = function()
			require("surround").setup({
				mappings_style = "surround",
				space_on_alias = false,
				space_on_closing_char = false,
			})
		end,
	},
	-- }}}
	-- REGISTERS: hover floating window showing register {{{
	{
		"tversteeg/registers.nvim",
		lazy = true,
		event = "BufEnter",
		config = function()
			vim.g.registers_show_empty_registers = 0
			vim.g.registers_hide_only_whitespace = 1
			vim.g.registers_window_border = "rounded"
			vim.g.registers_window_max_width = 50
			vim.g.registers_window_min_height = 3
		end,
	},
	-- }}}
	-- TABULAR (VS): Format pretty tables {{{
	{
		"godlygeek/tabular",
		lazy = true,
		dependencies = { "vim-markdown" },
		-- ft = {"markdown"},
	},
	-- }}}
	-- MARKS: show marks in sign column {{{
	{
		"chentoast/marks.nvim",
		lazy = true,
		ft = "markdown",
		config = function()
			require("configs.marks")
		end,
	},
	-- }}}
	-- GUESS-INDENT: guess indentation {{{
	{
		"nmac427/guess-indent.nvim",
		lazy = true,
		event = "BufEnter",
		config = function()
			require("guess-indent").setup()
		end,
	},
	-- }}}
	-- LOCAL-HIGHLIGHT: highlight word under cursor {{{
	{
		"tzachar/local-highlight.nvim",
		lazy = true,
		event = "BufEnter",
		config = function()
			require("local-highlight").setup({
				file_types = { "python", "cpp", "lua", "bash", "sh" },
				hlgroup = "TSDefinitionUsage",
				cw_hlgroup = "TSDefinitionUsage",
			})
		end,
	},
	-- }}}
	-- -_-_-_- FILETYPES -_-_-_-
	-- TEX CONCEAL (VS): Further concealment of MathZone for tex files {{{
	{
		"KeitaNakamura/tex-conceal.vim",
		lazy = true,
		ft = { "tex" },
	},
	-- }}}
	-- MARKDOWN (VS): better markdown syntax {{{
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
	-- }}}
	-- SXHKD (VS): syntax for sxhkdrc {{{
	{
		"kovetskiy/sxhkd-vim",
		lazy = true,
		ft = "sxhkd",
	},
	-- }}}
	-- -_-_-_-_ FOLDING -_-_-_-_
	-- FOLDSIGNS: LSP signs for folded code {{{
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
	-- }}}
	-- CLEANFOLD: Minimal foldtext {{{
	--[[ {
			"lewis6991/cleanfold.nvim",
			lazy = true,
			commit = "ed54df0",
			event = "BufRead",
			config = function()
				require("cleanfold").setup()
			end,
		}, ]]
	-- }}}
	-- UFO: Nice folding {{{
		{
			"kevinhwang91/nvim-ufo",
			lazy=true,
			dependencies={'kevinhwang91/promise-async', 'neovim/nvim-lspconfig'},
			event = "BufRead",
			config = function()
				require("configs.ufo")
			end,
		},
	-- }}}
	-- -_-_-_-_- DAP _-_-_-_-_-_
	-- DAP-PYTHON: Debugging python {{{
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		dependencies = "nvim-dap",
		config = function()
			require("dap-python").setup("/usr/bin/python3", { justMyCode = false })
		end,
	},
	-- }}}
	-- DAP: API for debuggers {{{
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			require("configs.dap")
		end,
	},
	-- }}}
	-- DAP-VIRTUAL-TEXT: Display variable expressions as virtual text {{{
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
		dependencies = "nvim-dap",
		config = function()
			require("nvim-dap-virtual-text").setup({})
		end,
	},
	-- }}}
	-- DAP-UI: Sane ui for debuggers {{{
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		requires = { "mfussenegger/nvim-dap" },
	},
	-- }}}
	-- HILINKTRACE: See current highlight group {{{
	--[[ {
			"gerw/vim-HiLinkTrace",
		}, ]]
	-- }}}
})
