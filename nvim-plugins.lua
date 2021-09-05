-- :.config/nvim/lua/plugins.lua
-- vim: set foldmethod=marker foldenable:
return require('packer').startup {
    function()
    -- IMPATIENT: faster startup time (unused) {{{
        -- use {
        --     'lewis6991/impatient.nvim',
        --     rocks = 'mpack'
        -- }
    -- }}}
    -- GALAXYLINE: fancy status line {{{
        use {
            "hhn-pham/galaxyline.nvim",
            event = 'BufWinEnter',
            branch = 'main',
            wants = 'nvim-web-devicons',
            -- requires = {'kyazdani42/nvim-web-devicons', event = "VimEnter"},
            config = function()
                require("statusline")
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
    -- DASHBOARD: a neovim start screen {{{
        use {
            "glepnir/dashboard-nvim",
            event = 'BufWinEnter',
            setup = function ()
                vim.cmd([[
                let g:total_plugins = trim(system("fd -d 2 . $HOME'/.local/share/nvim/site/pack/packer' | head -n -2 | wc -l"))
                let g:dashboard_custom_footer = [' packer detected '. g:total_plugins .' plugins']
                ]])
                vim.g.dashboard_enable_session = 0
                vim.g.dashboard_default_executive ='telescope'
                vim.g.dashboard_disable_statusline = 1
                vim.g.dashboard_custom_section = {
                    history_list = {
                        description = {'  Recents                 LDR h'},
                        command = ':Telescope oldfiles'
                    },
                    buffer_list = {
                        description = {'  Buffer                  LDR b'},
                        command = ':Telescope buffers'
                    },
                    find_files = {
                        description = {'  Files                   LDR f'},
                        command = ':Telescope find_files'
                    },
                    browse = {
                        description = {'  Browse                  LDR y'},
                        command = ':Telescope file_browser'
                    },
                    settings = {
                        description = {'漣 Settings                MRK v'},
                        command = ':e $HOME/dotfiles/nvim-init.vim'
                    },
                    plugins = {
                        description = {'  Plugins                 MRK p'},
                        command = ':e $HOME/dotfiles/nvim-plugins.lua'
                    }
                }
            end
        }
    -- }}}
    -- BARBAR: fancy buffer bar {{{
        use {
            'JA-Bar/barbar.nvim',
            event = 'BufEnter',
            wants = 'nvim-web-devicons',
            requires = {
                {
                    -- WEB-DEVICONS: icons for bars {{{
                    'kyazdani42/nvim-web-devicons',
                    event = "VimEnter",
                    config = function ()
                        require'nvim-web-devicons'.setup {
                            default = true,
                            override = {
                                ["default_icon"] = {
                                    icon = "",
                                    color = "#6d8086",
                                    name = "Default",
                                }
                            }
                        }
                    end
                    -- }}}
                }
            },
            config = function()
                vim.g.bufferline = {
                    animation = true,
                    auto_hide = true,
                    tabpages = true,
                    closable = true,
                    clickable = true,
                    icons = true,
                    icon_custom_colors = false,
                    icon_separator_active = '▎',
                    icon_separator_inactive = ' ',
                    icon_close_tab = '',
                    icon_close_tab_modified = '',
                    icon_pinned = '',
                    insert_at_end = false,
                    maximum_padding = 2,
                    maximum_length = 30,
                    semantic_letters = true,
                    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
                    no_name_title = nil,
                }
            end
        }
    -- }}}
    -- PACKER: package manager {{{
        use {
            'wbthomason/packer.nvim',
            event = "VimEnter",
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
                require("colorbuddy").setup()
                -- THEME {{{
                    local Group = require('colorbuddy.group').Group
                    local c = require('colorbuddy.color').colors
                    local g = require('colorbuddy.group').groups
                    local s = require('colorbuddy.style').styles
                    local b = s.bold
                    local i = s.italic
                    local uc = s.undercurl
                    local ul = s.underline
                    local st = s.strikethrough
                    local r = s.reverse
                    local no = s.NONE
                    require('colors')
                    Group.new('ColorColumn', c.none, c.lightblack, no)
                    Group.new('Conceal', c.none, c.none, no)
                    Group.new('Cursor', c.none, c.warmgrey, r)
                    Group.new('CursorIM', c.none, c.warmgrey, r)
                    Group.new('CursorColumn', c.black, c.very_pale_yellow, no)
                    Group.new('CursorLine', c.none, c.darkgrey, no)
                    Group.new('Directory', c.orange, c.none, no)
                    Group.new('DiffAdd', c.addfg, c.addbg, no)
                    Group.new('DiffChange', c.changefg, c.changebg, no)
                    Group.new('DiffDelete', c.delfg, c.delbg, no)
                    Group.new('DiffText', c.none, c.none, no)
                    Group.new('EndOfBuffer', c.black, c.none.no)
                    Group.new('ErrorMsg', c.red, c.black, no)
                    Group.new('VertSplit', c.darkgrey, c.darkgrey, no)
                    Group.new('Folded', c.lightblack, c.none, no)
                    Group.new('FoldColumn', c.darkgrey, c.none, no)
                    Group.new('SignColumn', c.none, c.lightblack, no)
                    Group.new('IncSearch', c.none, c.none, r)
                    Group.new('LineNr', c.lightblack, c.black, b)
                    Group.new('CursorLineNr', c.red, c.darkgrey, no)
                    Group.new('MatchParen', c.black, c.lightgrey, no)
                    Group.new('ModeMsg', c.yellow, c.none, no)
                    Group.new('MoreMsg', c.yellow, c.none, no)
                    Group.new('Normal', c.white, c.black, no)
                    Group.new("NormalFloat", c.white, c.darkgrey)
                    Group.new('Pmenu', c.orange, c.darkblack, no)
                    Group.new('PmenuSel', c.orange, c.black, r + b)
                    Group.new('PmenuSbar', c.lightblack, c.darkblack, no)
                    Group.new('PmenuThumb', c.warmgrey, c.warmgrey, no)
                    Group.new('Question', c.yellow, c.none, no)
                    Group.new('QuickFixLine', c.none, c.none, no)
                    Group.new('Search', c.black, c.yellow, no)
                    Group.new('SpecialKey', c.lightblack, c.none, b)
                    Group.new('NonText', c.lightblack, c.none, b)
                    Group.new('SpellBad', c.very_soft_red, c.none, uc)
                    Group.new('SpellCap', c.very_soft_yellow, c.none, uc)
                    Group.new('SpellLocal', c.very_soft_yellow, c.none, uc)
                    Group.new('SpellRare', c.very_soft_yellow, c.none, uc)
                    Group.new('StatusLine', c.none, c.darkgrey, no)
                    Group.new('StatusLineNC', c.warmgrey, c.none, no)
                    Group.new('StatusLineTerm', c.none, c.none, no)
                    Group.new('StatusLineTermNC', c.none, c.none, no)
                    Group.new('TabLine', c.darkgrey, c.darkgrey, no)
                    Group.new('TabLineFill', c.none, c.darkgrey, no)
                    Group.new('TabLineSel', c.white, c.none, b)
                    -- Group.new('Terminal', c.white, c.darkblack, no)
                    Group.new('Title', c.yellow, c.none, no)
                    Group.new('VisualNOS', c.none, c.none, no)
                    Group.new('Visual', c.none, c.lightblack, no)
                    Group.new('WarningMsg', c.orange, c.none, no)
                    Group.new('WildMenu', c.none, c.none, no)
                    Group.new('Comment', c.grey, c.none, i)
                    vim.cmd([[highlight Comment ctermfg=grey guifg=#505050 guibg=none gui=italic term=italic cterm=italic]])
                    Group.new('Constant', c.purple, c.none, no)
                    Group.new('String', c.chartreuse, c.none, no)
                    Group.new('Character', c.yellow, c.none, no)
                    Group.new('Number', c.tomato, c.none, no)
                    Group.new('Boolean', c.purple, c.none, no)
                    Group.new('Float', c.tomato, c.none, no)
                    Group.new('Identifier', c.orange, c.none, no)
                    Group.new('Function', c.blue, c.none, no)
                    Group.new('Statement', c.pink, c.none, no)
                    Group.new('Conditional', c.lightorange, c.none, no)
                    Group.new('Repeat', c.lightorange, c.none, no)
                    Group.new('Label', c.very_soft_orange, c.none, no)
                    Group.new('Operator', c.aqua, c.none, no)
                    Group.new('Keyword', c.yellow, c.none, b)
                    Group.new('Exception', c.none, c.none, no)
                    Group.new('PreProc', c.coral, c.none, no)
                    Group.new('Include', c.pink, c.none, no)
                    Group.new('Define', c.pink, c.none, no)
                    Group.new('Macro', c.green, c.none, no)
                    Group.new('PreCondit', c.green, c.none, no)
                    Group.new('Type', c.lime_green, c.none, i)
                    Group.new('StorageClass', c.darkturquoise, c.none, no)
                    Group.new('Structure', c.aqua, c.none, no)
                    Group.new('Typedef', c.aqua, c.none, no)
                    Group.new('Special', c.purple, c.none, no)
                    Group.new('SpecialChar', c.pink, c.none, no)
                    Group.new('Tag', c.pink, c.none, no)
                    Group.new('Delimiter', c.pink, c.none, no)
                    Group.new('SpecialComment', c.aqua, c.none, no)
                    Group.new('Debug', c.none, c.none, no)
                    Group.new('Underlined', c.aqua, c.none, ul)
                    Group.new('Ignore', c.none, c.none, no)
                    Group.new('Error', c.red, c.darkgrey, ul)
                    Group.new('Todo', c.orange, c.none, b + i)
                    Group.new('goDirective', c.purple, c.none, no)
                    Group.new('goConstants', c.orange, c.none, no)
                    Group.new('goTodo', c.yellow, c.none, no)
                    Group.new('goDeclType', c.coral, c.none, no)
                    Group.new('goFunctionCall', g.Function, c.none, no)
                    Group.new('goBuiltins', c.camel, c.none, no)
                    Group.new('goPredefinedIdentifiers', c.crimson, c.none, no)
                    Group.new('goMethod', g.Function, c.none, no)
                    Group.new('goVarDefs', c.vivid_yellow, c.none, no)
                    Group.new('goDeclaration', c.purple, c.none, no)
                    Group.new('goVarAssign', c.purple, c.none, no)
                    Group.new('goVar', c.purple, c.none, no)
                    Group.new('goConst', g.Constant, c.none, no)
                    Group.new('goTypeName', c.lime_green, c.none, no)
                    Group.new('goReceiverType', c.lime_green, c.none, no)
                    Group.new('goTypeConstructor', c.lime_green, c.none, no)
                    Group.new('jsonKeyword', c.orange, c.none, no)
                    Group.new('htmlTag', c.white, c.none, no)
                    Group.new('htmlEndTag', c.white, c.none, no)
                    Group.new('htmlTagName', g.Tag, c.none, no)
                    Group.new('htmlArg', c.orange, c.none, no)
                    Group.new('htmlSpecialChar', c.purple, c.none, no)
                    Group.new('TSAnnotation', c.none, c.none, no)
                    Group.new('TSAttribute', c.none, c.none, no)
                    Group.new('TSBoolean', g.Boolean, g.Boolean, g.Boolean)
                    Group.new('TSCharacter', g.Character, g.Character, g.Character)
                    Group.new('TSComment', g.Comment, g.Comment, g.Comment)
                    Group.new('TSConditional', g.Conditional, g.Conditional, g.Conditional)
                    Group.new('TSConstant', g.Constant, g.Constant, g.Constant)
                    Group.new('TSConstBuiltin', g.Constant, g.Constant, b)
                    Group.new('TSConstMacro', g.Macro, g.Macro, b)
                    Group.new('TSConstructor', c.yellow, c.none, no)
                    Group.new('TSError', g.Error, g.Error, g.Error)
                    Group.new('TSException', g.Exception, g.Exception, g.Exception)
                    Group.new('TSField', c.orange, c.none, no)
                    Group.new('TSFloat', g.Float, g.Float, g.Float)
                    Group.new('TSFunction', g.Function, g.Function, g.Function)
                    Group.new('TSFuncBuiltin', c.camel, c.none, b)
                    Group.new('TSFuncMacro', g.Macro, g.Macro, i)
                    Group.new('TSInclude', g.Include, g.Include, g.Include)
                    Group.new('TSKeyword', g.Keyword, g.Keyword, g.Keyword)
                    Group.new('TSKeywordFunction', c.light_blue, c.none, no)
                    Group.new('TSKeywordOperator', c.coral, c.none, no)
                    Group.new('TSLabel', g.Label, g.Label, g.Label)
                    Group.new('TSMethod', g.Function, g.Function, g.Function)
                    Group.new('TSNamespace', c.light_yellow, c.none, no)
                    Group.new('TSNone', c.none, c.none, no)
                    Group.new('TSNumber', g.Number, g.Number, g.Number)
                    Group.new('TSOperator', g.Operator, g.Operator, g.Operator)
                    Group.new('TSParameter', c.pure_pink, c.none, no)
                    Group.new('TSParameterReference', c.pure_pink, c.none, no)
                    Group.new('TSProperty', c.orange, c.none, no)
                    Group.new('TSPunctDelimiter', c.white, c.none, no)
                    Group.new('TSPunctBracket', c.white, c.none,  no)
                    Group.new('TSPunctSpecial', c.white, c.none,  no)
                    Group.new('TSRepeat', g.Repeat, g.Repeat, g.Repeat)
                    Group.new('TSString', g.String, g.String, g.String)
                    Group.new('TSStringRegex', c.very_light_orange, c.none, no)
                    Group.new('TSStringEscape', c.orange, c.none, no)
                    Group.new('TSSymbol', c.red, c.none, no)
                    Group.new('TSTag', g.Tag, g.Tag, g.Tag)
                    Group.new('TSTagDelimiter', g.Delimiter, g.Delimiter, g.Delimiter)
                    Group.new('TSText', c.white, c.none, no)
                    Group.new('TSStrong', c.white, c.none, b)
                    Group.new('TSEmphasis', c.white, c.none, i)
                    Group.new('TSUnderline', c.white, c.none, ul)
                    Group.new('TSStrike', c.white, c.none, st)
                    Group.new('TSTitle', c.white, c.none, b)
                    Group.new('TSLiteral', c.white, c.none, no)
                    Group.new('TSURI', c.orange, c.none, uc)
                    Group.new('TSMath', c.white, c.none, i)
                    Group.new('TSTextReference', c.orange, c.none, i)
                    Group.new('TSEnviroment', c.white, c.none, no)
                    Group.new('TSEnviromentName', c.tomato, c.none, no)
                    Group.new('TSNote', c.white, c.none, no)
                    Group.new('TSWarning', g.WarningMsg, g.WarningMsg, g.WarningMsg)
                    Group.new('TSDanger', g.Error, g.Error, b)
                    Group.new('TSType', g.Type, g.Type, i)
                    Group.new('TSTypeBuiltin', g.Type, g.Type, g.Type)
                    Group.new('TSVariable', c.vivid_orange, c.none, no)
                    Group.new('TSVariableBuiltin', c.camel, c.none, b)
                    Group.new('GitSignsChange', c.changefg, c.black, no)
                    Group.new('GitSignsChangeNr', c.changefg, c.changebg, no)
                    Group.new('GitSignsChangeLn', c.changefg, c.changebg, no)
                    Group.new('GitSignsAdd', c.addfg, c.black, no)
                    Group.new('GitSignsAddNr', c.addfg, c.addbg, no)
                    Group.new('GitSignsAddLn', c.addfg, c.addbg, no)
                    Group.new('GitSignsDelete', c.red, c.black, no)
                    Group.new('GitSignsDeleteNr', c.red, c.delbg, no)
                    Group.new('GitSignsDeleteLn', c.red, c.delbg, no)
                    Group.new('SignColumn', c.black, c.black, no)
                    Group.new('IndentBlanklineChar', c.darkgrey, none, no)
                    Group.new('IndentBlanklineSpaceChar', c.darkgrey, none, no)
                    Group.new('IndentBlanklineSpaceCharBlankline', c.darkgrey, none, no)
                    Group.new('IndentBlanklineContextChar', c.lightblack, none, no)
                    Group.new('LspDiagnosticsUnderlineError', c.red, c.none, ul)
                    Group.new('LspDiagnosticsUnderlineHint', c.pink, c.none, ul)
                    Group.new('LspDiagnosticsUnderlineWarning', c.orange, c.none, ul)
                    Group.new('LspDiagnosticsUnderlineInformation', c.blue, c.none, ul)
                    Group.new('LspDiagnosticsDefaultError', c.red, c.none, ul)
                    Group.new('LspDiagnosticsDefaultHint', c.pink, c.none, no)
                    Group.new('LspDiagnosticsDefaultWarning', c.orange, c.none, no)
                    Group.new('LspDiagnosticsDefaultInformation', c.blue, c.none, no)
                    Group.new('LspDiagnosticsFloatingError', c.red, c.none, no)
                    Group.new('LspDiagnosticsFloatingHint', c.pink, c.none, no)
                    Group.new('LspDiagnosticsFloatingInformation', c.blue, c.none, no)
                    Group.new('LspDiagnosticsFloatingWarning', c.orange, c.none, no)
                    Group.new('LspDiagnosticsSignError', c.red, c.none, no)
                    Group.new('LspDiagnosticsSignHint', c.pink, c.none, no)
                    Group.new('LspDiagnosticsSignWarning', c.orange, c.none, no)
                    Group.new('LspDiagnosticsSignInformation', c.blue, c.none, no)
                    Group.new('LspDiagnosticsSignInformation', c.blue, c.none, no)
                    Group.new('LspDiagnosticsVirtualTextError', c.red, c.none, i)
                    Group.new('LspDiagnosticsVirtualTextHint', c.pink, c.none, i)
                    Group.new('LspDiagnosticsVirtualTextWarning', c.orange, c.none, i)
                    Group.new('LspDiagnosticsVirtualTextInformation', c.blue, c.none, i)
                    Group.new('LspDiagnosticsUnderlineHint', c.green, c.none, ul)
                    Group.new('LspDiagnosticsUnderlineInformation', c.blue, c.none, ul)
                    Group.new('LspDiagnosticsUnderlineHint', c.pink, c.none, ul)
                    Group.new('LspDiagnosticsUnderlineWarning', c.orange, c.none, ul)
                    Group.new('MsgArea', c.lightgrey, c.black, no)
                    Group.new('BufferCurrent', c.lightgrey, c.none, b)
                    Group.new('BufferVisible', c.lightgrey, c.none, b)
                    Group.new('BufferCurrentMod', c.red, c.none, i + b)
                    Group.new('BufferVisibleMod', c.red, c.none, i + b)
                    Group.new('BufferCurrentSign', c.lightblack, c.none, no)
                    Group.new('BufferVisibleSign', c.lightblack, c.none, no)
                    Group.new('BufferCurrentTarget', c.blue, c.none, b)
                    Group.new('BufferVisibleTarget', c.blue, c.none, b)
                    Group.new('BufferInactive', c.lightblack, c.darkgrey, no)
                    Group.new('BufferInactiveMod', c.lightblack, c.darkgrey, i)
                    Group.new('BufferInactiveTarget', c.blue, c.darkgrey, b)
                    Group.new('BufferInactiveSign', c.darkgrey, c.darkgrey, no)
                    Group.new('BufferTabpages', c.lightgrey, c.darkgrey, b)
                    Group.new('BufferTabpageFill', c.lightgrey, c.darkgrey, b)
                    Group.new('BufferOffset', c.lightgrey, c.darkgrey, b)
                    Group.new('FocusedSymbol', c.black, c.yellow, b)
                    Group.new('markdownCode', c.blue, c.none, no)
                    Group.new('DevIconLua', c.blue, c.none, no)
                    Group.new('DevIconPy', c.blue, c.none, no)
                    Group.new('DevIconMarkdown', c.lightblue, c.none, no)
                    Group.new('DevIconMd', c.lightblue, c.none, no)
                    Group.new('DevIconVim', c.lime_green, c.none, no)
                    Group.new('DevIconVimrc', c.lime_green, c.none, no)
                    Group.new('DevIconTerminal', c.lime_green, c.none, no)
                    Group.new('DevIconConf', c.yellow, c.none, no)
                    Group.new('DevIconBash', c.pink, c.none, no)
                    Group.new('DevIconZshrc', c.aqua, c.none, no)
                    Group.new('DevIconZsh', c.aqua, c.none, no)
                    Group.new('DevIconZshenv', c.aqua, c.none, no)
                    Group.new('DevIconZshprofile', c.aqua, c.none, no)
                    Group.new('DevIconSh', c.pink, c.none, no)
                    Group.new('DevIconDefault', c.lightgrey, c.none, no)
                    Group.new('DashboardHeader', c.red, c.none, no)
                    Group.new('TelescopeSelection', c.white, c.none, b)
                    Group.new('TelescopeSelectionCaret', c.red, c.none, no)
                    Group.new('TelescopeMultiSelection', c.white, c.none, b)
                    Group.new('TelescopeNormal', c.lightgrey, c.darkblack, b)
                    Group.new('TelescopeBorder', c.lightblack, c.darkblack, no)
                    Group.new('TelescopePromptBorder', c.lightblack, c.darkblack, no)
                    Group.new('TelescopeResultsBorder', c.lightblack, c.darkblack, no)
                    Group.new('TelescopePreviewNormal', c.none, c.darkblack, no)
                    Group.new('TelescopePreviewBorder', c.lightblack, c.darkblack, no)
                    Group.new('TelescopePreviewBorder', c.lightblack, c.darkblack, no)
                    Group.new('TelescopeMatching', c.red, c.none, b)
                    Group.new('TelescopePromptPrefix', c.red, c.none, b)
                    Group.new('markdownStrike', c.lightblack, c.none, st)
                    Group.new('NvimTreeNormal', c.lightgrey, c.darkgrey, no)
                    Group.new('NvimTreeRootFolder', c.purple, c.none, no)
                    Group.new('NvimTreeOpenedFolderName', c.yellow, c.none, b)
                    Group.new('NvimTreeEmptyFolderName', c.yellow, c.none, b)
                    Group.new('NvimTreeFolderName', c.yellow, c.none, no)
                    Group.new('NvimTreeGitDirty', c.red, c.none, no)
                    Group.new('NvimTreeGitStaged', c.green, c.none, no)
                    Group.new('NvimTreeGitMerge', c.purple, c.none, no)
                    Group.new('NvimTreeGitRenamed', c.yellow, c.none, no)
                    Group.new('NvimTreeGitNew', c.blue, c.none, no)
                    Group.new('NvimTreeGitDeleted', c.red, c.none, no)
                    Group.new('NvimTreeOpenedFile', c.white, c.none, b)
                    Group.new('NvimTreeSpecialFile', c.pink, c.none, ul)
                    Group.new('NvimTreeSymlink', c.aqua, c.none, ul)
                    Group.new('NvimTreeExecFile', c.green, c.none, b)
                    Group.new('NvimTreeVertSplit', c.darkgrey, c.darkgrey, b)
                    Group.new('Floaterm', c.none, c.darkblack, no)
                    Group.new('FloatermNC', c.none, c.black, no)
                    Group.new('FloatermBorder', c.lightblack, c.darkblack, no)
                    -- }}}
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
                require'nvim-treesitter.configs'.setup {
                    ensure_installed= { "python", "html", "cpp", "css", "vim", "latex", "lua", "bash", "toml" },
                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false,
                        disable = { "latex" },
                    },
                    autopairs = {
                        enable = true
                    }
                }
            end
        }
    -- }}}
    -- COMPE: popup completion {{{
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require('compe').setup {
                    enabled = true;
                    autocomplete = true;
                    debug = false;
                    min_length = 1;
                    preselect = 'enable';
                    throttle_time = 80;
                    source_timeout = 200;
                    incomplete_delay = 400;
                    max_abbr_width = 100;
                    max_kind_width = 100;
                    max_menu_width = 100;
                    documentation = true;
                    source = {
                        path = true;
                        ultisnips = true;
                        nvim_lsp = true;
                        nvim_lua = true;
                        buffer = true;
                        spell = false;
                        treesitter = true;
                    };
                }
                local t = function(str)
                    return vim.api.nvim_replace_termcodes(str, true, true, true)
                end
                local check_back_space = function()
                    local col = vim.fn.col('.') - 1
                    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
                end
                _G.tab_complete = function()
                    if vim.fn.pumvisible() == 1 then
                        return t "<C-n>"
                    elseif check_back_space() then
                        return t "<Tab>"
                    else
                        return vim.fn['compe#complete']()
                    end
                end
                _G.s_tab_complete = function()
                    if vim.fn.pumvisible() == 1 then
                        return t "<C-p>"
                    else
                        return t "<S-Tab>"
                    end
                end

                vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
                vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
                vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
                vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
            end,
            wants = "ultisnips",
            requires = {
                {
            -- ULTISNIPS: snippets utility {{{
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
            -- }}}
                },
            }
        }
    -- }}}
    -- GITSIGNS: display git diffs in sign column {{{
        use {
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                require('gitsigns').setup {
                    numhl = false,
                    linehl = false,
                    watch_index = {
                        interval = 1000,
                        follow_files = true
                    },
                    current_line_blame = false,
                    sign_priority = 6,
                    update_debounce = 100,
                    status_formatter = nil,
                    word_diff = false,
                    use_internal_diff = true,
                    keymaps = {},
                }
            end,
        }
    -- }}}
    -- NEOSCROLL: smooth scrolling {{{
        use {
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
                require('neoscroll').setup {
                    hide_cursor = true,
                    stop_eof = true,
                    use_local_scrolloff = false,
                    respect_scrolloff = false,
                    cursor_scrolls_alone = true,
                    easing_function = "quadratic"
                }
            end,
        }
    -- }}}
    -- ZEN MODE: lightweight goyo replacement {{{
        use {
            "folke/zen-mode.nvim",
            wants = "twilight.nvim",
            cmd = "ZenMode",
            config = function()
                require("zen-mode").setup {
                    window = {
                        options = {
                            signcolumn = "yes",
                            number = false,
                            relativenumber = false,
                            cursorline = false,
                            cursorcolumn = false,
                            foldcolumn = "0",
                            list = false,
                        },
                    },
                    plugins = {
                        gitsigns = { enabled = true },
                        kitty = {
                            enabled = true,
                            font = "+4",
                        },
                    },
                }
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
                require("indent_blankline").setup {
                    buftype_exclude = {"terminal"},
                    bufnameExclude = {'README.md'},
                    show_current_context = true,
                    filetype_exclude = {""},
                    enabled = 'true',
                }
            end
        }
    -- }}}
    -- LSPCONFIG: native lsp configuration {{{
        use {
            "neovim/nvim-lspconfig",
            event = "BufRead",
            config = function()
                local on_attach = function(bufnr)
                    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                    local opts = { noremap=true, silent=true }
                    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                    buf_set_keymap('n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                    buf_set_keymap('n', '<Leader>x', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
                    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
                    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
                end
                require'lspconfig'.clangd.setup{
                    on_attach = on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    }
                }
                require'lspconfig'.pyright.setup{
                    on_attach = on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    }
                }
                require'lspconfig'.vimls.setup{
                    on_attach = on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    }
                }
                require'lspconfig'.bashls.setup{
                    on_attach = on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    }
                }
                require'lspconfig'.texlab.setup {
                    on_attach = on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    },
                    cmd = { "texlab" },
                    filetypes = { "tex", "bib" },
                    settings = {
                        texlab = {
                            auxDirectory = ".",
                            bibtexFormatter = "texlab",
                            build = {
                                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f", '-shell-escape'},
                                executable = "latexmk",
                                forwardSearchAfter = true,
                                onSave = true
                            },
                            chktex = {
                                onEdit = true,
                                onOpenAndSave = true
                            },
                            diagnosticsDelay = 300,
                            formatterLineLength = 80,
                            forwardSearch = {
                                executable = "zathura",
                                args = {"--synctex-forward", "%l:1:%f", "%p"}
                            },
                            latexFormatter = "latexindent",
                            latexindent = {
                                modifyLineBreaks = false
                            }
                        }
                    }
                }
                require'lspconfig'.sumneko_lua.setup {
                    on_attach = on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    },
                    cmd = {"/usr/bin/lua-language-server", "-E", "/usr/share/lua-language-server/main.lua"};
                    settings = {
                        Lua = {
                            runtime = {
                                version = 'LuaJIT',
                                path = "/usr/bin/luajit",
                            },
                            diagnostics = {
                                globals = {'vim'},
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    }
                }
                require("grammar-guard").init()
                require("lspconfig").grammar_guard.setup({
                    on_attach = on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    },
                    settings = {
                        ltex = {
                            enabled = { "latex", "tex", "bib", "markdown" },
                            language = "en-GB",
                            diagnosticSeverity = "information",
                            setenceCacheSize = 2000,
                            additionalRules = {
                                enablePickyRules = true,
                                motherTongue = "en-GB",
                            },
                            trace = { server = "verbose" },
                            dictionary = {},
                            disabledRules = {['en-GB'] = {'OXFORD_SPELLING_Z_NOT_S'}},
                            hiddenFalsePositives = {},
                        },
                    },
                })
                local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
                for type, icon in pairs(signs) do
                    local hl = "LspDiagnosticsSign" .. type
                    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
                end
                vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = false,
                    signs = true,
                    underline = true,
                    update_in_insert = true,
                })
            end
        }
    --- }}}
    -- GRAMMAR GUARD: lsp for latex and markdown {{{
        use {
            "brymer-meneses/grammar-guard.nvim",
            wants = "nvim-lspconfig",
        }
    -- }}}
    -- TS-RAINBOW: treesitter rainbow parentheses {{{
        use {
            'p00f/nvim-ts-rainbow',
            event = "BufRead",
            config = function()
                require'nvim-treesitter.configs'.setup {
                    rainbow = {
                        enable = true,
                        loaded = true,
                        extended_mode = true,
                        colors = { "#bf616a", "#d08770", "#ebcb8b", "#a3be8c", "#88c0d0", "#5e81ac", "#b48ead" },
                        disable = {},
                        max_file_lines = 1400,
                    }
                }
            end
        }
    -- }}}
    -- COMMENT: syntax-aware comment keymaps {{{
        use {
            "terrortylor/nvim-comment",
            after = 'packer.nvim',
            config = function ()
                require('nvim_comment').setup()
            end
        }
    -- }}}
    -- AUTOPAIRS: auto insert pairs {{{
        use {
            'LunarWatcher/auto-pairs',
            event = "BufEnter",
            config = function ()
                vim.cmd([[
                let g:AutoPairs = autopairs#AutoPairsDefine([{"open": "$", "close": "$", "filetype": "tex"},{"open": '\w\zs<', "close": '>'},{"open": '\\left(', 'close': '\right)', "filetype": "tex"},{"open": '\\left(', 'close': '\right)', "filetype": "markdown"},{"open": "_", "close": "_", "filetype": ["markdown"]},{"open": "__", "close": "__", "filetype": ["markdown"]},{"open": "~~", "close": "~~", "filetype": ["markdown"]},{"open": "|", "close": "|", "filetype": "help"},{"open": '\vclass .{-} (: (.{-}[ ,])+)? ?\{', 'close': '};', 'mapopen': '{', 'filetype': 'cpp'}])
                ]])
                vim.g.AutoPairsShortcutFastWrap = '<M-e>'
                vim.g.AutoPairsMapBS = "1"
                vim.g.AutoPairsShortcutToggle='<M-p>'
                vim.g.AutoPairsShortcutJump='<M-n>'
                vim.g.AutoPairsShortcutBackInsert='<M-b>'
                vim.g.AutoPairsMultilineBackspace = 1
                vim.g.AutoPairsMultilineClose = 1
                vim.g.AutoPairsFlyMode = "0"
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
                vim.g.undotree_ShortIndicators = 1
                vim.g.undotree_TreeNodeShape = "●"
                vim.g.undotree_WindowLayout = 4
                vim.g.undotree_TreeVertShape = '│'
                vim.g.undotree_HelpLine = 0
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
                vim.g.symbols_outline = {
                    position = 'right',
                    auto_preview = false,
                    highlight_hovered_item = true,
                    show_guides = true,
                    width = 25,
                }
            end
        }
    -- }}}
    -- LIGHTSPEED: navigate inside a buffer quickly {{{
        use {
            'ggandor/lightspeed.nvim',
            event = 'CursorMoved',
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
            require('telescope').setup {
                defaults = {
                    use_less = false,
                    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                    prompt_prefix = "  ",
                    selection_caret = "  ",
                    entry_prefix = "  ",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        prompt_position = 'top',
                        horizontal = {
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                    width = 0.87,
                    height = 0.80,
                    },
                    file_ignore_patterns = {
                        'steam',
                        'dosdevices',
                        'drive_c',
                        'compatdata',
                        'cargo',
                        '.conan',
                        'gem',
                        'Brave',
                        '.paradox-launcher',
                        '.cache',
                        'Trash',
                        'discord',
                        'BetterDiscord',
                        'lutris',
                        'secrets',
                        '.var',
                        'go',
                        '.android',
                        '.cmake',
                        '.dotnet',
                        '.nuget',
                    },
                },
                pickers = {
                    buffers = {
                        sort_lastused = true,
                        prompt_prefix = ' ﬘  ',
                        previewer = false,
                        layout_config = {
                            width = 0.37,
                            height = 0.50,
                        },
                        mappings = {
                            i = {
                                ["<c-d>"] = "delete_buffer",
                            },
                            n = {
                                ["<c-d>"] = require("telescope.actions").delete_buffer,
                            }
                        }
                    },
                    file_browser = {
                        prompt_prefix = '    ',
                        hidden = true,
                    },
                    find_files = {
                        find_command= {
                            'rg',
                            '--no-ignore',
                            '--hidden',
                            '--files',
                        },
                        prompt_prefix = '   ',
                    },
                    oldfiles = {
                        prompt_prefix = '   ',
                    },
                    colorscheme = {
                        prompt_prefix = '   ',
                    },
                    highlights = {
                        prompt_prefix = '   ',
                    },
                    live_grep = {
                        prompt_prefix = '   ',
                    },
                    git_commits = {
                        prompt_prefix = '   ',
                    },
                    git_bcommits = {
                        prompt_prefix = '   ',
                    },
                    git_branches = {
                        prompt_prefix = '   ',
                    },
                    git_status = {
                        prompt_prefix = '   ',
                    },
                    git_files = {
                        prompt_prefix = ' ﯙ  ',
                    },
                    commands = {
                        prompt_prefix = '   ',
                    },
                    registers = {
                        prompt_prefix = '   ',
                    },
                    spell_suggests = {
                        prompt_prefix = '   ',
                    },
                    keymaps = {
                        prompt_prefix = '   ',
                    },
                extensions = {
                    fzf = {
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            },
        }
            require('telescope').load_extension('fzf')
            require'telescope'.load_extension('zoxide')
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
    -- TREE: sidebar to navigate files {{{
        use {
            'kyazdani42/nvim-tree.lua',
            event = 'BufWinEnter',
            setup = function()
                vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }
                vim.g.nvim_tree_follow = 1
                vim.g.nvim_tree_highlight_opened_files = 1
                vim.g.nvim_tree_auto_open = 1
                vim.g.nvim_tree_auto_close = 1
                vim.g.nvim_tree_hijack_netrw = 1
                vim.g.nvim_tree_auto_resize = 1
                vim.g.nvim_tree_disable_netrw = 1
                vim.g.nvim_tree_symlink_arrow = '  '
                vim.g.nvim_tree_respect_buf_cwd = 1
                vim.g.nvim_tree_window_picker_exclude = {
                    filetype = {
                        'packer',
                        'qf'
                    },
                    buftype = {
                        'terminal'
                    }
                }
            end,
        }
    --}}}
    -- FLOATERM: floating terminal using built-in term {{{
        use {
            'voldikss/vim-floaterm',
            cmd = {"FloatermNew", "FloatermToggle", "FloatermNext", "FloatermPrev", "FloatermKill"},
            config = function()
                vim.g.floaterm_autoinsert = 1
                vim.g.floaterm_wintitle = 1
                vim.g.floaterm_autohide = 1
                vim.g.floaterm_autoclose = 1
                vim.g.floaterm_opener = "vsplit"
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
                vim.g.markdown_enable_mappings = 1
                vim.g.markdown_enable_insert_mode_leader_mappings = 0
                vim.g.markdown_enable_insert_mode_mappings = 0
                vim.g.markdown_mapping_switch_status = '<C-space>'
                vim.g.markdown_enable_conceal = 1
                vim.g.markdown_enable_folding = 0
            end,
            requires = {
                -- TABULAR: Format pretty tables {{{
                "godlygeek/tabular",
                ft = {"markdown"},
                -- }}}
            }
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
