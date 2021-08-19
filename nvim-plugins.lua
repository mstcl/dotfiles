-- :.config/nvim/lua/plugins.lua
-- vim: set foldmethod=marker:
return require('packer').startup(function()
-- PACKER {{{
use {
    'wbthomason/packer.nvim',
    event = "VimEnter",
}
-- }}}

-- GALAXYLINE {{{
use {
    "hhn-pham/galaxyline.nvim",
    branch = 'main',
    config = function()
        require("statusline")
    end,
}
-- }}}

-- WEB-DEVICONS {{{
use {
    'kyazdani42/nvim-web-devicons'
}
-- }}}

-- BARBAR {{{
use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
}

use {
    'rrethy/vim-hexokinase', run = 'make hexokinase',
    event = "BufRead",
}
-- }}}

-- COLORBUDDY {{{
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
            Group.new('Cursor', c.none, c.none, no)
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
            Group.new('ErrorMsg', c.black, c.red, no)
            -- the column separating vertically split windows
            Group.new('VertSplit', c.lightblack, c.none, no)
            -- line used for closed folds
            Group.new('Folded', c.grey, c.none, no)
            -- 'foldcolumn'
            Group.new('FoldColumn', c.none, c.darkgrey, no)
            -- column where signs are displayed
            Group.new('SignColumn', c.none, c.lightblack, no)
            -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
            Group.new('IncSearch', c.none, c.none, no)
            -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
            Group.new('LineNr', c.darkgrey, c.black, no)
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
            -- Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'
            -- Generally: text that is displayed differently from what it really is.
            Group.new('SpecialKey', c.lightblack, c.none, no)
            Group.new('NonText', c.lightblack, c.none, no)
            -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
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
            --  for fields
            Group.new('TSField', c.orange, c.none, no)
            -- for floats
            Group.new('TSFloat', g.Float, g.Float, g.Float)
            -- for functions (calls and definitions)
            Group.new('TSFunction', g.Function, g.Function, g.Function)
            -- for builtin functions: table.insert in lua
            Group.new('TSFuncBuiltin', c.camel, c.none, b)
            -- for macro defined functions (calls and definitions): each macro_rules in rust
            Group.new('TSFuncMacro', g.Macro, g.Macro, i)
            -- for includes: #include in C, use or extern crate in rust or require in lua
            Group.new('TSInclude', g.Include, g.Include, g.Include)
            -- for keywords that don't fall in previous categories
            Group.new('TSKeyword', g.Keyword, g.Keyword, g.Keyword)
            -- for keywords used to define a function
            Group.new('TSKeywordFunction', c.light_blue, c.none, no)
            -- for operators that are english words, e.g. and, as, or.
            Group.new('TSKeywordOperator', c.coral, c.none, no)
            -- for labels: label: in c and :label: in lua
            Group.new('TSLabel', g.Label, g.Label, g.Label)
            -- for method calls and definitions
            Group.new("TSMethod", g.Function, g.Function, g.Function)
            -- for identifiers referring to modules and namespaces
            Group.new('TSNamespace', c.light_yellow, c.none, no)
            -- for no highlighting
            Group.new('TSNone', c.none, c.none, no)
            -- for all numbers
            Group.new('TSNumber', g.Number, g.Number, g.Number)
            -- for any operator: +, but also -> and * in c
            Group.new('TSOperator', g.Operator, g.Operator, g.Operator)
            -- for parameters of a function
            Group.new('TSParameter', c.pure_pink, c.none, no)
            -- for references to parameters of a function
            Group.new('TSParameterReference', c.pure_pink, c.none, no)
            -- same as TSField
            Group.new('TSProperty', c.orange, c.none, no)
            -- for delimiters ie: .
            Group.new('TSPunctDelimiter', c.white, c.none, no)
            -- for brackets and parens
            Group.new('TSPunctBracket', c.white, c.none,  no)
            -- for special punctutation that does not fall in the categories before
            Group.new('TSPunctSpecial', c.white, c.none,  no)
            -- for keywords realted to loops
            Group.new('TSRepeat', g.Repeat, g.Repeat, g.Repeat)
            -- for strings
            Group.new('TSString', g.String, g.String, g.String)
            -- for regexes
            Group.new('TSStringRegex', c.very_light_orange, c.none, no)
            -- for escape characters within a string
            Group.new('TSStringEscape', c.orange, c.none, no)
            -- for identifiers referring to symbols or atoms
            Group.new('TSSymbol', c.none, c.none, no)
            -- tags like html tags
            Group.new('TSTag', g.Tag, g.Tag, g.Tag)
            -- tags delimiter like < > /
            Group.new('TSTagDelimiter', g.Delimiter, g.Delimiter, g.Delimiter)
            -- for strings considered text in a markup language
            Group.new('TSText', c.white, c.none, no)
            -- for text to be represented in bold.
            Group.new('TSStrong', c.white, c.none, b)
            -- for text to be represented with emphasis
            Group.new('TSEmphasis', c.white, c.none, i)
            -- for text to be represented with an underline
            Group.new('TSUnderline', c.white, c.none, ul)
            -- for strikethrough text
            Group.new('TSStrike', c.white, c.none, st)
            -- text that is part of a title
            Group.new('TSTitle', c.white, c.none, b)
            -- literal text
            Group.new('TSLiteral', c.white, c.none, no)
            -- any URI like a link or email
            Group.new('TSURI', c.orange, c.none, uc)
            -- for LaTex-like math environments
            Group.new('TSMath', c.white, c.none, i)
            -- for footnotes, text references, citations
            Group.new('TSTextReference', c.orange, c.none, i)
            -- for text environments of markup languages
            Group.new('TSEnviroment', c.white, c.none, no)
            -- for the name/the string indicating the type of text environment
            Group.new('TSEnviromentName', c.tomato, c.none, no)
            -- text representation of an informational note
            Group.new('TSNote', c.white, c.none, no)
            -- text representation of a warning note
            Group.new('TSWarning', g.WarningMsg, g.WarningMsg, g.WarningMsg)
            -- text representation of a danger note
            Group.new('TSDanger', g.Error, g.Error, b)
            -- for types
            Group.new('TSType', g.Type, g.Type, i)
            -- For builtin types
            Group.new('TSTypeBuiltin', g.Type, g.Type, g.Type)
            -- any variable name that does not have another highlight
            Group.new('TSVariable', c.vivid_orange, c.none, no)
            -- variable names that are defined by the languages, like `this` or `self`
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
            Group.new('WhichKeyFloat', c.none, c.darkgrey, no)
            Group.new('HighlightedyankRegion', c.none, c.none, r)
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
            Group.new("TelescopeBorder", c.lightblack, c.none, no)
            Group.new("MsgArea", c.lightgrey, c.black, no)
            Group.new("BufferCurrent", c.lightgrey, c.none, b)
            Group.new("BufferVisible", c.lightgrey, c.none, b)
            Group.new("BufferCurrentMod", c.red, c.none, i + b)
            Group.new("BufferVisibleMod", c.red, c.none, i + b)
            Group.new("BufferCurrentSign", c.lightgrey, c.none, no)
            Group.new("BufferVisibleSign", c.lightgrey, c.none, no)
            Group.new("BufferCurrentTarget", c.blue, c.none, b)
            Group.new("BufferVisibleTarget", c.blue, c.none, b)
            Group.new("BufferInactive", c.lightblack, c.none, no)
            Group.new("BufferInactiveMod", c.lightblack, c.none, i)
            Group.new("BufferInactiveTarget", c.blue, c.none, b)
            Group.new("BufferInactiveSign", c.black, c.none, no)
            Group.new("BufferTabpages", c.lightgrey, c.none, b)
            Group.new("BufferTabpagesFill", c.lightgrey, c.none, b)
            -- }}}
    end
}
-- }}}

