vim.g.colors_name = 'gruvbox'

local black =         {'#282828', 0,   'black'}
local blackish =      {'#202020', 0,   'black'}
local blacker =       {'#1d2021', 0,   'black'}
local gray =          {'#665c54', 244, 'gray'}
local gray_dark =     {'#504945', 237, 'darkgrey'}
local gray_darker =   {'#45403d', 235, 'gray'}
local gray_darkerer = {'#3a3735', 235, 'gray'}
local gray_darkest =  {'#32302f', 233, 'gray'}
local gray_medium =   {'#d5c4a1', 243, 'gray'}
local gray_light =    {'#f2e5bc', 251, 'gray'}
local white =         {'#f9f5d7', 15,  'white'}
local red =           {'#cc241d', 196, 'red'}
local red_dark =      {'#9d0006', 124, 'darkred'}
local red_light =     {'#fb4934', 203, 'red'}
local orange =        {'#d65d0e', 208, 'darkyellow'}
local tan =           {'#af3a03', 180, 'darkyellow'}
local orange_light =  {'#fe8019', 214, 'yellow'}
local yellow =        {'#d79921', 220, 'yellow'}
local green_dark =    {'#79740e', 83, 'darkgreen'}
local green =         {'#98971a', 72, 'green'}
local green_light =   {'#b8bb26', 72, 'green'}
local turquoise =     {'#689d6a', 33, 'green'}
local teal =          {'#076678', 38, 'darkblue'}
local blue =          {'#458588', 63, 'blue'}
local cyan =          {'#83a598', 87, 'cyan'}
local ice  =          {'#A0B7B7', 63, 'cyan'}
local magenta      =  {'#b16286', 126, 'magenta'}
local magenta_dark =  {'#8f3f71', 126, 'darkmagenta'}
local pink         =  {'#d3869b', 162, 'magenta'}
local pink_light   =  {'#a9939d', 38,  'white'}
local purple       =  {'#837f90', 129, 'magenta'}
local purple_light =  {'#bdbbc4', 63,  'magenta'}
local addfg =         {'#647460', 51, 'cyan' }
local addbg =         {'#263747', 51, 'cyan' }
local delfg =         {'#473447', 51, 'cyan' }
local delbg =         {'#382A38', 51, 'cyan' }
local changebg =      {'#464d6d', 51, 'cyan' }
local changefg =      {'#272B3D', 51, 'cyan' }

local BG = 'bg'
local FG = 'fg'
local NONE = {}

local highlight_group_normal = {fg=gray_light, bg=black}

