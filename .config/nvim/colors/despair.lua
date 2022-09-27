vim.g.colors_name = "despair"

local black = { "#282828", 0, "black" }
local blackish = { "#202020", 0, "black" }
local blacker = { "#111010", 0, "black" }
--[[ local gray = { "#665c54", 244, "gray" }
local gray_dark = { "#504945", 237, "darkgrey" }
local gray_darker = { "#3c3836", 235, "gray" }
local gray_darkerer = { "#2f2f2f", 233, "gray" }
local gray_darkest = { "#2d2d2d", 235, "gray" }
local gray_medium = { "#7c6f64", 243, "gray" }
local gray_light = { "#928374", 251, "gray" }
local white = { "#bdae93", 15, "white" }
local whiteish = { "#d5c4a1", 15, "white" }
local whiter = { "#ebdbb2", 15, "white" }
local whitest = { "#fbf1c7", 15, "white" } ]]
local gray = { "#666666", 244, "gray" }
local gray_dark = { "#505050", 237, "darkgrey" }
local gray_darker = { "#3c3c3c", 235, "gray" }
local gray_darkerer = { "#2f2f2f", 233, "gray" }
local gray_darkest = { "#2d2d2d", 235, "gray" }
local gray_medium = { "#7c7c7c", 243, "gray" }
local gray_light = { "#929292", 251, "gray" }
local white = { "#bdbdbd", 15, "white" }
local whiteish = { "#d5d5d5", 15, "white" }
local whiter = { "#ebebeb", 15, "white" }
local whitest = { "#f5f5f5", 15, "white" }
local red = { "#e65949", 196, "red" }
local red_dark = { "#b53934", 124, "darkred" }
local red_bg = { "#261A14", 124, "darkred" }
local red_light = { "#A06F58", 203, "red" }
local orange = { "#e78230", 208, "darkyellow" }
local orange_dark = { "#bf6225", 208, "darkyellow" }
local orange_bg = { "#2E2520", 208, "darkyellow" }
local orange_light = { "#f2b98b", 214, "yellow" }
local yellow_dark = { "#cb952d", 220, "yellow" }
local yellow = { "#efb93a", 220, "yellow" }
local green_dark = { "#86852c", 83, "darkgreen" }
local green = { "#a2a43d", 72, "green" }
local green_light = { "#cccd7a", 72, "green" }
local turquoise = { "#97ad8f", 38, "darkblue" }
local turquoise_dark = { "#749176", 33, "green" }
local blue = { "#83a598", 63, "blue" }
local blue_dark = { "#4f7c7e", 87, "cyan" }
local magenta = { "#906c9f", 126, "magenta" }
local magenta_dark = { "#6b5577", 126, "darkmagenta" }
local magenta_bg = { "#2D2A30", 126, "magenta" }
local pink = { "#7b5164", 162, "magenta" }
local pink_light = { "#b3899c", 38, "white" }
local pink_bg = { "#2E2529", 162, "magenta" }
local purple_light = { "#cb8e9f", 129, "magenta" }
local purple = { "#a56e87", 63, "magenta" }
local addfg = { "#605f1f", 51, "cyan" }
local addbg = { "#393913", 51, "cyan" }
local changefg = { "#6b4255", 51, "cyan" }
local changebg = { "#4a3c42", 51, "cyan" }
local delfg = { "#8d2d29", 51, "cyan" }
local delbg = { "#473126", 51, "cyan" }

local BG = "bg"
local FG = "fg"
local NONE = {}

local highlight_group_normal = { dark = { fg = white, bg = black }, light = { fg = black, bg = whitest } }