-- TREESITTER {{{
use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed= {"python","html","cpp","css","vim","latex",'lua'},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
-- }}}

-- COMPE {{{
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

-- GITSIGNS {{{
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

-- DASHBOARD {{{
use {
    "glepnir/dashboard-nvim",
}
-- }}}

-- NEOSCROLL {{{
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

-- ZEN MODE {{{
use {
    "folke/zen-mode.nvim",
    wants = "twilight.nvim",
    cmd = "ZenMode",
    config = function()
        require("zen-mode").setup {
              window = {
                options = {
                    signcolumn = "no", -- disable signcolumn
                    number = true, -- disable number column
                    relativenumber = true, -- disable relative numbers
                    cursorline = true, -- disable cursorline
                    cursorcolumn = false, -- disable cursor column
                    foldcolumn = "0", -- disable fold column
                    list = false, -- disable whitespace characters
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

-- TWILIGHT {{{
use {
    "folke/twilight.nvim",
    cmd = "Twilight",
    config = function()
        require("twilight").setup {}
    end
}
--}}}

-- INDENT-BLANKLINE {{{
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

-- NVIM-LSP-CONFIG {{{
use {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    config = function()
        require'lspconfig'.clangd.setup{}
        require'lspconfig'.pyright.setup{}
        require'lspconfig'.vimls.setup{}
        require'lspconfig'.bashls.setup{}
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
            buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
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

-- RAINBOW {{{
use {
    'luochen1990/rainbow',
    event = 'BufRead'
}
-- }}}

-- TS-RAINBOW {{{
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

-- VIM-STAY {{{
use {
    'zhimsel/vim-stay',
}
-- }}}

-- ULTISNIPS {{{
use {
    'sirver/ultisnips',
    event = "InsertEnter",
}
-- }}}

-- VISTA {{{
use {
    'liuchengxu/vista.vim',
    cmd = {
        "Vista",
        "Vista!!",
        "Vista!",
    },
}
-- }}}

-- JUPYTERVIM {{{
use {
    'jupyter-vim/jupyter-vim',
    ft = {'python'}
}
-- }}}

-- JUPYTEXT {{{
use {
    'goerz/jupytext.vim',
}
-- }}}

-- NERDCOMMENTER {{{
use {
    'preservim/nerdcommenter',
    event = "BufRead"
}
-- }}}

-- AUTOPAIRS {{{
use {
    'LunarWatcher/auto-pairs'
}
-- }}}

-- EASYALIGN {{{
use {
    'junegunn/vim-easy-align',
    keys = "<Plug>(EasyAlign)",
}
-- }}}

-- HIGHLIGHTED YANK {{{
use {
    'machakann/vim-highlightedyank',
    event = "BufRead",
}
-- }}}

-- VIM ZETTEL {{{
use {
    'michal-h21/vim-zettel',
    event = "BufRead",
    ft = {"markdown","vimwiki"}
}
-- }}}

-- VIMWIKI {{{
use {
    'vimwiki/vimwiki',
    cmd = {
        "VimwikiIndex",
    },
    ft = {'markdown','vimwiki'}
}
-- }}}

-- UNDOOTREE {{{
use {
    'mbbill/undotree',
    event = "BufEnter",
    cmd = {
        "UndoTreeToggle",
    }
}
-- }}}

-- VIMSURROUND {{{
use {
    'tpope/vim-surround',
    event = "BufRead"
}
-- }}}

-- FZF {{{
use {
    'ibhagwan/fzf-lua',
    cmd = {"FzfLua"},
    requires = {
        'vijaymarupudi/nvim-fzf',
        'kyazdani42/nvim-web-devicons'},
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
                prompt            = ' Rg ',
                input_prompt      = ' Grep For ',
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
                prompt            = ' History ',
                cwd_only          = false,
            },
            buffers = {
                prompt            = '﬘ Buffers ',
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
                prompt            = ' Colorschemes ',
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
                prompt            = ' ',
                cwd_only          = false,
                async_or_timeout  = true,
                file_icons        = true,
                git_icons         = false,
                lsp_icons         = true,
                severity          = "hint",
                icons = {
                    ["Error"]       = { icon = "", color = "red" },       -- error
                    ["Warning"]     = { icon = "", color = "yellow" },    -- warning
                    ["Information"] = { icon = "", color = "blue" },      -- info
                    ["Hint"]        = { icon = "", color = "magenta" },   -- hint
                },
            },
            loclist = {},
            helptags = {},
            manpages = {
                prompt            = ' ',
            },
        }
    end
}
----}}}

-- WILDER {{{
use {
    'gelguy/wilder.nvim',
}
-- }}}

end)