local highlight_groups = {
    --[[ 4.1. Text Analysis ]]
    Comment = {fg=gray, style='italic'},
    NonText = {fg=gray_darker},
    EndOfBuffer = 'NonText',
    Whitespace  = 'NonText',

    --[[ 4.1.1. Literals]]
    Constant = {fg=blue},
    String = {fg=green_dark},
    Character = {fg=green},
    Number  = {fg=orange_light},
    Boolean = {fg=yellow},
    Float   = 'Number',

    --[[ 4.1.2. Identifiers]]
    Identifier = {fg=gray_light},
    Function = {fg=orange_light, style='bold'},

    --[[ 4.1.3. Syntax]]
    Statement   = {fg=green},
    Conditional = {fg=red, style='italic'},
    Repeat   = {fg=red_dark, style='italic'},
    Label    = {fg=pink, style='bold'},
    Operator = {fg=gray_light, style='bold'},
    Keyword  = {fg=purple},
    Exception = {fg=red_light, style='bold'},
    Noise = 'Delimiter',

    --[[ 4.1.4. metatextual information]]
    preproc = {fg=turquoise},
    include = {fg=pink, style={'nocombine', 'italic'}},
    Define = {fg=blue, style='nocombine'},
    Macro  = {fg=blue, style='italic'},
    PreCondit = {fg=tan, style='italic'},

    --[[ 4.1.5. Semantics]]
    Type = {fg=magenta},
    StorageClass = {fg=orange_light, style='bold'},
    Structure = {fg=yellow, style='bold'},
    Typedef = {fg=tan, style='italic'},

    --[[ 4.1.6. Edge Cases]]
    Special = {fg=blue, style='bold'},
    SpecialChar = {fg=red_light, style='italic'},
    SpecialKey = 'Character',
    Tag = 'Underlined',
    Delimiter = {fg=white},
    SpecialComment = {fg=gray, style={'bold', 'nocombine'}},
    Debug = 'WarningMsg',

    --[[ 4.1.7. Help Syntax]]
    Underlined = {fg=turquoise, style='underline'},
    Ignore = {fg=gray},
    Error = {fg=black, bg=red, style={'bold', 'underline'}},
    Todo = {fg=yellow, style={'bold', 'underline'}},
    Hint = {fg=black, bg=magenta, style='bold'},
    Info = {fg=black, bg=pink_light, style='bold'},
    Warning = {fg=black, bg=orange, style='bold'},

    --[[ 4.2... Editor UI  ]]
    --[[ 4.2.1. Status Line]]
    StatusLine = {fg=green_light, bg=gray_dark},
    StatusLineNC = function(self) return {fg=gray, bg=self.StatusLine.bg} end,
    StatusLineTerm = 'StatusLine',
    StatusLineTermNC = 'StatusLineNC',
    MsgArea = {bg=gray_darkerer},

    --[[ 4.2.2. Separators]]
    VertSplit = {fg=gray_darker, bg=black},
    TabLine = {fg=blackish, bg=blackish},
    TabLineFill = {fg=blackish, bg=blackish},
    TabLineSel = {fg=FG, bg=BG},
    Title = {style='bold'},

    --[[ 4.2.3. Conditional Line Highlighting]]
    Conceal = {bg=BG},
    CursorLine = {bg=gray_darkest},
    CursorLineNr = function(self) return {fg=gray_medium, bg=self.LineNr.bg} end,
    debugBreakpoint = 'ErrorMsg',
    debugPC = 'ColorColumn',
    LineNr = {fg=gray_dark, bg=black},
    QuickFixLine = {bg=gray_darkest},
    Visual = {bg=gray_dark},
    VisualNOS = {bg=gray_darkest},

    --[[ 4.2.4. Popup Menu]]
    Pmenu = {fg=gray_medium, bg=gray_darker},
    PmenuSbar = {fg=blacker, bg=gray_darker},
    PmenuSel  = {fg=gray_medium, bg=gray_darker, style={"inverse", "bold"}},
    PmenuThumb = {fg=gray_dark, bg=gray_dark},
    Wilder = {bg=black},
    WilderScrole = {bg=black},
    WildMenu = 'PmenuSel',
    NormalFloat = {fg=white, bg=black},
    FloatBorder = {fg=gray_dark, bg=black},

    --[[ 4.2.5. Folds]]
    FoldColumn = {fg=gray_dark, bg=blackish, style='bold'},
    Folded = {fg=gray_dark,  bg=black, style={'bold','italic'}},

    --[[ 4.2.6. Diffs]]
    DiffAdd    = {fg=addfg, bg=addbg},
    DiffChange = {fg=changefg, bg=changebg},
    DiffDelete = {fg=delfg, bg=delbg},
    DiffText   = function(self) return {fg=self.DiffAdd.fg, bg=yellow} end,

    --[[ 4.2.7. Searching]]
    IncSearch  = {style={'bold','inverse'}},
    MatchParen = {style={'inverse'}},
    Search = {style={'bold', 'underline'}},

    --[[ 4.2.8. Spelling]]
    SpellBad   = {style={'undercurl', color=red}},
    SpellCap   = {style={'undercurl', color=green}},
    SpellLocal = {style={'undercurl', color=yellow}},
    SpellRare  = {style={'undercurl', color=blue}},

    --[[ 4.2.9. Conditional Column Highlighting]]
    ColorColumn = {bg=gray_dark, style='inverse'},
    SignColumn  = {bg=black},

    --[[ 4.2.10. Messages]]
    ErrorMsg = {fg=red, style='bold'},
    HintMsg  = {fg=magenta, style='italic'},
    InfoMsg  = {fg=pink_light, style='italic'},
    ModeMsg  = {fg=yellow},
    WarningMsg = {fg=orange, style='bold'},
    Question   = {fg=teal, style='bold'},

    --[[ 4.2.11. LSP ]]
    DiagnosticError = 'Error',
    DiagnosticFloatingError = function(self) return {fg=self.ErrorMsg.fg, bg=black} end,
    DiagnosticSignError = function(self) return {fg=self.ErrorMsg.fg, bg=black} end,
    DiagnosticVirtualTextError = function(self) return {fg=self.ErrorMsg.fg, bg=NONE, style='italic'} end,

    DiagnosticWarn = 'Warning',
    DiagnosticFloatingWarn =  function(self) return {fg=self.WarningMsg.fg, bg=black} end,
    DiagnosticSignWarn = function(self) return {fg=self.WarningMsg.fg, bg=black} end,
    DiagnosticVirtualTextWarn = function(self) return {fg=self.WarningMsg.fg, bg=NONE, style='italic'} end,

    DiagnosticHint = 'Hint',
    DiagnosticFloatingHint = function(self) return {fg=self.HintMsg.fg, bg=black} end,
    DiagnosticSignHint = function(self) return {fg=self.HintMsg.fg, bg=black} end,
    DiagnosticVirtualTextHint = function(self) return {fg=self.HintMsg.fg, bg=NONE, style='italic'} end,

    DiagnosticInfo = 'Info',
    DiagnosticFloatingInfo = function(self) return {fg=self.InfoMsg.fg, bg=black} end,
    DiagnosticSignInfo = function(self) return {fg=self.InfoMsg.fg, bg=black} end,
    DiagnosticVirtualTextInfo = function(self) return {fg=self.InfoMsg.fg, bg=NONE, style='italic'} end,

    DiagnosticUnderlineError = {style={"undercurl", color=red}},
    DiagnosticUnderlineHint  = {style={"undercurl", color=magenta}},
    DiagnosticUnderlineInfo  = {style={"undercurl", color=blue}},
    DiagnosticUnderlineWarn = {style={"undercurl", color=orange}},

    --[[ 4.2.12. Cursor ]]
    Cursor   = {style='inverse'},
    CursorIM = 'Cursor',
    CursorColumn = {bg=gray_dark},

    --[[ 4.2.13. Misc ]]
    Directory = {fg=ice, style='bold'},

    --[[ 4.3. Programming Languages ]]
    --[[ 4.3.1. C ]]
    cConstant    = 'Constant',
    cCustomClass = 'Type',

    --[[ 4.3.2. C++ ]]
    cppSTLexception = 'Exception',
    cppSTLnamespace = 'String',

    --[[ 4.3.3 C# ]]
    csBraces = 'Delimiter',
    csClass  = 'Structure',
    csClassType = 'Type',
    csContextualStatement = 'Conditional',
    csEndColon = 'Delimiter',
    csGeneric  = 'Typedef',
    csInterpolation = 'Include',
    csInterpolationDelimiter = 'SpecialChar',
    csLogicSymbols  = 'Operator',
    csModifier = 'Keyword',
    csNew = 'Operator',
    csNewType = 'Type',
    csParens  = 'Delimiter',
    csPreCondit  = 'PreProc',
    csQuote = 'Delimiter',
    csRepeat  = 'Repeat',
    csStorage = 'StorageClass',
    csUnspecifiedStatement = 'Statement',
    csXmlTag = 'Define',
    csXmlTagName = 'Define',
    razorCode = 'PreProc',
    razorcsLHSMemberAccessOperator = 'Noise',
    razorcsRHSMemberAccessOperator = 'razorcsLHSMemberAccessOperator',
    razorcsStringDelimiter = 'razorhtmlValueDelimiter',
    razorcsTypeNullable = 'Special',
    razorcsUnaryOperatorKeyword = 'Operator',
    razorDelimiter = 'Delimiter',
    razorEventAttribute = 'PreCondit',
    razorFor  = 'razorIf',
    razorhtmlAttribute = 'htmlArg',
    razorhtmlAttributeOperator = 'Operator',
    razorhtmlTag = 'htmlTag',
    razorhtmlValueDelimiter = 'Delimiter',
    razorIf  = 'PreCondit',
    razorImplicitExpression = 'PreProc',
    razorLine = 'Constant',
    razorUsing = 'Include',

    --[[ 4.3.4. CSS ]]
    cssAtRule          = 'PreCondit',
    cssAttr            = 'Keyword',
    cssAttrComma       = 'Noise',
    cssAttrRegion      = 'Keyword',
    cssBraces          = 'Delimiter',
    cssClassName       = 'Identifier',
    cssClassNameDot    = 'Noise',
    cssFlexibleBoxAttr = 'cssAttr',
    cssFunctionComma   = 'Noise',
    cssImportant       = 'Exception',
    cssNoise           = 'Noise',
    cssProp            = 'Label',
    cssPseudoClass     = 'Special',
    cssPseudoClassId   = 'cssSelectorOp',
    cssSelectorOp      = 'Operator',
    cssTagName         = 'Structure',
    cssUnitDecorators  = 'Type',
    scssAmpersand      = 'Special',
    scssAttribute      = 'Noise',
    scssBoolean        = 'Boolean',
    scssDefault        = 'Keyword',
    scssElse           = 'scssIf',
    scssMixinName      = function(self)
        local super = self.cssClassName
        return {bg=super.bg, fg=super.fg, style='Italic'}
    end,
    scssIf             = 'PreCondit',
    scssInclude        = 'Include',
    scssSelectorChar   = 'Delimiter',
    scssDefinition     = 'PreProc',
    scssSelectorName   = 'Identifier',
    scssVariable       = 'Define',
    scssVariableAssignment = 'Operator',

    --[[ 4.3.5. Dart ]]
    dartLibrary = 'Statement',

    --[[ 4.3.6. dot ]]
    dotKeyChar = 'Character',
    dotType    = 'Type',

    --[[ 4.3.7. Go ]]
    goBlock    = 'Delimiter',
    goBoolean  = 'Boolean',
    goBuiltins = 'Operator',
    goField    = 'Identifier',
    goFloat    = 'Float',
    goFormatSpecifier = 'Character',
    goFunction = 'Function',
    goFunctionCall   = 'goFunction',
    goFunctionReturn = NONE,
    goMethodCall = 'goFunctionCall',
    goParamType  = 'goReceiverType',
    goPointerOperator = 'SpecialChar',
    goPredefinedIdentifiers = 'Constant',
    goReceiver     = 'goBlock',
    goReceiverType = 'goTypeName',
    goSimpleParams = 'goBlock',
    goType = 'Type',
    goTypeConstructor = 'goFunction',
    goTypeName  = 'Type',
    goVarAssign = 'Identifier',
    goVarDefs   = 'goVarAssign',

    --[[ 4.3.8. HTML ]]
    htmlArg    = 'Label',
    htmlBold   = {fg=highlight_group_normal.fg, style='bold'},
    htmlTitle  = 'htmlBold',
    htmlEndTag = 'htmlTag',
    htmlH1 = 'markdownH1',
    htmlH2 = 'markdownH2',
    htmlH3 = 'markdownH3',
    htmlH4 = 'markdownH4',
    htmlH5 = 'markdownH5',
    htmlH6 = 'markdownH6',
    htmlItalic  = {style='italic'},
    htmlSpecialTagName = 'Keyword',
    htmlTag  = 'Special',
    htmlTagN = 'Typedef',
    htmlTagName = 'Type',

    --[[ 4.3.9. Java ]]
    javaClassDecl = 'Structure',

    --[[ 4.3.10. JavaScript ]]
    jsFuncBlock   = 'Function',
    jsObjectKey   = 'Type',
    jsReturn      = 'Keyword',
    jsVariableDef = 'Identifier',

    --[[ 4.3.11. JSON ]]
    jsonBraces = 'luaBraces',
    jsonEscape = 'SpecialChar',
    jsonKeywordMatch = 'Operator',
    jsonNull   = 'Constant',
    jsonQuote  = 'Delimiter',
    jsonString = 'String',
    jsonStringSQError = 'Exception',

    --[[ 4.3.12. Lua ]]
    luaBraces   = 'Structure',
    luaBrackets = 'Delimiter',
    luaBuiltin  = 'Keyword',
    luaComma    = 'Delimiter',
    luaFuncArgName = 'Identifier',
    luaFuncCall = 'Function',
    luaFuncId   = 'luaNoise',
    luaFuncKeyword = 'Type',
    luaFuncName   = 'Function',
    luaFuncParens = 'Delimiter',
    luaFuncTable  = 'Structure',
    luaIn     = 'luaRepeat',
    luaLocal  = 'Type',
    luaNoise  = 'Delimiter',
    luaParens = 'Delimiter',
    luaSpecialTable = 'Structure',
    luaSpecialValue = 'Function',
    luaStringLongTag = function(self)
        local delimiter = self.Delimiter
        return {bg=delimiter.bg, fg=delimiter.fg, style='italic'}
    end,

    --[[ 4.3.12. Make ]]
    makeCommands   = 'Statment',
    makeSpecTarget = 'Type',

    --[[ 4.3.13. Markdown ]]
    markdownCode = 'mkdCode',
    markdownStrike = {fg=gray_dark, style={"strikethrough"}},
    markdownJekyllFrontMatter = {fg=gray_dark},
    markdownJekyllDelimiter = {fg=gray_dark},
    markdownCodeDelimiter = 'mkdCodeDelimiter',
    markdownHeadingDelimiter = 'NonText',
    markdownH1 = {bg=red, fg=black, style={'bold', 'underline'}},
    markdownH2 = {bg=orange, fg=black, style={'bold', 'underline'}},
    markdownH3 = {bg=yellow, fg=black, style={'bold', 'underline'}},
    markdownH4 = {bg=turquoise, fg=black, style={'bold', 'underline'}},
    markdownH5 = {bg=cyan, fg=black, style={'bold', 'underline'}},
    markdownH6 = {bg=purple_light, fg=black, style={'bold', 'underline'}},
    markdownLinkDelimiter = 'Delimiter',
    markdownLinkTextDelimiter = 'markdownLinkDelimiter',
    markdownUrl = 'Underlined',
    mkdBold = 'Ignore',
    mkdBoldItalic = 'mkdBold',
    mkdCode = 'Keyword',
    mkdCodeDelimiter = 'mkdBold',
    mkdCodeEnd = 'mkdCodeStart',
    mkdCodeStart = 'mkdCodeDelimiter',
    mkdHeading = 'Delimiter',
    mkdItalic  = 'mkdBold',
    mkdLineBreak = 'NonText',
    mkdListItem  = 'Special',
    mkdRule = function(self) return {fg=self.Ignore.fg, style={'underline', color=self.Delimiter.fg}} end,

    --[[ 4.3.20. Python ]]
    pythonBrackets    = 'Delimiter',
    pythonBuiltinFunc = 'Operator',
    pythonBuiltinObj  = 'Type',
    pythonBuiltinType = 'Type',
    pythonClass       = 'Structure',
    pythonClassParameters = 'pythonParameters',
    pythonDecorator  = 'PreProc',
    pythonDottedName = 'Identifier',
    pythonError     = 'Error',
    pythonException = 'Exception',
    pythonInclude   = 'Include',
    pythonIndentError = 'pythonError',
    pythonLambdaExpr  = 'pythonOperator',
    pythonOperator = 'Operator',
    pythonParam    = 'Identifier',
    pythonParameters = 'Delimiter',
    pythonSelf = 'Statement',
    pythonSpaceError = 'pythonError',
    pythonStatement  = 'Statement',

    --[[ 4.3.21. Ruby ]]
    rubyClass  = 'Structure',
    rubyDefine = 'Define',
    rubyInterpolationDelimiter = 'Delimiter',

    --[[ 4.3.23. Scala ]]
    scalaKeyword = 'Keyword',
    scalaNameDefinition = 'Identifier',

    --[[ 4.3.24. shell ]]
    shDerefSimple = 'SpecialChar',
    shFunctionKey = 'Function',
    shLoop  = 'Repeat',
    shParen = 'Delimiter',
    shQuote = 'Delimiter',
    shSet   = 'Statement',
    shTestOpr = 'Debug',

    --[[ 4.3.25. Solidity ]]
    solBuiltinType  = 'Type',
    solContract     = 'Typedef',
    solContractName = 'Function',

    --[[ 4.3.26. TOML ]]
    tomlComment = 'Comment',
    tomlDate  = 'Special',
    tomlFloat = 'Float',
    tomlKey   = 'Label',
    tomlTable = 'Structure',

    --[[ 4.3.27. VimScript ]]
    vimCmdSep   = 'Delimiter',
    vimFunction = 'Function',
    vimFgBgAttrib = 'Constant',
    vimHiCterm = 'Label',
    vimHiCtermFgBg = 'vimHiCterm',
    vimHiGroup = 'Typedef',
    vimHiGui   = 'vimHiCterm',
    vimHiGuiFgBg = 'vimHiGui',
    vimHiKeyList = 'Operator',
    vimIsCommand = 'Identifier',
    vimOption = 'Keyword',
    vimScriptDelim = 'Ignore',
    vimSet = 'String',
    vimSetEqual = 'Operator',
    vimSetSep   = 'Delimiter',
    vimUserFunc = 'vimFunction',

    --[[ 4.3.28. XML ]]
    xmlAttrib = 'htmlArg',
    xmlEndTag = 'xmlTag',
    xmlEqual  = 'Operator',
    xmlTag    = 'htmlTag',
    xmlTagName = 'htmlTagName',

    --[[ 4.3.29. SQL ]]
    sqlKeyword = 'Keyword',
    sqlParen   = 'Delimiter',
    sqlSpecial = 'Constant',
    sqlStatement = 'Statement',
    sqlParenFunc = 'Function',

    --[[ 4.3.30. dos INI ]]
    dosiniHeader = 'Title',
    dosiniLabel  = 'Label',

    --[[ 4.3.31. Crontab ]]
    crontabDay  = 'StorageClass',
    crontabDow  = 'String',
    crontabHr   = 'Number',
    crontabMin  = 'Float',
    crontabMnth = 'Structure',

    --[[ 4.3.32. PlantUML ]]
    plantumlArrowLR   = 'Statement',
    plantumlColonLine = NONE,
    plantumlMindmap   = 'Label',
    plantumlMindmap2  = 'Label',

    --[[ 4.3.33. YAML ]]
    yamlKey = 'Label',

    --[[ 4.3.34. Git ]]
    diffAdded = 'DiffAdd',
    diffRemoved = 'DiffDelete',
    gitcommitHeader = 'SpecialComment',
    gitcommitDiscardedFile = 'gitcommitSelectedFile',
    gitcommitOverFlow = 'Error',
    gitcommitSelectedFile = 'Directory',
    gitcommitSummary  = 'Title',
    gitcommitUntrackedFile = 'gitcommitSelectedFile',
    gitconfigAssignment = 'String',
    gitconfigEscape = 'SpecialChar',
    gitconfigNone  = 'Operator',
    gitconfigSection = 'Structure',
    gitconfigVariable = 'Label',
    gitrebaseBreak = 'Keyword',
    gitrebaseCommit = 'Tag',
    gitrebaseDrop = 'Exception',
    gitrebaseEdit = 'Define',
    gitrebaseExec = 'PreProc',
    gitrebaseFixup = 'gitrebaseSquash',
    gitrebaseMerge = 'PreProc',
    gitrebasePick  = 'Include',
    gitrebaseReset = 'gitrebaseLabel',
    gitrebaseReword  = 'gitrebasePick',
    gitrebaseSquash  = 'Macro',
    gitrebaseSummary = 'Title',

    --[[ 4.3.35. Vimtex ]]
    texMathRegion = 'Number',
    texMathSub   = 'Number',
    texMathSuper = 'Number',
    texMathRegionX  = 'Number',
    texMathRegionXX = 'Number',

    --[[ 4.3.36. Coq ]]
    coqConstructor   = 'Constant',
    coqDefBinderType = 'coqDefType',
    coqDefContents1  = 'coqConstructor',
    coqDefType  = 'Typedef',
    coqIndBinderTerm  = 'coqDefBinderType',
    coqIndConstructor = 'Delimiter',
    coqIndTerm = 'Type',
    coqKwd = 'Keyword',
    coqKwdParen   = 'Function',
    coqProofDelim = 'coqVernacCmd',
    coqProofDot   = 'coqTermPunctuation',
    coqProofPunctuation = 'coqTermPunctuation',
    coqRequire = 'Include',
    coqTactic  = 'Operator',
    coqTermPunctuation = 'Delimiter',
    coqVernacCmd = 'Statement',
    coqVernacPunctuation = 'coqTermPunctuation',

    --[[ 4.3.37 Help ]]
    helpHeader = 'Label',
    helpOption = 'Keyword',
    helpHeadline = 'Title',
    helpSectionDelim = 'Delimiter',
    helpHyperTextJump = 'Underlined',

    --[[ 4.3.38 Man ]]
    -- manBold = function(self) return vim.tbl_extend('force', self.mkdCode, {style='nocombine'}) end,
    manOptionDesc = 'Special',
    manReference = 'Tag',
    manUnderline = 'Label',

    --[[ 4.4. Plugins
    Everything in this section is OPTIONAL. Feel free to remove everything
    here if you don't want to define it, or add more if there's something
    missing.
    ]]
    --[[ 4.4.1. ALE ]]
    ALEErrorSign   = 'ErrorMsg',
    ALEWarningSign = 'WarningMsg',

    --[[ 4.4.2. coc.nvim ]]
    CocErrorHighlight = {fg=red, style={'undercurl'}},
    CocHintHighlight  = {fg=magenta, style={'undercurl'}},
    CocInfoHighlight  = {fg=blue, style={'undercurl'}},
    CocWarningHighlight = {fg=orange, style={'undercurl'}},
    CocErrorSign = 'ALEErrorSign',
    CocHintSign  = 'HintMsg',
    CocInfoSign  = 'InfoMsg',
    CocWarningSign = 'ALEWarningSign',

    --[[ 4.4.2. vim-jumpmotion / vim-easymotion ]]
    EasyMotion = 'IncSearch',
    JumpMotion = 'EasyMotion',

    --[[ 4.4.4. vim-gitgutter / vim-signify ]]
    GitGutterAdd    = {fg = addfg, bg=black},
    GitGutterChange = {fg = changefg, bg=black},
    GitGutterDelete = {fg = delfg, bg=black},
    GitGutterChangeDelete = {fg=orange, bg=black},

    SignifySignAdd    = 'GitGutterAdd',
    SignifySignChange = 'GitGutterChange',
    SignifySignDelete = 'GitGutterDelete',
    SignifySignChangeDelete = 'GitGutterChangeDelete',

    --[[ 4.4.5. vim-indent-guides ]]
    IndentGuidesOdd  = {bg=gray_darkest},
    IndentGuidesEven = {bg=gray},

    --[[ 4.4.7. NERDTree ]]
    NERDTreeCWD = 'Label',
    NERDTreeUp  = 'Operator',
    NERDTreeDir = 'Directory',
    NERDTreeDirSlash = 'Delimiter',
    NERDTreeOpenable = 'NERDTreeDir',
    NERDTreeClosable = 'NERDTreeOpenable',
    NERDTreeExecFile = 'Function',
    NERDTreeLinkTarget = 'Tag',

    --[[ 4.4.8. nvim-treesitter ]]
    TSBoolean = {fg=orange, style='italic'},
    TSNote = 'Info',
    TSWarning = 'Warning',
    TSDanger = 'Error',
    TSType = 'Type',
    TSConstant = 'Constant',
    TSConstBuiltin = {fg=orange, style='italic'},
    TSConstructor  = 'Typedef',
    TSTextReference = {fg=cyan},
    TSFuncBuiltin  = 'Function',
    TSFunction  = {fg=blue, style={'italic'}},
    TSField = {fg=gray_light},
    TSException = {fg=magenta_dark, style='italic'},
    TSFuncMacro  = {fg=red},
    TSStringEscape = 'Character',
    TSStringRegex  = 'SpecialChar',
    TSOperator = {fg=cyan},
    TSParamater = {fg=orange_light},
    TSProperty = {fg=turquoise},
    TSPunctDelimiter = {fg=green_light},
    TSPunctBracket = {fg=red_light},
    TSPunctSpecial = {fg=gray, style='bold'},
    TSRepeat = {fg=red, style='italic'},
    TSKeywordOperator = {fg=cyan, style='italic'},
    TSKeywordFunction = {fg=magenta, style='italic'},
    TSInclude = {fg=magenta, style='italic'},
    TSNameSpace = {fg=cyan},
    TSLabel = {fg=blue},
    TSError  = {fg=red, style={"undercurl", color=red}},
    TSURI = 'Tag',
    TSVariable = 'Identifier',
    TSVariableBuiltin = {fg=red, style='italic'},
    TSTypeBuiltin = {fg=cyan, style='italic'},
    TSTitle = {fg = red, style={'bold', 'underline'}},
    TSLiteral = 'String',
    TSEmphasis = {style = 'italic'},
    TSStrong =  {style = 'bold'},

    --[[ 4.4.9. barbar.nvim ]]
    BufferCurrent       = {fg=gray_light, style='bold'},
    BufferCurrentIndex  = function(self) return {fg=self.InfoMsg.fg, bg=self.BufferCurrent.bg} end,
    BufferCurrentMod    = {fg=tan, bg=black, style={'italic', 'bold'}},
    BufferCurrentSign   = {fg=gray_dark, bg=black},
    BufferCurrentTarget = {fg=blue, style='bold'},

    BufferInactive       = {fg=gray_dark, bg=gray_darkest},
    BufferInactiveIndex  = function(self) return {fg=self.InfoMsg.fg, bg=self.BufferInactive.bg} end,
    BufferInactiveMod    = {fg=gray_dark, bg=gray_darkest},
    BufferInactiveSign   = {fg=gray_darkest, bg=gray_darkest},
    BufferInactiveTarget = {fg=blue, bg=gray_darkest, style='bold'},

    BufferTabpages    = {fg=gray_light, bg=gray_darkest, style='bold'},
    BufferTabpageFill = {fg=gray_light, bg=gray_darkest, style='bold'},
    BufferOffset = {fg=gray_light, bg=blackish, style='bold'},

    BufferVisible       = {fg=gray_light, bg=black, style={"bold"}},
    BufferVisibleIndex  = function(self) return {fg=self.InfoMsg.fg, bg=self.BufferVisible.bg} end,
    BufferVisibleMod    = {fg=red, bg=black, style={'bold', 'italic'}},
    BufferVisibleSign   = {fg=gray_dark, bg=black},
    BufferVisibleTarget = {fg=blue, bg=black, style='bold'},

    --[[ 4.4.10. vim-sandwhich ]]
    OperatorSandwichChange = 'DiffText',

    --[[ 4.4.11. Fern ]]
    FernBranchText = 'Directory',

    --[[ 4.4.12. LSPSaga ]]
    DefinitionCount = 'Number',
    DefinitionIcon  = 'Special',
    ReferencesCount = 'Number',
    ReferencesIcon  = 'DefinitionIcon',
    TargetFileName  = 'Directory',
    TargetWord = 'Title',

    --[[ 4.4.13. indent-blankline.nvim ]]
    IndentBlanklineChar = {fg=gray_darker},
    IndentBlanklineSpaceChar = 'IndentBlanklineChar',
    IndentBlanklineSpaceCharBlankLine = 'IndentBlanklineChar',
    IndentBlanklineContextChar = {fg=gray_dark},

    --[[ 4.4.14. trouble.nvim ]]
    TroubleCount = function(self) return vim.tbl_extend('force', self.Number, {style='underline'}) end,

    --[[ 4.4.14. todo-comments.nvim ]]
    TodoFgFIX = function(self) return {fg=self.ErrorMsg.fg} end,
    TodoFgHACK = function(self) return {fg=self.Todo.fg} end,
    TodoFgNOTE = 'HintMsg',
    TodoFgPERF = 'InfoMsg',
	TodoFgTODO = {fg=cyan, style='italic'},
    TodoFgWARN = function(self) return {fg=self.WarningMsg.fg} end,

    TodoBgFIX = function(self) return {fg=black, bg=self.ErrorMsg.fg, style={'bold', 'italic', 'nocombine'}} end,
    TodoBgHACK = function(self) return {fg=black, bg=self.Todo.fg, style={'bold', 'italic', 'nocombine'}} end,
    TodoBgNOTE = function(self) return {fg=black, bg=self.Hint.bg, style={'bold', 'italic', 'nocombine'}} end,
    TodoBgPERF = function(self) return {fg=black, bg=self.Info.bg, style={'bold', 'italic', 'nocombine'}} end,
	TodoBgTODO = {fg=black, bg=cyan, style={'bold', 'italic', 'nocombine'}},
    TodoBgWARN = function(self) return {fg=black, bg=self.Warning.bg, style={'bold', 'italic', 'nocombine'}} end,

    TodoSignFIX  = 'TodoFgFIX',
    TodoSignHACK = 'TodoFgHACK',
    TodoSignNOTE = 'TodoFgNOTE',
    TodoSignPERF = 'TodoFgPERF',
    TodoSignTODO = 'TodoFgTODO',
    TodoSignWARN = 'TodoFgWARN',

    --[[ 4.4.15. gitsigns.nvim ]]
    GitSignsAdd = 'GitGutterAdd',
    GitSignsAddNr = {fg=addfg, bg=addbg},
    GitSignsAddLn = 'GitSignsAddNr',
    GitSignsChange = 'GitGutterChange',
    GitSignsChangeNr = {fg=changefg, bg=changebg},
    GitSignsChangeLn = 'GitSignsChangeNr',
    GitSignsDelete = 'GitGutterDelete',
    GitSignsDeleteNr = {fg=delfg, bg=delbg},
    GitSignsDeleteLn = 'GitSignsDeleteNr',

    --[[ 4.4.16. nvim-compe and cmp ]]
    CmpDocumentationBorder = {fg=gray_dark, bg=black},
    CmpDocumentation = {bg=black},
    CmpItemAbbr = {fg=gray_medium},
    CmpItemMenu = {bg=gray_darker},
    CmpItemAbbrMatch = {fg=red},
    CmpItemAbbrDeprecated = {fg=gray_dark, style={"strikethrough"}},
    CmpItemAbbrMatchFuzzy = {fg=red},
    CmpItemKind = {fg=turquoise},
    CmpItemKindVariable = {fg=blue},
    CmpItemKindInterface = {fg=blue},
    CmpItemKindText = {fg=blue},
    CmpItemKindFunction = {fg=pink},
    CmpItemKindMethod = {fg=pink},
    CmpItemKindKeyword = {fg=green},
    CmpItemKindProperty = {fg=green},
    CmpItemKindUnit = {fg=green},
	CmpItemAbbrDefault = 'Ignore',
	CmpItemAbbrMatchDefault = 'Underlined',
	CmpItemAbbrMatchFuzzyDefault = {fg=highlight_group_normal.fg, style={'nocombine', 'underline'}},
	CmpItemKindDefault = 'Type',
	CmpItemKindClassDefault = 'CmpItemKindStructDefault',
	CmpItemKindColorDefault = 'Label',
	CmpItemKindConstantDefault = 'Constant',
	CmpItemKindConstructorDefault = 'CmpItemKindMethodDefault',
	CmpItemKindEnumDefault = 'CmpItemKindStructDefault',
	CmpItemKindEnumMemberDefault = 'CmpItemKindConstantDefault',
	CmpItemKindEventDefault = 'Repeat',
	CmpItemKindFieldDefault = 'Identifier',
	CmpItemKindFileDefault = 'Directory',
	CmpItemKindFolderDefault = 'CmpItemKindFileDefault',
	CmpItemKindFunctionDefault = 'Function',
	CmpItemKindInterfaceDefault = 'Type',
	CmpItemKindKeywordDefault = 'Keyword',
	CmpItemKindMethodDefault = 'CmpItemKindFunctionDefault',
	CmpItemKindModuleDefault = 'Include',
	CmpItemKindOperatorDefault = 'Operator',
	CmpItemKindPropertyDefault = 'CmpItemKindFieldDefault',
	CmpItemKindReferenceDefault = 'StorageClass',
	CmpItemKindSnippetDefault = 'Special',
	CmpItemKindStructDefault = 'Structure',
	CmpItemKindTextDefault = 'String',
	CmpItemKindTypeParameterDefault = 'Typedef',
	CmpItemKindUnitDefault = 'CmpItemKindStructDefault',
	CmpItemKindValueDefault = 'CmpItemKindConstantDefault',
	CmpItemKindVariableDefault = 'Identifier',
	CmpWindowScrollThumb = {fg=white, style='bold'},

    --[[ 4.4.16. packer.nvim ]]
    packerFail = 'ErrorMsg',
    packerHash = 'Number',
    packerPackageNotLoaded = 'Ignore',
    packerStatusFail = 'Statement',
    packerStatusSuccess = 'packerStatusFail',
    packerSuccess = function(self) return {fg=green, style=self.packerFail.style} end,

    --[[ 4.4.17. alpha.nvim ]]
    AlphaFooter = {fg=gray_dark, style={"italic"}},
    AlphaHeader = {fg=gray_dark},
    AlphaButtons = {fg=gray_dark, style={"bold"}},

    --[[ 4.4.18. dev-icons ]]
    DevIconJS = {fg=yellow},
    DevIconJson = {fg=tan},
    DevIconLua = {fg=blue},
    DevIconCpp = {fg=cyan},
    DevIconPy = {fg=blue},
    DevIconMarkdown = {fg=cyan},
    DevIconMd = {fg=cyan},
    DevIconVim = {fg=green},
    DevIconVimrc = {fg=green},
    DevIconTerminal = {fg=green},
    DevIconConf = {fg=yellow},
    DevIconBash = {fg=pink},
    DevIconZshrc = {fg=blue},
    DevIconZsh = {fg=blue},
    DevIconZshenv = {fg=blue},
    DevIconZshprofile = {fg=blue},
    DevIconSh = {fg=pink},
    DevIconTxt = {fg=turquoise},
    DevIconH = {fg=purple},
    DevIconDefault = {fg=gray_light},

    --[[ 4.4.19. telescope ]]
    TelescopeSelection = {fg=white, style={"bold"}},
    TelescopeSelectionCaret = {fg=red},
    TelescopeMultiSelection = {fg=white, style={"bold"}},
    TelescopeNormal = {fg=gray, bg=black, style={"bold"}},
    TelescopeBorder = {fg=gray_dark, bg=gray_dark},
    TelescopePromptBorder = {fg=gray_dark, bg=black},
    TelescopeResultsBorder = {fg=gray_dark, bg=black},
    TelescopePreviewNormal = {bg=black},
    TelescopePreviewBorder = {fg=gray_dark, bg=black},
    TelescopeMatching = {fg=red, style={"bold"}},
    TelescopePromptPrefix = {fg=red, style={"bold"}},
    TelescopeTitle = {fg=red, style={"bold"}},
    TelescopeResultsDiffUntracked = {fg=red, style={"bold"}},

    --[[ 4.4.20. floaterm ]]
    Floaterm = {bg = blackish},
    FloatermNC = {bg = blackish},
    FloatermBorder = {fg=gray_dark, bg = blackish},

    --[[ 4.4.21. nvim-tree ]]
    NvimTreeNormal = {fg=gray_light, bg=blackish},
    NvimTreeRootFolder = {fg=purple},
    NvimTreeOpenedFolderName = {fg=white, style={"bold"}},
    NvimTreeEmptyFolderName = {fg=gray_medium},
    NvimTreeFolderName = {fg=blue, style={"bold"}},
    NvimTreeGitDirty = {fg=red},
    NvimTreeGitStaged = {fg=green},
    NvimTreeGitMerge = {fg=purple},
    NvimTreeGitRenamed = {fg=yellow},
    NvimTreeGitNew = {fg=blue},
    NvimTreeGitDeleted = {fg=red},
    NvimTreeFolderIcon = {fg=blue},
    NvimTreeIndentMarker = {fg=gray_darker},
    NvimTreeWindowPicker = {fg=turquoise},
    NvimTreeOpenedFile = {style={"bold"}},
    NvimTreeSpecialFile = {fg=pink, style={"underline"}},
    NvimTreeSymlink = {fg=blue, style={"underline"}},
    NvimTreeExecFile = {fg=green, style={"bold"}},
    NvimTreeVertSplit = {fg=blackish, bg=blackish, style={"bold"}},
    NvimTreeStatuslineNc = {bg=gray_dark},

    --[[ 4.4.22. lightbulb ]]
    LightbulbTextHL = {fg=blue},
    LightbulbVirtualText = {fg=gray_darkest,bg=gray},

    --[[ 4.4.23. rainbow ]]
    rainbowcol1 = {fg=red_dark},
    rainbowcol2 = {fg=teal},
    rainbowcol3 = {fg=yellow},
    rainbowcol4 = {fg=green_dark},
    rainbowcol5 = {fg=blue},
    rainbowcol6 = {fg=magenta},
    rainbowcol7 = {fg=purple_light},

    --[[ 4.4.24. galaxyline ]]
    GalaxyTree = {fg=blackish,bg=blackish},
    GalaxyViMode = {fg=gray_dark,bg=gray_dark},
    GalaxyBg = {fg=black,bg=black},
    GalaxyFg = {fg=gray_light, bg=gray_dark, style={"bold"}},
    GalaxyFgAlt ={fg=gray_medium, bg=gray_dark, style={"bold"}},
    GalaxyYellow ={fg=yellow, bg=gray_dark, style={"bold"}},
    GalaxyCyan ={fg=cyan, bg=gray_dark, style={"bold"}},
    GalaxyGreen ={fg=green, bg=gray_dark, style={"bold"}},
    GalaxyOrange ={fg=orange, bg=gray_dark, style={"bold"}},
    GalaxyMagenta ={fg=magenta, bg=gray_dark, style={"bold"}},
    GalaxyBlue ={fg=blue, bg=gray_dark, style={"bold"}},
    GalaxyRed ={fg=red, bg=gray_dark, style={"bold"}},

    -- [[ 4.5 Others ]]
    FocusedSymbol={fg=black, bg=yellow},
    OutlinePreviewBG = {bg=blackish},
    NvimDapVirtualTextChanged = {fg=purple},
    DapBreakpoint = {fg=red},
    DapBreakpointCondition = {fg=red_dark},
    DapLogPoint = {fg=turquoise},
    DapStopped = {fg=green},
    DapUIVariable = 'Normal',
    DapUIScope = {fg=blue},
    DapUIType = {fg=blue},
    DapUIValue = 'Normal',
    DapUIModifiedValue = {{fg=blue}, style={"bold"}},
    DapUIDecoration = {fg=blue},
    DapUIThread = {fg=green},
    DapUIStoppedThread = {fg=blue},
    DapUIFrameName = 'Normal',
    DapUISource = {fg=pink},
    DapUILineNumber = {fg=blue},
    DapUIFloatBorder = {fg=blue},
    DapUIWatchesEmpty = {fg=magenta},
    DapUIWatchesValue = {fg=green_dark},
    DapUIWatchesError = {fg=magenta_dark},
    DapUIBreakpointsPath = {fg=turquoise},
    DapUIBreakpointsInfo = {fg=green_light},
    DapUIBreakpointsCurrentLine = {{fg=green}, style={"bold"}},
    DapUIBreakpointsLine = 'DapUILineNumber',
    DapBreakpointRejected = {fg=orange},
}
    local terminal_colors = {
    [1]  = black,
    [2]  = red_dark,
    [3]  = green_dark,
    [4]  = orange,
    [5]  = blue,
    [6]  = magenta_dark,
    [7]  = teal,
    [8]  = gray,
    [9]  = gray_dark,
    [10] = red,
    [11] = green,
    [12] = yellow,
    [13] = turquoise,
    [14] = purple,
    [15] = cyan,
    [16] = gray_light
}

require(vim.g.colors_name)(
highlight_group_normal,
highlight_groups,
terminal_colors
)