local highlight_groups = {
	--[[ 4.1. Text Analysis ]]
	Comment = { dark = { fg = gray }, light = { fg = gray_light }, style = "italic" },
	NonText = { dark = { fg = gray_darker }, light = { fg = white } },
	EndOfBuffer = "NonText",
	Whitespace = "NonText",

	--[[ 4.1.1. Literals]]
	Constant = { fg = blue_dark },
	String = { fg = green_dark, style = "italic" },
	Character = { fg = green_dark },
	Number = { fg = pink_light },
	Boolean = { fg = yellow_dark },
	Float = "Number",

	--[[ 4.1.2. Identifiers]]
	Identifier = { dark = { fg = white }, light = { fg = gray } },
	Function = { fg = blue_dark, style = "bold" },

	--[[ 4.1.3. Syntax]]
	Statement = { fg = green },
	Conditional = { fg = orange_light, style = "italic" },
	Repeat = { fg = red_dark, style = "italic" },
	Label = { fg = pink, style = "bold" },
	Operator = { dark = { fg = gray_medium }, light = { fg = gray } },
	Keyword = { fg = purple },
	Exception = { fg = red_light, style = "bold" },
	Noise = "Delimiter",

	--[[ 4.1.4. metatextual information]]
	preproc = { fg = turquoise_dark },
	include = { fg = pink, style = { "nocombine", "italic" } },
	Define = { fg = blue, style = "nocombine" },
	Macro = { fg = blue, style = "italic" },
	PreCondit = { dark = { fg = yellow_dark }, light = { fg = orange_dark }, style = "italic" },

	--[[ 4.1.5. Semantics]]
	Type = { fg = yellow_dark },
	StorageClass = { dark = { fg = orange_light }, light = { fg = orange_dark }, style = "bold" },
	Structure = { fg = yellow, style = "bold" },
	Typedef = { dark = { fg = yellow_dark }, light = { fg = orange_dark }, style = "italic" },

	--[[ 4.1.6. Edge Cases]]
	Special = { fg = blue, style = "bold" },
	SpecialChar = { dark = { fg = red_light }, light = { fg = red_dark }, style = "italic" },
	SpecialKey = "Character",
	Tag = "Underlined",
	Delimiter = { fg = white },
	SpecialComment = { fg = gray, style = { "bold", "nocombine" } },
	Debug = "WarningMsg",

	--[[ 4.1.7. Help Syntax]]
	Underlined = { fg = turquoise_dark, style = "underline" },
	Ignore = { fg = gray },
	Error = { fg = black, bg = red, style = { "bold", "underline" } },
	Todo = { fg = yellow, style = { "bold", "underline" } },
	Hint = { fg = black, bg = magenta, style = "bold" },
	Info = { fg = black, bg = pink_light, style = "bold" },
	Warning = { fg = black, bg = orange, style = "bold" },

	--[[ 4.2... Editor UI  ]]
	--[[ 4.2.1. Status Line]]
	StatusLine = { dark = { bg = gray_darkerer, fg = green_light}, light = { bg = whiter, fg = green_dark} },
	StatusLineNC = function(self)
		return { fg = gray, bg = self.StatusLine.bg }
	end,
	StatusLineTerm = "StatusLine",
	StatusLineTermNC = "StatusLineNC",
	MsgArea = { bg = BG },

	--[[ 4.2.2. Separators]]
	VertSplit = { dark = { bg = gray_darker, fg = gray_darker }, light = { bg = whiter, fg = whiter } },
	TabLine = { dark = { fg = blackish, bg = blackish }, light = { fg = whitest, bg = whitest } },
	TabLineFill = { dark = { fg = blackish, bg = blackish }, light = { fg = whitest, bg = whitest } },
	TabLineSel = { fg = FG, bg = BG },
	Title = { style = "bold" },

	--[[ 4.2.3. Conditional Line Highlighting]]
	Conceal = { fg = red, bg = BG },
	CursorLine = { dark = { bg = gray_darkest }, light = { bg = whitest } },
	CursorLineNr = { bg = NONE },
	debugBreakpoint = "ErrorMsg",
	debugPC = "ColorColumn",
	LineNr = { bg = BG, dark = { fg = gray_dark }, light = { fg = white } },
	QuickFixLine = { dark = { bg = gray_darkest }, light = { white } },
	Visual = { dark = { bg = gray_dark }, light = { bg = whiter } },
	VisualNOS = { dark = { bg = gray_darkest }, light = { whiter } },

	--[[ 4.2.4. Popup Menu]]
	Pmenu = { dark = { fg = gray_medium, bg = gray_darker }, light = { fg = gray_dark, bg = whiter } },
	PmenuSbar = { dark = { fg = blacker, bg = gray_darker }, light = { fg = whiteish, bg = whiter } },
	PmenuSel = {
		dark = { fg = gray_medium, bg = gray_darker },
		light = { fg = gray_light, bg = whiter },
		style = { "inverse", "bold" },
	},
	PmenuThumb = { dark = { fg = gray_dark, bg = gray_dark }, light = { fg = gray_light, bg = gray_light } },
	Wilder = { dark = { bg = black }, light = { bg = whiter } },
	WilderAccent = { dark = { fg = pink }, light = { fg = pink_bg } },
	WilderScroll = { dark = { bg = black }, light = { bg = whiteish } },
	WildMenu = "PmenuSel",
	NormalFloat = { bg = BG, dark = { fg = white }, light = { fg = black } },
	FloatBorder = { bg = BG, dark = { fg = gray_dark }, light = { fg = white } },

	--[[ 4.2.5. Folds]]
	FoldColumn = { bg = black, dark = { fg = gray_dark }, light = { fg = white }, style = "bold" },
	Folded = {
		dark = { fg = gray, bg = gray_darkest },
		light = { fg = gray_light, bg = whiter },
		style = {
			"bold",
			"italic",
		},
	},

	--[[ 4.2.6. Diffs]]
	DiffAdd = { fg = addfg, bg = addbg },
	DiffChange = { fg = changefg, bg = changebg },
	DiffDelete = { fg = delfg, bg = delbg },
	DiffText = function(self)
		return { fg = self.DiffAdd.fg, bg = yellow }
	end,

	--[[ 4.2.7. Searching]]
	IncSearch = { style = { "bold", "inverse" } },
	MatchParen = { style = { "inverse" } },
	Search = { style = { "bold", "underline" } },

	--[[ 4.2.8. Spelling]]
	SpellBad = { style = { "undercurl", color = red } },
	SpellCap = { style = { "undercurl", color = green } },
	SpellLocal = { style = { "undercurl", color = yellow } },
	SpellRare = { style = { "undercurl", color = blue } },

	--[[ 4.2.9. Conditional Column Highlighting]]
	ColorColumn = { bg = gray_dark, style = "inverse" },
	SignColumn = { bg = BG },

	--[[ 4.2.10. Messages]]
	ErrorMsg = { fg = red, style = "bold" },
	HintMsg = { fg = magenta, style = "italic" },
	InfoMsg = { fg = pink_light, style = "italic" },
	ModeMsg = { fg = yellow },
	WarningMsg = { fg = orange, style = "bold" },
	Question = { fg = turquoise, style = "bold" },

	--[[ 4.2.11. LSP ]]
	DiagnosticError = "Error",
	DiagnosticFloatingError = function(self)
		return { fg = self.ErrorMsg.fg, bg = BG }
	end,
	DiagnosticSignError = function(self)
		return { fg = self.ErrorMsg.fg, bg = BG }
	end,
	DiagnosticVirtualTextError = function(self)
		return { fg = self.ErrorMsg.fg, bg = red_bg, style = "italic" }
	end,

	DiagnosticWarn = "Warning",
	DiagnosticFloatingWarn = function(self)
		return { fg = self.WarningMsg.fg, bg = BG }
	end,
	DiagnosticSignWarn = function(self)
		return { fg = self.WarningMsg.fg, bg = BG }
	end,
	DiagnosticVirtualTextWarn = function(self)
		return { fg = self.WarningMsg.fg, bg = orange_bg, style = "italic" }
	end,

	DiagnosticHint = "Hint",
	DiagnosticFloatingHint = function(self)
		return { fg = self.HintMsg.fg, bg = BG }
	end,
	DiagnosticSignHint = function(self)
		return { fg = self.HintMsg.fg, bg = BG }
	end,
	DiagnosticVirtualTextHint = function(self)
		return { fg = self.HintMsg.fg, bg = magenta_bg, style = "italic" }
	end,

	DiagnosticInfo = "Info",
	DiagnosticFloatingInfo = function(self)
		return { fg = self.InfoMsg.fg, bg = BG }
	end,
	DiagnosticSignInfo = function(self)
		return { fg = self.InfoMsg.fg, bg = BG }
	end,
	DiagnosticVirtualTextInfo = function(self)
		return { fg = self.InfoMsg.fg, bg = pink_bg, style = "italic" }
	end,

	DiagnosticUnderlineError = { style = { "undercurl", color = red } },
	DiagnosticUnderlineHint = { style = { "undercurl", color = magenta } },
	DiagnosticUnderlineInfo = { style = { "undercurl", color = blue } },
	DiagnosticUnderlineWarn = { style = { "undercurl", color = orange } },

	--[[ 4.2.12. Cursor ]]
	Cursor = { style = "inverse" },
	CursorIM = "Cursor",
	CursorColumn = { bg = gray_dark },

	--[[ 4.2.13. Misc ]]
	Directory = { fg = blue, style = "bold" },

	--[[ 4.3. Programming Languages ]]
	--[[ 4.3.1. C ]]
	cConstant = "Constant",
	cCustomClass = "Type",

	--[[ 4.3.2. C++ ]]
	cppSTLexception = "Exception",
	cppSTLnamespace = "String",

	--[[ 4.3.3 C# ]]
	csBraces = "Delimiter",
	csClass = "Structure",
	csClassType = "Type",
	csContextualStatement = "Conditional",
	csEndColon = "Delimiter",
	csGeneric = "Typedef",
	csInterpolation = "Include",
	csInterpolationDelimiter = "SpecialChar",
	csLogicSymbols = "Operator",
	csModifier = "Keyword",
	csNew = "Operator",
	csNewType = "Type",
	csParens = "Delimiter",
	csPreCondit = "PreProc",
	csQuote = "Delimiter",
	csRepeat = "Repeat",
	csStorage = "StorageClass",
	csUnspecifiedStatement = "Statement",
	csXmlTag = "Define",
	csXmlTagName = "Define",
	razorCode = "PreProc",
	razorcsLHSMemberAccessOperator = "Noise",
	razorcsRHSMemberAccessOperator = "razorcsLHSMemberAccessOperator",
	razorcsStringDelimiter = "razorhtmlValueDelimiter",
	razorcsTypeNullable = "Special",
	razorcsUnaryOperatorKeyword = "Operator",
	razorDelimiter = "Delimiter",
	razorEventAttribute = "PreCondit",
	razorFor = "razorIf",
	razorhtmlAttribute = "htmlArg",
	razorhtmlAttributeOperator = "Operator",
	razorhtmlTag = "htmlTag",
	razorhtmlValueDelimiter = "Delimiter",
	razorIf = "PreCondit",
	razorImplicitExpression = "PreProc",
	razorLine = "Constant",
	razorUsing = "Include",

	--[[ 4.3.4. CSS ]]
	cssAtRule = "PreCondit",
	cssAttr = "Keyword",
	cssAttrComma = "Noise",
	cssAttrRegion = "Keyword",
	cssBraces = "Delimiter",
	cssClassName = "Identifier",
	cssClassNameDot = "Noise",
	cssFlexibleBoxAttr = "cssAttr",
	cssFunctionComma = "Noise",
	cssImportant = "Exception",
	cssNoise = "Noise",
	cssProp = "Label",
	cssPseudoClass = "Special",
	cssPseudoClassId = "cssSelectorOp",
	cssSelectorOp = "Operator",
	cssTagName = "Structure",
	cssUnitDecorators = "Type",
	scssAmpersand = "Special",
	scssAttribute = "Noise",
	scssBoolean = "Boolean",
	scssDefault = "Keyword",
	scssElse = "scssIf",
	scssMixinName = function(self)
		local super = self.cssClassName
		return { bg = super.bg, fg = super.fg, style = "Italic" }
	end,
	scssIf = "PreCondit",
	scssInclude = "Include",
	scssSelectorChar = "Delimiter",
	scssDefinition = "PreProc",
	scssSelectorName = "Identifier",
	scssVariable = "Define",
	scssVariableAssignment = "Operator",

	--[[ 4.3.5. Dart ]]
	dartLibrary = "Statement",

	--[[ 4.3.6. dot ]]
	dotKeyChar = "Character",
	dotType = "Type",

	--[[ 4.3.7. Go ]]
	goBlock = "Delimiter",
	goBoolean = "Boolean",
	goBuiltins = "Operator",
	goField = "Identifier",
	goFloat = "Float",
	goFormatSpecifier = "Character",
	goFunction = "Function",
	goFunctionCall = "goFunction",
	goFunctionReturn = NONE,
	goMethodCall = "goFunctionCall",
	goParamType = "goReceiverType",
	goPointerOperator = "SpecialChar",
	goPredefinedIdentifiers = "Constant",
	goReceiver = "goBlock",
	goReceiverType = "goTypeName",
	goSimpleParams = "goBlock",
	goType = "Type",
	goTypeConstructor = "goFunction",
	goTypeName = "Type",
	goVarAssign = "Identifier",
	goVarDefs = "goVarAssign",

	--[[ 4.3.8. HTML ]]
	htmlArg = "Label",
	htmlBold = { fg = highlight_group_normal.fg, style = "bold" },
	htmlTitle = "htmlBold",
	htmlEndTag = "htmlTag",
	htmlH1 = "markdownH1",
	htmlH2 = "markdownH2",
	htmlH3 = "markdownH3",
	htmlH4 = "markdownH4",
	htmlH5 = "markdownH5",
	htmlH6 = "markdownH6",
	htmlItalic = { style = "italic" },
	htmlSpecialTagName = "Keyword",
	htmlTag = "Special",
	htmlTagN = "Typedef",
	htmlTagName = "Type",

	--[[ 4.3.9. Java ]]
	javaClassDecl = "Structure",

	--[[ 4.3.10. JavaScript ]]
	jsFuncBlock = "Function",
	jsObjectKey = "Type",
	jsReturn = "Keyword",
	jsVariableDef = "Identifier",

	--[[ 4.3.11. JSON ]]
	jsonBraces = "luaBraces",
	jsonEscape = "SpecialChar",
	jsonKeywordMatch = "Operator",
	jsonNull = "Constant",
	jsonQuote = "Delimiter",
	jsonString = "String",
	jsonStringSQError = "Exception",

	--[[ 4.3.12. Lua ]]
	luaBraces = "Structure",
	luaBrackets = "Delimiter",
	luaBuiltin = "Keyword",
	luaComma = "Delimiter",
	luaFuncArgName = "Identifier",
	luaFuncCall = "Function",
	luaFuncId = "luaNoise",
	luaFuncKeyword = "Type",
	luaFuncName = "Function",
	luaFuncParens = "Delimiter",
	luaFuncTable = "Structure",
	luaIn = "luaRepeat",
	luaLocal = "Type",
	luaNoise = "Delimiter",
	luaParens = "Delimiter",
	luaSpecialTable = "Structure",
	luaSpecialValue = "Function",
	luaStringLongTag = function(self)
		local delimiter = self.Delimiter
		return { bg = delimiter.bg, fg = delimiter.fg, style = "italic" }
	end,

	--[[ 4.3.12. Make ]]
	makeCommands = "Statement",
	makeSpecTarget = "Type",

	--[[ 4.3.13. Markdown ]]
	markdownCode = "mkdCode",
	markdownStrike = { fg = gray_dark, style = { "strikethrough" } },
	markdownJekyllFrontMatter = { fg = gray_dark },
	markdownJekyllDelimiter = { fg = gray_dark },
	markdownCodeDelimiter = "mkdCodeDelimiter",
	markdownHeadingDelimiter = "NonText",
	markdownH1 = { bg = red, fg = black, style = { "bold", "underline" } },
	markdownH2 = { bg = orange, fg = black, style = { "bold", "underline" } },
	markdownH3 = { bg = yellow, fg = black, style = { "bold", "underline" } },
	markdownH4 = { bg = turquoise_dark, fg = black, style = { "bold", "underline" } },
	markdownH5 = { bg = blue_dark, fg = black, style = { "bold", "underline" } },
	markdownH6 = { bg = purple_light, fg = black, style = { "bold", "underline" } },
	markdownLinkDelimiter = "Delimiter",
	markdownLinkTextDelimiter = "markdownLinkDelimiter",
	markdownUrl = "Underlined",
	mkdBold = "Ignore",
	mkdBoldItalic = "mkdBold",
	mkdCode = "Keyword",
	mkdCodeDelimiter = "mkdBold",
	mkdCodeEnd = "mkdCodeStart",
	mkdCodeStart = "mkdCodeDelimiter",
	mkdHeading = "Delimiter",
	mkdItalic = "mkdBold",
	mkdLineBreak = "NonText",
	mkdListItem = "Special",
	mkdRule = function(self)
		return { fg = self.Ignore.fg, style = { "underline", color = self.Delimiter.fg } }
	end,

	--[[ 4.3.20. Python ]]
	pythonBrackets = "Delimiter",
	pythonBuiltinFunc = "Operator",
	pythonBuiltinObj = "Type",
	pythonBuiltinType = "Type",
	pythonClass = "Structure",
	pythonClassParameters = "pythonParameters",
	pythonDecorator = "PreProc",
	pythonDottedName = "Identifier",
	pythonError = "Error",
	pythonException = "Exception",
	pythonInclude = "Include",
	pythonIndentError = "pythonError",
	pythonLambdaExpr = "pythonOperator",
	pythonOperator = "Operator",
	pythonParam = "Identifier",
	pythonParameters = "Delimiter",
	pythonSelf = "Statement",
	pythonSpaceError = "pythonError",
	pythonStatement = "Statement",

	--[[ 4.3.21. Ruby ]]
	rubyClass = "Structure",
	rubyDefine = "Define",
	rubyInterpolationDelimiter = "Delimiter",

	--[[ 4.3.23. Scala ]]
	scalaKeyword = "Keyword",
	scalaNameDefinition = "Identifier",

	--[[ 4.3.24. shell ]]
	shDerefSimple = "SpecialChar",
	shFunctionKey = "Function",
	shLoop = "Repeat",
	shParen = "Delimiter",
	shQuote = "Delimiter",
	shSet = "Statement",
	shTestOpr = "Debug",

	--[[ 4.3.25. Solidity ]]
	solBuiltinType = "Type",
	solContract = "Typedef",
	solContractName = "Function",

	--[[ 4.3.26. TOML ]]
	tomlComment = "Comment",
	tomlDate = "Special",
	tomlFloat = "Float",
	tomlKey = "Label",
	tomlTable = "Structure",

	--[[ 4.3.27. VimScript ]]
	vimCmdSep = "Delimiter",
	vimFunction = "Function",
	vimFgBgAttrib = "Constant",
	vimHiCterm = "Label",
	vimHiCtermFgBg = "vimHiCterm",
	vimHiGroup = "Typedef",
	vimHiGui = "vimHiCterm",
	vimHiGuiFgBg = "vimHiGui",
	vimHiKeyList = "Operator",
	vimIsCommand = "Identifier",
	vimOption = "Keyword",
	vimScriptDelim = "Ignore",
	vimSet = "String",
	vimSetEqual = "Operator",
	vimSetSep = "Delimiter",
	vimUserFunc = "vimFunction",

	--[[ 4.3.28. XML ]]
	xmlAttrib = "htmlArg",
	xmlEndTag = "xmlTag",
	xmlEqual = "Operator",
	xmlTag = "htmlTag",
	xmlTagName = "htmlTagName",

	--[[ 4.3.29. SQL ]]
	sqlKeyword = "Keyword",
	sqlParen = "Delimiter",
	sqlSpecial = "Constant",
	sqlStatement = "Statement",
	sqlParenFunc = "Function",

	--[[ 4.3.30. dos INI ]]
	dosiniHeader = "Title",
	dosiniLabel = "Label",

	--[[ 4.3.31. Crontab ]]
	crontabDay = "StorageClass",
	crontabDow = "String",
	crontabHr = "Number",
	crontabMin = "Float",
	crontabMnth = "Structure",

	--[[ 4.3.32. PlantUML ]]
	plantumlArrowLR = "Statement",
	plantumlColonLine = NONE,
	plantumlMindmap = "Label",
	plantumlMindmap2 = "Label",

	--[[ 4.3.33. YAML ]]
	yamlKey = "Label",

	--[[ 4.3.34. Git ]]
	diffAdded = "DiffAdd",
	diffRemoved = "DiffDelete",
	gitcommitHeader = "SpecialComment",
	gitcommitDiscardedFile = "gitcommitSelectedFile",
	gitcommitOverFlow = "Error",
	gitcommitSelectedFile = "Directory",
	gitcommitSummary = "Title",
	gitcommitUntrackedFile = "gitcommitSelectedFile",
	gitconfigAssignment = "String",
	gitconfigEscape = "SpecialChar",
	gitconfigNone = "Operator",
	gitconfigSection = "Structure",
	gitconfigVariable = "Label",
	gitrebaseBreak = "Keyword",
	gitrebaseCommit = "Tag",
	gitrebaseDrop = "Exception",
	gitrebaseEdit = "Define",
	gitrebaseExec = "PreProc",
	gitrebaseFixup = "gitrebaseSquash",
	gitrebaseMerge = "PreProc",
	gitrebasePick = "Include",
	gitrebaseReset = "gitrebaseLabel",
	gitrebaseReword = "gitrebasePick",
	gitrebaseSquash = "Macro",
	gitrebaseSummary = "Title",

	--[[ 4.3.35. Vimtex ]]
	texMathRegion = "Number",
	texMathSub = "Number",
	texMathSuper = "Number",
	texMathRegionX = "Number",
	texMathRegionXX = "Number",

	--[[ 4.3.36. Coq ]]
	coqConstructor = "Constant",
	coqDefBinderType = "coqDefType",
	coqDefContents1 = "coqConstructor",
	coqDefType = "Typedef",
	coqIndBinderTerm = "coqDefBinderType",
	coqIndConstructor = "Delimiter",
	coqIndTerm = "Type",
	coqKwd = "Keyword",
	coqKwdParen = "Function",
	coqProofDelim = "coqVernacCmd",
	coqProofDot = "coqTermPunctuation",
	coqProofPunctuation = "coqTermPunctuation",
	coqRequire = "Include",
	coqTactic = "Operator",
	coqTermPunctuation = "Delimiter",
	coqVernacCmd = "Statement",
	coqVernacPunctuation = "coqTermPunctuation",

	--[[ 4.3.37 Help ]]
	helpHeader = "Label",
	helpOption = "Keyword",
	helpHeadline = "Title",
	helpSectionDelim = "Delimiter",
	helpHyperTextJump = "Underlined",

	--[[ 4.3.38 Man ]]
	-- manBold = function(self) return vim.tbl_extend('force', self.mkdCode, {style='nocombine'}) end,
	manOptionDesc = "Special",
	manReference = "Tag",
	manUnderline = "Label",

	--[[ 4.4. Plugins ]]
	--[[ 4.4.1. ALE ]]
	ALEErrorSign = "ErrorMsg",
	ALEWarningSign = "WarningMsg",

	--[[ 4.4.2. coc.nvim ]]
	CocErrorHighlight = { fg = red, style = { "undercurl" } },
	CocHintHighlight = { fg = magenta, style = { "undercurl" } },
	CocInfoHighlight = { fg = blue, style = { "undercurl" } },
	CocWarningHighlight = { fg = orange, style = { "undercurl" } },
	CocErrorSign = "ALEErrorSign",
	CocHintSign = "HintMsg",
	CocInfoSign = "InfoMsg",
	CocWarningSign = "ALEWarningSign",

	--[[ 4.4.2. vim-jumpmotion / vim-easymotion ]]
	EasyMotion = "IncSearch",
	JumpMotion = "EasyMotion",

	--[[ 4.4.4. vim-gitgutter / vim-signify ]]
	GitGutterAdd = { fg = addfg, bg = BG },
	GitGutterChange = { fg = changefg, bg = BG },
	GitGutterDelete = { fg = delfg, bg = BG },
	GitGutterChangeDelete = { fg = orange, bg = BG },

	SignifySignAdd = "GitGutterAdd",
	SignifySignChange = "GitGutterChange",
	SignifySignDelete = "GitGutterDelete",
	SignifySignChangeDelete = "GitGutterChangeDelete",

	--[[ 4.4.5. vim-indent-guides ]]
	IndentGuidesOdd = { bg = gray_darkest },
	IndentGuidesEven = { bg = gray },

	--[[ 4.4.7. NERDTree ]]
	NERDTreeCWD = "Label",
	NERDTreeUp = "Operator",
	NERDTreeDir = "Directory",
	NERDTreeDirSlash = "Delimiter",
	NERDTreeOpenable = "NERDTreeDir",
	NERDTreeClosable = "NERDTreeOpenable",
	NERDTreeExecFile = "Function",
	NERDTreeLinkTarget = "Tag",

	--[[ 4.4.8. nvim-treesitter ]]
	TSBoolean = { fg = orange_dark, style = "italic" },
	TSNote = "Info",
	TSWarning = "Warning",
	TSDanger = "Error",
	TSType = "Type",
	TSConstant = "Constant",
	TSConditional = "Conditional",
	TSConstBuiltin = { fg = orange, style = "italic" },
	TSConstructor = "Typedef",
	TSTextReference = { fg = blue_dark },
	TSFuncBuiltin = { fg = turquoise_dark, style = "bold" },
	TSFunction = "Function",
	TSField = { dark = { fg = white }, light = { gray_dark } },
	TSException = { fg = purple_light, style = "italic" },
	TSFuncMacro = { fg = red_dark },
	TSStringEscape = "Character",
	TSStringRegex = "SpecialChar",
	TSOperator = "Operator",
	TSParamater = { fg = orange_light },
	TSProperty = { fg = turquoise_dark },
	TSPunctDelimiter = { dark = { fg = gray_medium }, light = { fg = gray } },
	TSPunctBracket = { fg = red_light },
	TSPunctSpecial = { fg = gray, style = "bold" },
	TSRepeat = "Repeat",
	TSKeywordOperator = { fg = blue_dark, style = "italic" },
	TSKeywordFunction = { fg = red_dark, style = "italic" },
	TSKeywordReturn = { fg = red_dark, style = "italic" },
	TSInclude = { fg = purple, style = "italic" },
	TSNameSpace = { fg = blue_dark },
	TSLabel = { fg = blue },
	TSError = { fg = red, style = { "undercurl", color = red } },
	TSURI = "Tag",
	TSVariable = "Identifier",
	TSVariableBuiltin = { fg = red_dark, style = "italic" },
	TSTypeBuiltin = { fg = blue_dark, style = "italic" },
	TSTitle = { fg = red, style = { "bold", "underline" } },
	TSLiteral = "String",
	TSEmphasis = { style = "italic" },
	TSStrong = { style = "bold" },

	--[[ 4.4.9. barbar.nvim ]]
	BufferCurrent = { dark = { fg = gray_light }, light = { fg = gray_light }, style = "bold" },
	BufferCurrentIndex = function(self)
		return { fg = self.InfoMsg.fg, bg = self.BufferCurrent.bg }
	end,
	BufferCurrentMod = { fg = yellow_dark, bg = BG, style = { "italic", "bold" } },
	BufferCurrentSign = { dark = { fg = gray_dark }, light = { fg = white }, bg = BG },
	BufferCurrentTarget = { fg = blue, style = "bold" },

	BufferInactive = { dark = { fg = gray_dark, bg = gray_darkest }, light = { fg = gray_medium, bg = whiteish } },
	BufferInactiveIndex = function(self)
		return { fg = self.InfoMsg.fg, bg = self.BufferInactive.bg }
	end,
	BufferInactiveMod = { dark = { fg = gray_dark, bg = gray_darkest }, light = { fg = gray_medium, bg = whiteish } },
	BufferInactiveSign = { dark = { fg = gray_dark, bg = gray_darkest }, light = { fg = gray_medium, bg = whiteish } },
	BufferInactiveTarget = {
		dark = { fg = gray_dark, bg = gray_darkest },
		light = { fg = gray_medium, bg = whiteish },
		style = "bold",
	},

	BufferTabpages = { fg = gray_light, dark = { bg = gray_darkest }, light = { bg = whiteish }, style = "bold" },
	BufferTabpageFill = { fg = gray_light, dark = { bg = gray_darkest }, light = { bg = whiteish }, style = "bold" },
	BufferOffset = { fg = gray_light, dark = { bg = blackish }, light = { bg = whiter }, style = "bold" },

	BufferVisible = { fg = gray_light, bg = BG, style = { "bold" } },
	BufferVisibleIndex = function(self)
		return { fg = self.InfoMsg.fg, bg = self.BufferVisible.bg }
	end,
	BufferVisibleMod = { fg = red, bg = BG, style = { "bold", "italic" } },
	BufferVisibleSign = { fg = gray_dark, bg = BG },
	BufferVisibleTarget = { fg = blue, bg = BG, style = "bold" },

	BufferSpaceSeparator = { dark = { fg = gray_dark, bg = gray_dark }, light = { fg = whiter, bg = whiter } },
	BufferTypeSeparator = { dark = { fg = gray_dark, bg = gray_dark }, light = { fg = whiter, bg = whiter } },

	--[[ 4.4.10. vim-sandwhich ]]
	OperatorSandwichChange = "DiffText",

	--[[ 4.4.11. Fern ]]
	FernBranchText = "Directory",

	--[[ 4.4.12. LSPSaga ]]
	DefinitionCount = "Number",
	DefinitionIcon = "Special",
	ReferencesCount = "Number",
	ReferencesIcon = "DefinitionIcon",
	TargetFileName = "Directory",
	TargetWord = "Title",

	--[[ 4.4.13. indent-blankline.nvim ]]
	IndentBlanklineChar = { dark = { fg = gray_darker }, light = { whiteish } },
	IndentBlanklineSpaceChar = "IndentBlanklineChar",
	IndentBlanklineSpaceCharBlankLine = "IndentBlanklineChar",
	IndentBlanklineContextChar = { dark = { fg = gray }, light = { white } },

	--[[ 4.4.14. trouble.nvim ]]
	TroubleCount = function(self)
		return vim.tbl_extend("force", self.Number, { style = "underline" })
	end,

	--[[ 4.4.14. todo-comments.nvim ]]
	TodoFgFIX = function(self)
		return { fg = self.ErrorMsg.fg }
	end,
	TodoFgHACK = function(self)
		return { fg = self.Todo.fg }
	end,
	TodoFgNOTE = "HintMsg",
	TodoFgPERF = "InfoMsg",
	TodoFgTODO = { fg = blue_dark, style = "italic" },
	TodoFgWARN = function(self)
		return { fg = self.WarningMsg.fg }
	end,

	TodoBgFIX = function(self)
		return { fg = black, bg = self.ErrorMsg.fg, style = { "bold", "italic", "nocombine" } }
	end,
	TodoBgHACK = function(self)
		return { fg = black, bg = self.Todo.fg, style = { "bold", "italic", "nocombine" } }
	end,
	TodoBgNOTE = function(self)
		return { fg = black, bg = self.Hint.bg, style = { "bold", "italic", "nocombine" } }
	end,
	TodoBgPERF = function(self)
		return { fg = black, bg = self.Info.bg, style = { "bold", "italic", "nocombine" } }
	end,
	TodoBgTODO = { fg = black, bg = blue_dark, style = { "bold", "italic", "nocombine" } },
	TodoBgWARN = function(self)
		return { fg = black, bg = self.Warning.bg, style = { "bold", "italic", "nocombine" } }
	end,

	TodoSignFIX = "TodoFgFIX",
	TodoSignHACK = "TodoFgHACK",
	TodoSignNOTE = "TodoFgNOTE",
	TodoSignPERF = "TodoFgPERF",
	TodoSignTODO = "TodoFgTODO",
	TodoSignWARN = "TodoFgWARN",

	--[[ 4.4.15. gitsigns.nvim ]]
	GitSignsAdd = "GitGutterAdd",
	GitSignsAddNr = { fg = addfg, bg = addbg },
	GitSignsAddLn = "GitSignsAddNr",
	GitSignsChange = "GitGutterChange",
	GitSignsChangeNr = { fg = changefg, bg = changebg },
	GitSignsChangeLn = "GitSignsChangeNr",
	GitSignsDelete = "GitGutterDelete",
	GitSignsDeleteNr = { fg = delfg, bg = delbg },
	GitSignsDeleteLn = "GitSignsDeleteNr",

	--[[ 4.4.16. nvim-compe and cmp ]]
	CmpDocumentationBorder = { bg = BG, dark = { fg = gray_dark }, light = { fg = white } },
	CmpDocumentation = { bg = BG },
	CmpItemAbbr = { fg = gray_medium },
	CmpItemMenu = { dark = { bg = gray_darker }, light = { fg = gray_medium } },
	CmpItemAbbrMatch = { fg = red },
	CmpItemAbbrDeprecated = { fg = gray_dark, style = { "strikethrough" } },
	CmpItemAbbrMatchFuzzy = { fg = red },
	CmpItemKind = { fg = turquoise_dark },
	CmpItemKindVariable = { fg = blue },
	CmpItemKindInterface = { fg = blue },
	CmpItemKindText = { fg = blue },
	CmpItemKindFunction = { fg = pink },
	CmpItemKindMethod = { fg = pink },
	CmpItemKindKeyword = { fg = green },
	CmpItemKindProperty = { fg = green },
	CmpItemKindUnit = { fg = green },
	CmpItemAbbrDefault = "Ignore",
	CmpItemAbbrMatchDefault = "Underlined",
	CmpItemAbbrMatchFuzzyDefault = { fg = highlight_group_normal.fg, style = { "nocombine", "underline" } },
	CmpItemKindDefault = "Type",
	CmpItemKindClassDefault = "CmpItemKindStructDefault",
	CmpItemKindColorDefault = "Label",
	CmpItemKindConstantDefault = "Constant",
	CmpItemKindConstructorDefault = "CmpItemKindMethodDefault",
	CmpItemKindEnumDefault = "CmpItemKindStructDefault",
	CmpItemKindEnumMemberDefault = "CmpItemKindConstantDefault",
	CmpItemKindEventDefault = "Repeat",
	CmpItemKindFieldDefault = "Identifier",
	CmpItemKindFileDefault = "Directory",
	CmpItemKindFolderDefault = "CmpItemKindFileDefault",
	CmpItemKindFunctionDefault = "Function",
	CmpItemKindInterfaceDefault = "Type",
	CmpItemKindKeywordDefault = "Keyword",
	CmpItemKindMethodDefault = "CmpItemKindFunctionDefault",
	CmpItemKindModuleDefault = "Include",
	CmpItemKindOperatorDefault = "Operator",
	CmpItemKindPropertyDefault = "CmpItemKindFieldDefault",
	CmpItemKindReferenceDefault = "StorageClass",
	CmpItemKindSnippetDefault = "Special",
	CmpItemKindStructDefault = "Structure",
	CmpItemKindTextDefault = "String",
	CmpItemKindTypeParameterDefault = "Typedef",
	CmpItemKindUnitDefault = "CmpItemKindStructDefault",
	CmpItemKindValueDefault = "CmpItemKindConstantDefault",
	CmpItemKindVariableDefault = "Identifier",
	CmpWindowScrollThumb = { fg = white, style = "bold" },

	--[[ 4.4.16. packer.nvim ]]
	packerFail = "ErrorMsg",
	packerHash = "Number",
	packerPackageNotLoaded = "Ignore",
	packerStatusFail = "Statement",
	packerStatusSuccess = "packerStatusFail",
	packerSuccess = function(self)
		return { fg = green, style = self.packerFail.style }
	end,

	--[[ 4.4.17. alpha.nvim ]]
	AlphaAscii = { dark = { fg = gray_dark }, light = { fg = white } },
	AlphaFooter = { dark = { fg = gray_medium }, light = { fg = gray_light } },
	AlphaEmphasis = { dark = { fg = red_dark }, light = { fg = red_dark } },
	AlphaShortcuts = { dark = { fg = black }, light = { fg = whitest } },
	AlphaHeader = { dark = { fg = green_dark }, light = { fg = green_dark } },
	AlphaButtons = { dark = { fg = gray_medium }, light = { fg = gray_light }, style = { "bold" } },

	--[[ 4.4.18. dev-icons ]]
	DevIconJS = { fg = yellow },
	DevIconJson = { fg = yellow_dark },
	DevIconLua = { fg = blue },
	DevIconCpp = { fg = blue_dark },
	DevIconPy = { fg = blue },
	DevIconMarkdown = { fg = blue_dark },
	DevIconMd = { fg = blue_dark },
	DevIconVim = { fg = green },
	DevIconVimrc = { fg = green },
	DevIconTerminal = { fg = green },
	DevIconConf = { fg = yellow },
	DevIconBash = { fg = pink },
	DevIconZshrc = { fg = blue },
	DevIconZsh = { fg = blue },
	DevIconZshenv = { fg = blue },
	DevIconZshprofile = { fg = blue },
	DevIconSh = { fg = pink },
	DevIconTxt = { fg = turquoise_dark },
	DevIconTex = { fg = green_dark },
	DevIconConfiguration = { fg = gray_medium },
	DevIconH = { fg = purple },
	DevIconDefault = { fg = gray_light },

	--[[ 4.4.19. telescope ]]
	TelescopeSelection = { dark = { fg = white }, light = { fg = blacker }, style = { "bold" } },
	TelescopeSelectionCaret = { fg = red },
	TelescopeMultiSelection = { dark = { fg = white }, light = { fg = blacker }, style = { "bold" } },
	TelescopeNormal = { fg = gray, bg = BG, style = { "bold" } },
	TelescopeBorder = { dark = { fg = gray_dark, bg = gray_dark }, light = { fg = white, bg = white } },
	TelescopePromptBorder = { dark = { fg = gray_dark }, light = { fg = white }, bg = BG },
	TelescopeResultsBorder = { dark = { fg = gray_dark }, light = { fg = white }, bg = BG },
	TelescopePromptNormal = { bg = BG },
	TelescopePreviewNormal = { bg = BG },
	TelescopePreviewBorder = { dark = { fg = gray_dark }, light = { fg = white }, bg = BG },
	TelescopeMatching = { fg = red, style = { "bold" } },
	TelescopePromptPrefix = { fg = red, style = { "bold" } },
	TelescopePromptTitle = { fg = red, style = { "bold" } },
	TelescopeTitle = { fg = red, style = { "bold" } },
	TelescopeResultsDiffUntracked = { fg = red, style = { "bold" } },

	--[[ 4.4.20. floaterm ]]
	Floaterm = { dark = { bg = blackish }, light = { bg = whiter } },
	FloatermNC = { dark = { bg = blackish }, light = { bg = whiter } },
	FloatermBorder = { dark = { bg = blackish, fg = gray_dark }, light = { bg = whiter, fg = whiteish } },

	--[[ 4.4.21. nvim-tree ]]
	NvimTreeNormal = { fg = gray_light, dark = { bg = blackish }, light = { bg = whiter } },
	NvimTreeRootFolder = { fg = purple },
	NvimTreeOpenedFolderName = { dark = { fg = white }, light = { fg = gray_darker }, style = { "bold" } },
	NvimTreeEmptyFolderName = { fg = gray_medium },
	NvimTreeFolderName = { dark = { fg = blue }, light = { fg = blue_dark }, style = { "bold" } },
	NvimTreeGitDirty = { fg = red },
	NvimTreeGitStaged = { fg = green },
	NvimTreeGitMerge = { fg = purple },
	NvimTreeGitRenamed = { fg = yellow },
	NvimTreeGitNew = { fg = blue },
	NvimTreeGitDeleted = { fg = red },
	NvimTreeFolderIcon = { fg = blue },
	NvimTreeIndentMarker = { dark = { fg = gray_darker }, light = { fg = white } },
	NvimTreeWindowPicker = { fg = turquoise_dark },
	NvimTreeOpenedFile = { style = { "bold" } },
	NvimTreeSpecialFile = { fg = pink, style = { "underline" } },
	NvimTreeSymlink = { fg = blue, style = { "underline" } },
	NvimTreeExecFile = { fg = green, style = { "bold" } },
	NvimTreeVertSplit = {
		dark = { bg = blackish, fg = blackish },
		light = { bg = whiter, fg = whiter },
		style = {
			"bold",
		},
	},
	NvimTreeStatuslineNc = { dark = { bg = gray_darkerer }, light = { bg = whiter } },

	--[[ 4.4.22. lightbulb ]]
	LightbulbTextHL = { fg = blue },
	LightbulbVirtualText = { fg = gray_darkest, bg = gray },

	--[[ 4.4.23. rainbow ]]
	rainbowcol1 = { fg = red_dark },
	rainbowcol2 = { fg = turquoise },
	rainbowcol3 = { fg = yellow },
	rainbowcol4 = { fg = green_dark },
	rainbowcol5 = { fg = blue },
	rainbowcol6 = { fg = magenta },
	rainbowcol7 = { dark = { fg = purple_light }, light = { fg = purple } },

	--[[ 4.4.24. galaxyline ]]
	GalaxyTree = { dark = { fg = blackish, bg = blackish }, light = { fg = whitest, bg = whitest } },
	GalaxyViMode = { dark = { fg = white, bg = gray_darkerer }, light = { fg = white, bg = whiter } },
	GalaxyBg = { dark = { fg = black, bg = black }, light = { fg = whitest, bg = whitest } },
	GalaxyFg = { dark = { fg = white, bg = gray_darkerer }, light = { fg = black, bg = whiter }, style = { "bold" } },
	GalaxyFgAlt = { fg = FG, dark = { bg = gray_darkerer }, light = { bg = whiter } },
	GalaxyYellow = { fg = yellow, dark = { bg = gray_darkerer }, light = { bg = whiter }, style = { "bold" } },
	GalaxyCyan = { fg = turquoise, dark = { bg = gray_darkerer }, light = { bg = whiter }, style = { "bold" } },
	GalaxyGreen = { fg = green, dark = { bg = gray_darkerer }, light = { bg = whiter }, style = { "bold" } },
	GalaxyOrange = { fg = orange, dark = { bg = gray_darkerer }, light = { bg = whiter }, style = { "bold" } },
	GalaxyMagenta = { fg = magenta, dark = { bg = gray_darkerer }, light = { bg = whiter }, style = { "bold" } },
	GalaxyBlue = { fg = blue, dark = { bg = gray_darkerer }, light = { bg = whiter }, style = { "bold" } },
	GalaxyRed = { fg = red, dark = { bg = gray_darkerer }, light = { bg = whiter }, style = { "bold" } },

	-- [[ 4.5 Others ]]
	FocusedSymbol = { fg = black, bg = yellow },
	OutlinePreviewBG = { bg = BG },
	NvimDapVirtualTextChanged = { fg = purple },
	DapBreakpoint = { fg = red },
	DapBreakpointCondition = { fg = red_dark },
	DapLogPoint = { fg = turquoise_dark },
	DapStopped = { fg = green },
	DapUIVariable = "Normal",
	DapUIScope = { fg = blue },
	DapUIType = { fg = blue },
	DapUIValue = "Normal",
	DapUIModifiedValue = { { fg = blue }, style = { "bold" } },
	DapUIDecoration = { fg = blue },
	DapUIThread = { fg = green },
	DapUIStoppedThread = { fg = blue },
	DapUIFrameName = "Normal",
	DapUISource = { fg = pink },
	DapUILineNumber = { fg = blue },
	DapUIFloatBorder = { fg = blue },
	DapUIWatchesEmpty = { fg = magenta },
	DapUIWatchesValue = { fg = green_dark },
	DapUIWatchesError = { fg = magenta_dark },
	DapUIBreakpointsPath = { fg = turquoise_dark },
	DapUIBreakpointsInfo = { fg = green_light },
	DapUIBreakpointsCurrentLine = { { fg = green }, style = { "bold" } },
	DapUIBreakpointsLine = "DapUILineNumber",
	DapBreakpointRejected = { fg = orange },
	MarkSignHL = { fg = red },
	MarkSignNumHL = { fg = turquoise },
}
local terminal_colors = {
	[1] = black,
	[2] = red_dark,
	[3] = green_dark,
	[4] = orange,
	[5] = blue,
	[6] = magenta_dark,
	[7] = turquoise,
	[8] = gray,
	[9] = gray_dark,
	[10] = red,
	[11] = green,
	[12] = yellow,
	[13] = turquoise_dark,
	[14] = purple,
	[15] = blue_dark,
	[16] = gray_light,
}

require(vim.g.colors_name)(highlight_group_normal, highlight_groups, terminal_colors)
