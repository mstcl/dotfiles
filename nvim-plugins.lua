-- :.config/nvim/lua/plugins.lua
-- vim: set foldmethod=marker foldenable:

return require('packer').startup(function()
    -- GALAXYLINE: fancy status line {{{
    use {
        "hhn-pham/galaxyline.nvim",
        event = 'BufWinEnter',
        branch = 'main',
        config = function()
            require("statusline")
        end,
    }
    -- }}}

    -- WEB-DEVICONS: icons everywhere {{{
    use {
        'kyazdani42/nvim-web-devicons',
        config = function ()
            require'nvim-web-devicons'.setup {}
        end
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

    -- NVIM COLORIZER: add a colored background for color codes {{{
    use {
        "norcalli/nvim-colorizer.lua",
        event = 'BufRead',
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
                let g:dashboard_custom_footer = [' neovim loaded '. g:total_plugins .' plugins']
            ]])
            vim.g.dashboard_custom_section = {
                history_list = {
                    description = {' History                 LDR fh'},
                    command = ':FzfLua oldfiles'
                },
                buffer_list = {
                    description = {'﬘ Buffer                  LDR fb'},
                    command = ':FzfLua buffers'
                },
                find_files = {
                    description = {' Files                   LDR ff'},
                    command = ':FzfLua files'
                },
                session = {
                    description = {' Restore                 LDR rr'},
                    command = ':SessionLoad'
                }
            }
        end
    }
    -- }}}

    -- BARBAR: fancy buffer bar {{{
    use {
        'romgrk/barbar.nvim',
        event = 'BufEnter',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            vim.g.bufferline = {
                animation = true,
                auto_hide = false,
                tabpages = false,
                closable = true,
                clickable = true,
                icons = true,
                icon_custom_colors = false,
                icon_separator_active = '',
                icon_separator_inactive = '',
                icon_close_tab = '',
                icon_close_tab_modified = '',
                icon_pinned = '',
                insert_at_end = false,
                maximum_padding = 1,
                maximum_length = 50,
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

    -- BETTER-ESCAPE: use alphanumeric escape mappings without delay {{{
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
                -- local global = vim.g
                require('colors')
                -- used for the columns set with 'colorcolumn'
                Group.new('ColorColumn', c.none, c.lightblack, no)
                -- placeholder characters substituted for concealed text (see 'conceallevel')
                Group.new('Conceal', c.none, c.none, no)
                -- the character under the cursor
                Group.new('Cursor', c.black, c.white, no)
                -- like Cursor, but used when in IME mode
                Group.new('CursorIM', c.none, c.none, no)
                -- the screen column that the cursor is in when 'cursorcolumn' is set
                Group.new('CursorColumn', c.black, c.very_pale_yellow, no)
                -- the screen line that the cursor is in when 'cursorline' is set
                Group.new('CursorLine', c.none, c.darkgrey, no)
                -- directory names (and other special names in listings)
                Group.new('Directory', c.orange, c.none, no)
                -- diff mode: Added line
                Group.new('DiffAdd', c.addfg, c.addbg, no)
                -- diff mode: Changed line
                Group.new('DiffChange', c.changefg, c.changebg, no)
                -- diff mode: Deleted line
                Group.new('DiffDelete', c.black, c.delbg, no)
                -- diff mode: Changed text within a changed line
                Group.new('DiffText', c.black, c.aqua, no)
                -- filler lines (~) after the last line in the buffer
                Group.new('EndOfBuffer', c.black, c.none.no)
                -- error messages on the command line
                Group.new('ErrorMsg', c.red, c.black, no)
                -- the column separating vertically split windows
                Group.new('VertSplit', c.lightblack, c.none, no)
                Group.new('Folded', c.grey, c.none, no)
                Group.new('FoldColumn', c.grey, c.none, no)
                Group.new('SignColumn', c.none, c.lightblack, no)
                Group.new('IncSearch', c.none, c.none, r)
                -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
                Group.new('LineNr', c.lightblack, c.black, no)
                -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
                Group.new('CursorLineNr', c.red, c.none, no)
                -- The character under the cursor or just before it, if it is a paired bracket, and its match.
                Group.new('MatchParen', c.black, c.lightgrey, no)
                -- 'showmode' message (e.g., "-- INSERT --")
                Group.new('ModeMsg', c.yellow, c.none, no)
                -- more-prompt
                Group.new('MoreMsg', c.yellow, c.none, no)
                -- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not
                -- really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
                Group.new('NonText', c.lightgrey, c.none, no)
                -- normal text
                Group.new('Normal', c.white, c.black, no)
                -- normal floating window
                Group.new("NormalFloat", c.white, c.darkgrey)
                -- Popup menu: normal item.
                Group.new('Pmenu', c.orange, c.darkgrey, no)
                -- Popup menu: selected item.
                Group.new('PmenuSel', c.orange, c.black, r + b)
                -- Popup menu: scrollbar.
                Group.new('PmenuSbar', c.none, c.none, no)
                -- Popup menu: Thumb of the scrollbar.
                Group.new('PmenuThumb', c.lightblack, c.grey, no)
                -- hit-enter prompt and yes/no questions
                Group.new('Question', c.yellow, c.none, no)
                -- Current quickfix item in the quickfix window.
                Group.new('QuickFixLine', c.none, c.none, no)
                -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
                Group.new('Search', c.black, c.yellow, no)
                Group.new('SpecialKey', c.darkgrey, c.none, no)
                Group.new('NonText', c.darkgrey, c.none, no)
                Group.new('SpellBad', c.very_soft_red, c.none, uc)
                -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
                Group.new('SpellCap', c.very_soft_yellow, c.none, uc)
                Group.new('SpellLocal', c.very_soft_yellow, c.none, uc)
                Group.new('SpellRare', c.very_soft_yellow, c.none, uc)
                Group.new('StatusLine', c.none, c.none, no)
                Group.new('StatusLineNC', c.warmgrey, c.none, no)
                -- status line of current :terminal window
                Group.new('StatusLineTerm', c.none, c.none, no)
                -- status line of non-current :terminal window
                Group.new('StatusLineTermNC', c.none, c.none, no)
                -- tab pages line, not active tab page label
                Group.new('TabLine', c.none, c.black, no)
                -- tab pages line, where there are no labels
                Group.new('TabLineFill', c.none, c.black, no)
                -- tab pages line, active tab page label
                Group.new('TabLineSel', c.white, c.black, b)
                -- terminal window (see terminal-size-color)
                Group.new('Terminal', c.white, c.black, no)
                -- titles for output from ":set all", ":autocmd" etc.
                Group.new('Title', c.yellow, c.none, no)
                -- Visual mode selection when vim is "Not Owning the Selection".
                -- Only X11 Gui's gui-x11 and xterm-clipboard supports this.
                Group.new('VisualNOS', c.none, c.none, no)
                -- Visual mode selection
                Group.new('Visual', c.none, c.lightblack, no)
                -- warning messages
                Group.new('WarningMsg', c.orange, c.none, no)
                -- current match in 'wildmenu' completion
                Group.new('WildMenu', c.none, c.none, no)
                -- any comment
                Group.new('Comment', c.grey, c.none, i)
                vim.cmd([[highlight Comment ctermfg=grey guifg=#505050 guibg=none gui=italic term=italic cterm=italic]])
                -- any constant
                Group.new('Constant', c.purple, c.none, no)
                -- string constant: "this is a string"
                Group.new('String', c.chartreuse, c.none, no)
                -- a character constant: 'c', '\n'
                Group.new('Character', c.yellow, c.none, no)
                -- a number constant: 234, 0xff
                Group.new('Number', c.tomato, c.none, no)
                -- a boolean constant: TRUE, false
                Group.new('Boolean', c.purple, c.none, no)
                -- a floating point constant: 2.3e10
                Group.new('Float', c.tomato, c.none, no)
                -- any variable name
                Group.new('Identifier', c.orange, c.none, no)
                -- function name (also: methods for classes)
                Group.new('Function', c.blue, c.none, no)
                -- any statement
                Group.new('Statement', c.pink, c.none, no)
                -- if, then, else, endif, switch, etc.
                Group.new('Conditional', c.lightorange, c.none, no)
                -- for, do, while, etc.
                Group.new('Repeat', c.lightorange, c.none, no)
                -- case, default, etc.
                Group.new('Label', c.very_soft_orange, c.none, no)
                -- sizeof", "+", "*", etc.
                Group.new('Operator', c.aqua, c.none, no)
                -- any other keyword
                Group.new('Keyword', c.aqua, c.none, no)
                -- try, catch, throw
                Group.new('Exception', c.none, c.none, no)
                -- generic Preprocessor
                Group.new('PreProc', c.coral, c.none, no)
                -- preprocessor #include
                Group.new('Include', c.pink, c.none, no)
                -- preprocessor #define
                Group.new('Define', c.pink, c.none, no)
                -- same as Define
                Group.new('Macro', c.green, c.none, no)
                -- preprocessor #if, #else, #endif, etc.
                Group.new('PreCondit', c.green, c.none, no)
                -- int, long, char, etc.
                Group.new('Type', c.lime_green, c.none, i)
                -- static, register, volatile, etc.
                Group.new('StorageClass', c.darkturquoise, c.none, no)
                -- struct, union, enum, etc.
                Group.new('Structure', c.aqua, c.none, no)
                -- A typedef
                Group.new('Typedef', c.aqua, c.none, no)
                -- any special symbol
                Group.new('Special', c.purple, c.none, no)
                -- special character in a constant
                Group.new('SpecialChar', c.pink, c.none, no)
                -- you can use CTRL-] on this
                Group.new('Tag', c.pink, c.none, no)
                -- character that needs attention
                Group.new('Delimiter', c.pink, c.none, no)
                -- special things inside a comment
                Group.new('SpecialComment', c.aqua, c.none, no)
                -- debugging statements
                Group.new('Debug', c.none, c.none, no)
                -- text that stands out, HTML links
                Group.new('Underlined', c.aqua, c.none, ul)
                -- left blank, hidden
                Group.new('Ignore', c.none, c.none, no)
                -- any erroneous construct
                Group.new('Error', c.red, c.darkgrey, ul)
                -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
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
                Group.new("TSMethod", g.Function, g.Function, g.Function)
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
                Group.new('GitSignsChangeNr', c.changefg, c.black, no)
                Group.new('GitSignsChangeLn', c.changefg, c.black, no)
                Group.new('GitSignsAdd', c.addfg, c.black, no)
                Group.new('GitSignsAddNr', c.addfg, c.black, no)
                Group.new('GitSignsAddLn', c.addfg, c.black, no)
                Group.new('GitSignsDelete', c.red, c.black, no)
                Group.new('GitSignsDeleteNr', c.red, c.black, no)
                Group.new('GitSignsDeleteLn', c.red, c.black, no)
                Group.new('SignColumn', c.black, c.black, no)
                Group.new('IndentBlanklineChar', c.darkgrey, none, no)
                Group.new('IndentBlanklineSpaceChar', c.darkgrey, none, no)
                Group.new('IndentBlanklineSpaceCharBlankline', c.darkgrey, none, no)
                Group.new("LspDiagnosticsUnderlineError", c.red, c.none, ul)
                Group.new("LspDiagnosticsUnderlineHint", c.pink, c.none, ul)
                Group.new("LspDiagnosticsUnderlineWarning", c.orange, c.none, ul)
                Group.new("LspDiagnosticsUnderlineInformation", c.blue, c.none, ul)
                Group.new("LsPDiagnosticsDefaultError", c.red, c.none, ul)
                Group.new("LsPDiagnosticsDefaultHint", c.pink, c.none, no)
                Group.new("LsPDiagnosticsDefaultWarning", c.orange, c.none, no)
                Group.new("LsPDiagnosticsDefaultInformation", c.blue, c.none, no)
                Group.new("LsPDiagnosticsFloatingError", c.red, c.none, no)
                Group.new("LsPDiagnosticsFloatingHint", c.pink, c.none, no)
                Group.new("LsPDiagnosticsFloatingInformation", c.blue, c.none, no)
                Group.new("LsPDiagnosticsFloatingWarning", c.orange, c.none, no)
                Group.new("LsPDiagnosticsSignError", c.red, c.none, no)
                Group.new("LsPDiagnosticsSignHint", c.pink, c.none, no)
                Group.new("LsPDiagnosticsSignWarning", c.orange, c.none, no)
                Group.new("LsPDiagnosticsSignInformation", c.blue, c.none, no)
                Group.new("LsPDiagnosticsSignInformation", c.blue, c.none, no)
                Group.new("LsPDiagnosticsVirtualTextError", c.red, c.none, i)
                Group.new("LsPDiagnosticsVirtualTextHint", c.pink, c.none, i)
                Group.new("LsPDiagnosticsVirtualTextWarning", c.orange, c.none, i)
                Group.new("LsPDiagnosticsVirtualTextInformation", c.blue, c.none, i)
                Group.new("LspDiagnosticsUnderlineHint", c.green, c.none, ul)
                Group.new("LspDiagnosticsUnderlineInformation", c.blue, c.none, ul)
                Group.new("LspDiagnosticsUnderlineHint", c.pink, c.none, ul)
                Group.new("LspDiagnosticsUnderlineWarning", c.orange, c.none, ul)
                Group.new("MsgArea", c.lightgrey, c.black, no)
                Group.new("BufferCurrent", c.lightgrey, c.none, b)
                Group.new("BufferVisible", c.lightgrey, c.none, b)
                Group.new("BufferCurrentMod", c.red, c.none, i + b)
                Group.new("BufferVisibleMod", c.red, c.none, i + b)
                Group.new("BufferCurrentSign", c.black, c.none, no)
                Group.new("BufferVisibleSign", c.black, c.none, no)
                Group.new("BufferCurrentTarget", c.blue, c.none, b)
                Group.new("BufferVisibleTarget", c.blue, c.none, b)
                Group.new("BufferInactive", c.lightblack, c.none, no)
                Group.new("BufferInactiveMod", c.lightblack, c.none, i)
                Group.new("BufferInactiveTarget", c.blue, c.none, b)
                Group.new("BufferInactiveSign", c.black, c.none, no)
                Group.new("BufferTabpages", c.lightgrey, c.none, b)
                Group.new("BufferTabpagesFill", c.lightgrey, c.none, b)
                Group.new("FocusedSymbol", c.black, c.yellow, b)
                Group.new("markdownCode", c.blue, c.none, no)
                Group.new("DevIconLua", c.blue, c.none, no)
                Group.new("DevIconPy", c.blue, c.none, no)
                Group.new("DevIconMarkdown", c.lightblue, c.none, no)
                Group.new("DevIconMd", c.lightblue, c.none, no)
                Group.new("DevIconVim", c.lime_green, c.none, no)
                Group.new("DevIconVimrc", c.lime_green, c.none, no)
                Group.new("DevIconTerminal", c.lime_green, c.none, no)
                Group.new("DevIconConf", c.yellow, c.none, no)
                Group.new("DevIconBash", c.pink, c.none, no)
                Group.new("DevIconZshrc", c.aqua, c.none, no)
                Group.new("DevIconZsh", c.aqua, c.none, no)
                Group.new("DevIconZshenv", c.aqua, c.none, no)
                Group.new("DevIconZshprofile", c.aqua, c.none, no)
                Group.new("DevIconSh", c.pink, c.none, no)
                Group.new("DevIconDefault", c.lightgrey, c.none, no)
                Group.new("DashboardHeader", c.red, c.none, no)
                -- }}}
        end
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
                ensure_installed= {"python","html","cpp","css","vim","latex",'lua'},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
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
                    ultisnip = true;
                    buffer = true;
                    spell = true;
                    treesitter = true;
                };
            }
        end
    }
    -- }}}

    -- ULTISNIPS: snippets utility {{{
    use {
        'sirver/ultisnips',
        event = "InsertEnter",
        setup = function()
            vim.g.UltiSnipsExpandTrigger = '<tab>'
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
        event = "BufRead",
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
                current_line_blame_delay = 1000,
                current_line_blame_position = 'eol',
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil,
                word_diff = false,
                use_internal_diff = true,
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
    --- }}}

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
        event = "BufRead",
        config = function()
            require("indent_blankline").setup {
                buftype_exclude = {"terminal"},
                filetype_exclude = {'TelescopePrompt','packer','FZF', 'man', 'help', 'vimwiki', 'dashboard', 'WhichKey'},
            }
        end
    }
    -- }}}

    -- NVIM-LSPCONFIG: native lsp configuration {{{
    use {
        "neovim/nvim-lspconfig",
        event = "BufRead",
        config = function()
            local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
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
            local nvim_lsp = require('lspconfig')
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
                local opts = { noremap=true, silent=true }
                buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'H', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                buf_set_keymap('n', '<Leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
                buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
                buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
            end
            local servers = { 'pyright', 'clangd', 'vimls' }
            for _, lsp in ipairs(servers) do
                nvim_lsp[lsp].setup {
                    on_attach = on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    }
                }
            end
        end
    }
    --- }}}

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

    -- JUPYTERVIM: connect to a jupyter console and run cells {{{
    use {
        'jupyter-vim/jupyter-vim',
        ft = {'python'}
    }
    -- }}}

    -- NVIM-COMMENTER: syntax-aware comment keymaps {{{
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
            let g:AutoPairs = autopairs#AutoPairsDefine([{"open": "$", "close": "$", "filetype": "tex"},{"open": '\w\zs<', "close": '>'},{"open": '\\left(', 'close': '\right)', "filetype": "tex"},{"open": '\\left(', 'close': '\right)', "filetype": "vimwiki"},{"open": "_", "close": "_", "filetype": ["vimwiki"]},{"open": "_", "close": "_", "filetype": ["markdown"]},{"open": "__", "close": "__", "filetype": ["vimwiki"]},{"open": "__", "close": "__", "filetype": ["markdown"]},{"open": "~~", "close": "~~", "filetype": ["vimwiki"]},{"open": "~~", "close": "~~", "filetype": ["markdown"]},{"open": "++", "close": "++", "filetype": ["vimwiki"]},{"open": "|", "close": "|", "filetype": "help"},{"open": '\vclass .{-} (: (.{-}[ ,])+)? ?\{', 'close': '};', 'mapopen': '{', 'filetype': 'cpp'}])
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

    -- VIM ZETTEL: vim-helper, currently using only to insert front-matter automatically {{{
    use {
        'michal-h21/vim-zettel',
        event = "BufRead",
        ft = {"markdown","vimwiki"},
        config = function ()
            vim.g.zettel_format = "%raw_title"
            vim.cmd('let g:zettel_options = [{"template":"/home/lckdscl/wiki/docs/templates/md.tpl", "front_matter": [["tags",""], ["hide","navigation"]]}]')
            vim.g.zettel_default_mappings = 0
        end
    }
    -- }}}

    -- VIMWIKI: write a wiki in vim with markdown {{{
    use {
        'vimwiki/vimwiki',
        cmd = {
            "VimwikiIndex",
        },
        ft = {'markdown','vimwiki'},
        setup = function()
            vim.g.vimwiki_listsyms = '    x'
            vim.g.vimwiki_global_ext = 0
            vim.g.vimwiki_list = {
                {
                    path = '$HOME/wiki/docs',
                    ext = '.md',
                    syntax = 'markdown',
                    path_html = '$HOME/vimwiki.old/site_html/',
                }
            }
            vim.g.vimwiki_key_mappings = {
                all_maps = 1,
                global = 1,
                headers = 1,
                text_objs = 1,
                table_format = 0,
                table_mappings = 0,
                lists = 1,
                links = 1,
                html = 1,
                mouse = 1,
            }
            vim.g.vimwiki_use_mouse = 1
            vim.g.vimwiki_folding = 'expr'
            vim.g.vimwiki_auto_chdir = 1
            vim.g.vimwiki_toc_header = 'Contents'
            vim.g.vimwiki_global_ext = 0
            vim.g.vimwiki_markdown_link_ext = 1
            vim.g.vimwiki_hl_headers = 1
            vim.g.vimwiki_links_header = 'List of pages'
            vim.g.vimwiki_links_header_level = 2
            vim.g.vimwiki_tags_header = 'Tags'
        end
    }
    -- }}}

    -- UNDOTREE: display a panel with non-linear undo branches {{{
    use {
        'mbbill/undotree',
        cmd = "UndotreeToggle",
        config = function ()
            vim.g.undotree_ShortIndicators = 1
            vim.g.undotree_TreeNodeShape = ""
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

    -- FZF-LUA: fuzzy-finder fzf integration in lua {{{
    use {
        'ibhagwan/fzf-lua',
        event = "BufEnter",
        requires = {
            'vijaymarupudi/nvim-fzf',
            'kyazdani42/nvim-web-devicons'
        },
        config = function ()
            local actions = require "fzf-lua.actions"
            require'fzf-lua'.setup {
                winopts = {
                    win_height       = 0.85,
                    win_width        = 0.80,
                    win_row          = 0.30,
                    win_col          = 0.50,
                    win_border       = true,
                    window_on_create = function()
                        vim.cmd("set winhl=Normal:Normal")
                    end,
                },
                fzf_args = '--margin=3% --border=none',
                fzf_binds = {
                    '?:toggle-preview',
                    'f3:toggle-preview-wrap',
                    'shift-down:preview-page-down',
                    'shift-up:preview-page-up',
                    'ctrl-d:half-page-down',
                    'ctrl-u:half-page-up',
                    'ctrl-f:page-down',
                    'ctrl-b:page-up',
                    'ctrl-a:toggle-all',
                    'ctrl-l:clear-query',
                },
                preview_border      = 'border',
                preview_wrap        = 'nowrap',
                preview_opts        = 'hidden',
                preview_vertical    = 'down:45%',
                preview_horizontal  = 'right:60%',
                preview_layout      = 'flex',
                flip_columns        = 120,
                previewers = {
                    bat = {
                        cmd    = "bat",
                        args   = "",
                        config = nil,
                        theme  = 'wal',
                    }
                },
                files = {
                    prompt      = " FILES ",
                    cmd         = "rg --files --no-ignore --hidden --follow -g '!{.git}' -g '!{dosdevices}' -g '!{compatdata}' 2> /dev/null",
                    git_icons   = true,
                    file_icons  = true,
                    color_icons = true,
                    actions = {
                        ["default"]     = actions.file_edit,
                        ["ctrl-s"]      = actions.file_split,
                        ["ctrl-v"]      = actions.file_vsplit,
                        ["ctrl-t"]      = actions.file_tabedit,
                        ["ctrl-q"]      = actions.file_sel_to_qf,
                        ["ctrl-y"]      = function(selected) print(selected[2]) end,
                    }
                },
                git = {
                    files = {
                        prompt          = ' GITFILES ',
                        cmd             = 'git ls-files --exclude-standard',
                        git_icons       = true,           -- show git icons?
                        file_icons      = true,           -- show file icons?
                        color_icons     = true,           -- colorize file|git icons
                    },
                    status = {
                        prompt        = ' GITSTATUS ',
                        cmd           = "git status -s",
                        previewer     = "git_diff",
                        file_icons    = true,
                        git_icons     = true,
                        color_icons   = true,
                    },
                    commits = {
                        prompt          = ' GITCOMMITS ',
                        cmd             = "git log --pretty=oneline --abbrev-commit --color",
                        preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
                        actions = {
                            ["default"] = nil,
                        },
                    },
                    bcommits = {
                        prompt          = ' GITBCOMMITS ',
                        cmd             = "git log --pretty=oneline --abbrev-commit --color --",
                        preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
                        actions = {
                            ["default"] = nil,
                        },
                    },
                    branches = {
                        prompt          = ' GITBRANCHES ',
                        cmd             = "git branch --all --color",
                        preview         = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
                        actions = {
                            ["default"] = actions.git_switch,
                        },
                    },
                    icons = {
                        ["M"]           = { icon = "!", color = "green" },
                        ["D"]           = { icon = "", color = "red" },
                        ["A"]           = { icon = "+", color = "yellow" },
                        ["?"]           = { icon = "?", color = "blue" },
                    },
                },
                grep = {
                    prompt            = ' RG ',
                    input_prompt      = ' GREP ',
                    rg_opts           = "--hidden --column --line-number --no-heading --color=always --smart-case -g '!{.git,node_modules}/*'",
                    git_icons         = true,           -- show git icons?
                    file_icons        = true,           -- show file icons?
                    color_icons       = true,           -- colorize file|git icons
                    actions = {
                        ["default"]     = actions.file_edit,
                        ["ctrl-s"]      = actions.file_split,
                        ["ctrl-v"]      = actions.file_vsplit,
                        ["ctrl-t"]      = actions.file_tabedit,
                        ["ctrl-q"]      = actions.file_sel_to_qf,
                        ["ctrl-y"]      = function(selected) print(selected[2]) end,
                    }
                },
                oldfiles = {
                    prompt            = ' HISTORY ',
                    cwd_only          = false,
                },
                buffers = {
                    prompt            = '﬘ BUFFERS ',
                    file_icons        = true,         -- show file icons?
                    color_icons       = true,         -- colorize file|git icons
                    sort_lastused     = true,         -- sort buffers() by last used
                    actions = {
                        ["default"]     = actions.buf_edit,
                        ["ctrl-s"]      = actions.buf_split,
                        ["ctrl-v"]      = actions.buf_vsplit,
                        ["ctrl-t"]      = actions.buf_tabedit,
                        ["ctrl-x"]      = actions.buf_del,
                    }
                },
                colorschemes = {
                    prompt            = ' COLORSCHEMES ',
                    live_preview      = true,
                    actions = {
                        ["default"]     = actions.colorscheme,
                        ["ctrl-y"]      = function(selected) print(selected[2]) end,
                    },
                    winopts = {
                        win_height        = 0.55,
                        win_width         = 0.30,
                        window_on_create  = function()
                            vim.cmd("set winhl=Normal:Normal")
                        end,
                    },
                    post_reset_cb     = function()
                    end,
                },
                quickfix = {
                    file_icons        = true,
                    git_icons         = true,
                },
                lsp = {
                    prompt            = '漣LSP ',
                    cwd_only          = false,
                    async_or_timeout  = true,
                    file_icons        = true,
                    git_icons         = false,
                    lsp_icons         = true,
                    severity          = "hint",
                    icons = {
                        ["Error"]       = { icon = "", color = "red" },       -- error
                        ["Warning"]     = { icon = "", color = "yellow" },    -- warning
                        ["Information"] = { icon = "", color = "blue" },      -- info
                        ["Hint"]        = { icon = "", color = "magenta" },   -- hint
                    },
                },
                loclist = {},
                helptags = {},
                manpages = {
                    prompt = ' ',
                },
            }
        end
    }
    ----}}}

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
    }
    -- }}}

    -- LIGHTSPEED: navigate through a buffer quickly {{{
    use {
        'ggandor/lightspeed.nvim',
        event = 'CursorMoved',
    }
    -- }}}

    -- SPELLSITTER: spellcheck comments with treesitter {{{
    use {
    'lewis6991/spellsitter.nvim',

    config = function()
        require('spellsitter').setup {
            hl = 'SpellBad',
            captures = {'comment'},
        }
        end
    }
    -- }}}

    -- SPECS: fancy cursor animation when skipping big lines {{{
    use {
        'edluffy/specs.nvim',
        event = 'CursorMoved',
        config = function ()
            require('specs').setup{
                show_jumps  = true,
                min_jump = 10,
                popup = {
                    delay_ms = 0,
                    inc_ms = 10,
                    blend = 10,
                    width = 10,
                    winhl = "DiffChange",
                    fader = require('specs').pulse_fader,
                    resizer = require('specs').slide_resizer
                },
                ignore_filetypes = {},
                ignore_buftypes = {
                    nofile = true,
                },
            }
        end
    }
    -- }}}
end)
