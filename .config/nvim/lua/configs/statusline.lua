-- :.config/nvim/lua/statusline.lua
-- vim:set ft=lua:
local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local gls = gl.section
local whitespace = require("galaxyline.providers.whitespace")
local extension = require("galaxyline.providers.extensions")
local search = require("galaxyline.providers.search")
ScrollBar = extension.scrollbar_instance
SearchResults = search.get_results

gl.short_line_list = {
	"Trouble",
	"LuaTree",
	"dapui_scopes",
	"dapui_breakpoints",
	"dapui_repl",
	"vista",
	"qf",
	"dbui",
	"startify",
	"",
	"floaterm",
	"DiffviewFileHistoryPanel",
	"DiffviewFiles",
	"alpha",
	"man",
	"term",
	"nerdtree",
	"dashboard",
	"Packer",
	"NvimTree",
	"Help",
	"diff",
	"undotree",
	"netrw",
	"plug",
	"Outline",
	"quickfix",
	"toggleterm",
}
local colors = {
	normal = "#505050",
	insert = "#8b8f7e",
	visual = "#637a8a",
	cmd = "#9c6e63",
	replace = "#7d7284",
	term = "#917563",
}

gls.left[1] = {
	ViMode = {
		provider = function()
			local mode_color = {
				n = colors.normal,
				i = colors.insert,
				v = colors.visual,
				[""] = colors.visual,
				V = colors.visual,
				c = colors.cmd,
				s = colors.replace,
				S = colors.replace,
				[""] = colors.replace,
				ic = colors.insert,
				R = colors.replace,
				Rv = colors.replace,
				cv = colors.replace,
				ce = colors.replace,
				r = colors.replace,
				rm = colors.visual,
				["r?"] = colors.visual,
				["!"] = colors.replace,
				t = colors.term,
			}
			vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
			return "▊ "
		end,
		highlight = "GalaxyFg",
		separator = "",
		separator_highlight = "GalaxyFg",
	},
}

gls.left[4] = {
	FileIcon = {
		provider = "FileIcon",
		condition = condition.buffer_not_empty,
		highlight = "GalaxyFgAlt",
	},
}

gls.left[5] = {
	FileName = {
		provider = "FileName",
		condition = condition.buffer_not_empty,
		highlight = "GalaxyFgAlt",
		--[[ separator = " ",
		separator_highlight = "GalaxyFgAlt", ]]
	},
}

gls.left[6] = {
	LineInfo = {
		provider = "LineColumn",
		highlight = "GalaxyFgAlt",
        icon = " | ",
		--[[ separator = " ",
		separator_highlight = "GalaxyFgAlt", ]]
	},
}

gls.mid[1] = {
	Search = {
		provider = SearchResults,
		highlight = "GalaxyFgAlt",
	},
}

gls.right[2] = {
	GitIcon = {
		provider = function()
			return " שׂ "
		end,
		condition = condition.check_git_workspace,
		separator = " ",
		separator_highlight = "GalaxyFgAlt",
		highlight = "GalaxyFgAlt",
	},
}

gls.right[3] = {
	GitBranch = {
		provider = "GitBranch",
		condition = condition.check_git_workspace,
		highlight = "GalaxyFgAlt",
	},
}

gls.right[4] = {
	BranchSpace = {
		provider = function()
			return " "
		end,
		highlight = "GalaxyFgAlt",
	},
}

gls.right[5] = {
	DiffAdd = {
		provider = "DiffAdd",
		icon = " +",
		highlight = "GalaxyGreen",
	},
}

gls.right[6] = {
	DiffModified = {
		provider = "DiffModified",
		icon = " ~",
		highlight = "GalaxyMagenta",
	},
}

gls.right[7] = {
	DiffRemove = {
		provider = "DiffRemove",
		icon = " -",
		highlight = "GalaxyRed",
	},
}


gls.right[8] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = " ✗ ",
		highlight = "GalaxyRed",
	},
}

gls.right[9] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = " ! ",
		highlight = "GalaxyOrange",
	},
}

gls.right[10] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		icon = " ? ",
		highlight = "GalaxyYellow",
	},
}

gls.right[11] = {
	DiagnosticInfo = {
		provider = "DiagnosticInfo",
		icon = " i ",
		highlight = "GalaxyBlue",
	},
}

gls.right[12] = {
	TrailingWhiteSpace = {
		provider = whitespace,
		highlight = "GalaxyCyan",
	},
}

gls.short_line_left[1] = {
	BufferSpace = {
		provider = function()
			return " "
		end,
		highlight = "GalaxyFgAlt",
	},
}
gls.short_line_left[2] = {
	BufferType = {
		provider = "FileTypeName",
		highlight = "GalaxyFgAlt",
	},
}
