-- :.config/nvim/lua/plugins.lua
-- vim: set foldmethod=marker foldenable:
return require('packer').startup {
    function()
    -- IMPATIENT: faster startup time {{{
        use {
            'lewis6991/impatient.nvim',
            rocks = 'mpack'
        }
    -- }}}
    -- GALAXYLINE: fancy status line {{{
        use {
            "hhn-pham/galaxyline.nvim",
            -- event = 'VimEnter',
            branch = 'main',
            wants = 'nvim-web-devicons',
            config = function()
                require'configs.statusline'
            end,
        }
    -- }}}
    -- JUPYTEXT: convert jupyter notebook formats into other formats {{{
        use {
            'goerz/jupytext.vim',
            setup = function()
                vim.g.jupytext_fmt = 'py:percent'
                vim.cmd([[let g:jupytext_filetype_map = {'py': 'python'}]])
            end
        }
    -- }}}
    -- COLORIZER: add a colored background for color codes {{{
        use {
            "norcalli/nvim-colorizer.lua",
            ft = {"html", "css", "sass", "vim", "lua", "javascript", "typescript" ,"dosini" , "ini", "conf", "json", "cfg"},
            cmd = {"ColorizerToggle"},
            config = function()
                require("colorizer").setup()
                vim.cmd("ColorizerAttachToBuffer")
            end,
        }
    -- }}}
    -- TREE: sidebar to navigate files {{{
        use {
            'kyazdani42/nvim-tree.lua',
            -- event = 'BufWinEnter',
            setup = function()
                require'configs.tree'
            end,
        }
    --}}}
    -- BARBAR: fancy buffer bar {{{
        use {
            'JA-Bar/barbar.nvim',
            -- event = 'BufEnter',
            wants = 'nvim-web-devicons',
            config = function()
                require'configs.barbar'
            end
        }
    -- }}}
    -- PACKER: package manager {{{
        use {
            'wbthomason/packer.nvim',
            event = "VimEnter",
        }
    -- }}}
    -- WEB-DEVICONS: icons for bars {{{
        use {
            'kyazdani42/nvim-web-devicons',
            -- event = "VimEnter",
            config = function ()
                require'configs.devicons'
            end
        }
    -- }}}
    -- BETTER ESCAPE: use alphanumeric escape mappings without delay {{{
        use {
            "jdhao/better-escape.vim",
            event = "InsertEnter",
            config = function()
                vim.g.better_escape_interval = 300
                vim.g.better_escape_shortcut = {"jk"}
            end,
        }
    -- }}}
    -- COLORBUDDY: neovim themer in lua {{{
        use {
            'tjdevries/colorbuddy.nvim',
            after = "packer.nvim",
            config = function()
                require'configs.colorbuddy'
            end
            }
     -- }}}
    -- FUGITIVE: Git inside vim {{{
        use {
            'tpope/vim-fugitive',
            cmd = {
                "Git",
                "Gdiff",
                "Gdiffsplit",
                "Gvdiffsplit",
                "Gwrite",
                "Gw",
            },
        }
    -- }}}
     -- WILDER: vim command fuzzy popup completion {{{
        use {
            'gelguy/wilder.nvim',
            event = "BufEnter",
        }
     -- }}}
    -- TREESITTER: syntax aware utilities {{{
        use {
            "nvim-treesitter/nvim-treesitter",
            run = "TSUpdate",
            event = "BufRead",
            config = function()
                require'configs.treesitter'
            end
        }
    -- }}}
    -- TS-RAINBOW: treesitter rainbow parentheses {{{
        use {
            'p00f/nvim-ts-rainbow',
            event = "BufRead",
        }
    -- }}}
    -- COMPE: popup completion {{{
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require'configs.compe'
            end,
            wants = "ultisnips",
        }
    -- }}}
    -- ULTISNIPS: snippets utility {{{
        use {
            'sirver/ultisnips',
            event = 'InsertEnter',
            setup = function()
                vim.g.UltiSnipsExpandTrigger = '<nop>'
                vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
                vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
            end,
            config = function()
                vim.cmd('let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/ultisnips"]')
            end
            }
    -- }}}
    -- GITSIGNS: display git diffs in sign column {{{
        use {
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                require'configs.gitsigns'
            end,
        }
    -- }}}
    -- NEOSCROLL: smooth scrolling {{{
        use {
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
                require'configs.neoscroll'
            end,
        }
    -- }}}
    -- ZEN MODE: lightweight goyo replacement {{{
        use {
            "folke/zen-mode.nvim",
            wants = "twilight.nvim",
            cmd = "ZenMode",
            config = function()
                require'configs.zen'
            end
        }
    -- }}}
    -- TWILIGHT: limelight replacement {{{
        use {
            "folke/twilight.nvim",
            cmd = "Twilight",
            config = function()
                require("twilight").setup {}
            end
        }
    --}}}
    -- INDENT-BLANKLINE: display indent lines (even on blank lines) {{{
        use {
            "lukas-reineke/indent-blankline.nvim",
            cmd = {
                "IndentBlanklineEnable",
            },
            config = function()
                require'configs.indent'
            end
        }
    -- }}}
    -- LSPCONFIG: native lsp configuration {{{
        use {
            "neovim/nvim-lspconfig",
            event = "BufRead",
            config = function()
                require'configs.lspconfig'
            end
        }
    --- }}}
    -- GRAMMAR GUARD: lsp for latex and markdown {{{
        use {
            "brymer-meneses/grammar-guard.nvim",
            wants = "nvim-lspconfig",
        }
    -- }}}
    -- KOMMENTARY: comment keymaps {{{
        use {
            "b3nj5m1n/kommentary",
            event = "CursorMoved",
            config = function ()
                vim.g.kommentary_create_default_mappings = false
                require('kommentary.config').configure_language("default", {
                    ignore_whitespace = true,
                })
            end
        }
    -- }}}
    -- AUTOPAIRS: auto insert pairs {{{
        use {
            'LunarWatcher/auto-pairs',
            -- event = "BufEnter",
            config = function ()
                require'configs.autopairs'
            end,
        }
    -- }}}
    -- EASYALIGN: auto align by delimiters {{{
        use {
            'junegunn/vim-easy-align',
            keys = "<Plug>(EasyAlign)",
        }
    -- }}}
    -- UNDOTREE: display a panel with non-linear undo branches {{{
        use {
            'mbbill/undotree',
            cmd = "UndotreeToggle",
            config = function ()
                require'configs.undotree'
            end
        }
    -- }}}
    -- SURROUND: lua surround with brackets and co. {{{
        use {
            "blackCauldron7/surround.nvim",
            event = "BufEnter",
            config = function()
                require "surround".setup {
                    mappings_style = "surround",
                }
            end
        }
    -- }}}
    -- NEOFORMAT: autoformat code {{{
        use {
            "sbdchd/neoformat",
            cmd = "Neoformat",
        }
    -- }}}
    -- SYMBOLS OUTLINE: vista replacement; displays code outline panel {{{
        use {
            'simrat39/symbols-outline.nvim',
            cmd = {
                "SymbolsOutline",
                "SymbolsOutlineOpen",
                "SymbolsOutlineClose",
            },
            setup = function ()
                require'configs.outline'
            end
        }
    -- }}}
    -- LIGHTSPEED: navigate inside a buffer quickly {{{
        use {
            'ggandor/lightspeed.nvim',
            -- event = 'CursorMoved',
        }
    -- }}}
    -- SPELLSITTER: spellcheck comments with treesitter {{{
        use {
            'lewis6991/spellsitter.nvim',
            after = 'nvim-treesitter',
            config = function()
                require('spellsitter').setup {
                    hl = 'SpellBad',
                    captures = {'comment'},
                }
            end
        }
    -- }}}
    -- TELESCOPE: fuzzy searcher {{{
        use {
            'nvim-telescope/telescope.nvim',
            cmd = {"Telescope"},
            config = function()
                require'configs.telescope'
            end,
            requires = {
                {
                    'nvim-lua/plenary.nvim'
                },
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    cmd = "Telescope",
                    run = "make",
                },
                {
                    'jvgrootveld/telescope-zoxide',
                    cmd = "Telescope",
                }
            }
        }
    -- }}}
    -- FLOATERM: floating terminal using built-in term {{{
        use {
            'voldikss/vim-floaterm',
            cmd = {"FloatermNew", "FloatermToggle", "FloatermNext", "FloatermPrev", "FloatermKill"},
            config = function()
                require'configs.floaterm'
            end
        }
    -- }}}
    -- TEX CONCEAL: Further concealment of MathZone for tex files {{{
        use {
            'KeitaNakamura/tex-conceal.vim',
            ft = {"tex"},
        }
    -- }}}
    -- CLEANFOLD: Minimal foldtext {{{
        use {
            'lewis6991/cleanfold.nvim',
            event = 'BufRead',
            config = function ()
                require('cleanfold').setup()
            end
        }
    -- }}}
    -- MARKDOWN: better markdown syntax {{{
        use {
            'gabrielelana/vim-markdown',
            ft = {'markdown'},
            setup = function ()
                require'configs.markdown'
            end,
            wants = "tabular"
        }
    -- }}}
    -- TABULAR: Format pretty tables {{{
    use {
        "godlygeek/tabular",
        after = {"vim-markdown"},
        -- ft = {"markdown"},
    }
    -- }}}
    -- SXHKD: syntax for sxhkdrc {{{
        use {
            'kovetskiy/sxhkd-vim',
            ft = 'sxhkd',
        }
    -- }}}
    -- ALPHA: splash screen in lua {{{
        use {
            'goolord/alpha-nvim',
            event = 'BufWinEnter',
            config = function ()
                require'configs.alpha'
            end
        }
    -- }}}
    -- FOLDSIGNS: LSP signs for folded code {{{
        use {
            'lewis6991/foldsigns.nvim',
            event='BufRead',
            config = function()
                require('foldsigns').setup {
                exclude = {'LspDiagnosticsSignWarning'},
            }
            end
        }
    -- }}}
        end,
    -- PACKER OPTIONS {{{
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        },
        profile = {
            enable = true,
            threshold = 0.2,
        }
    }
    -- }}}
}
