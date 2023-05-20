-- :.config/nvim/lua/statusline.lua
-- vim:set ft=lua:
local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local gls = gl.section
local search = require("galaxyline.providers.search")
SearchResults = search.get_results

gl.short_line_list = {
	"lazy",
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
	"TelescopePrompt",
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
	-- normal = "#505050",
	normal = "#101010",
	insert = "#4F6C31",
	visual = "#2b4c5e",
	cmd = "#A8334C",
	replace = "#88507D",
	term = "#a36b37",
}

local vi_mode = function()
	local alias = {
		n = "NVM",
		i = "INS",
		c = "CMD",
		V = "VIS",
		[""] = "VIS",
		v = "VIS",
		c = "CMD",
		["r?"] = ":CONFIRM",
		rm = "--MORE",
		R = "REP",
		Rv = "VIR",
		s = "SEL",
		S = "SEL",
		["r"] = "HIT-ENTER",
		[""] = "SEL",
		t = "TERM",
		["!"] = "SHELL",
	}
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
	local vim_mode = vim.fn.mode()
	vim.api.nvim_command("hi GalaxyViMode gui=bold guifg=#f5f5f5 guibg=" .. mode_color[vim.fn.mode()])
	return "  " .. alias[vim_mode] .. " "
end

gls.left[2] = {
	ViMode = {
		provider = function()
			return vi_mode()
		end,
		highlight = "GalaxyFg",
	},
}

--[[ gls.left[4] = {
	FileIcon = {
		provider = "FileIcon",
		separator = "",
		icon = "  ",
		condition = condition.buffer_not_empty,
		highlight = "GalaxyFgAlt",
	},
} ]]

gls.left[5] = {
	FileName = {
		provider = "FileName",
		condition = condition.buffer_not_empty,
		highlight = "GalaxyFgAlt",
		icon = " ",
	},
}

gls.left[9] = {
	BranchSpace = {
		provider = function()
			return " "
		end,
		highlight = "GalaxyFgAlt2",
	},
}

gls.left[10] = {
	DiffAdd = {
		provider = "DiffAdd",
		icon = " +",
		highlight = "GalaxyGreen",
	},
}

gls.left[11] = {
	DiffModified = {
		provider = "DiffModified",
		icon = " ~",
		highlight = "GalaxyMagenta",
	},
}

gls.left[12] = {
	DiffRemove = {
		provider = "DiffRemove",
		icon = " -",
		highlight = "GalaxyRed",
	},
}

gls.left[13] = {
	GitIcon = {
		provider = function()
			return " "
		end,
		condition = condition.check_git_workspace,
		separator = " ",
		separator_highlight = "GalaxyFgAlt2",
		highlight = "GalaxyFgAlt2",
	},
}

gls.left[14] = {
	GitBranch = {
		provider = "GitBranch",
		condition = condition.check_git_workspace,
		highlight = "GalaxyFgAlt2",
	},
}

gls.mid[3] = {
	Search = {
		provider = SearchResults,
		highlight = "GalaxyFgAlt2",
	},
}

gls.right[7] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = " ✗",
		highlight = "GalaxyRed",
	},
}

gls.right[8] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = " !",
		highlight = "GalaxyOrange",
	},
}

gls.right[9] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		icon = " ?",
		highlight = "GalaxyYellow",
	},
}

gls.right[10] = {
	DiagnosticInfo = {
		provider = "DiagnosticInfo",
		icon = " i",
		highlight = "GalaxyBlue",
	},
}

gls.right[13] = {
	LineInfo = {
		provider = "LineColumn",
		separator = "",
		separator_highlight = "GalaxyFgAlt2",
		highlight = "GalaxyFgAlt2",
		icon = "⭡ ",
		-- separator = "│",
	},
}

gls.right[14] = {
	LinePercent = {
		separator = "@",
		separator_highlight = "GalaxyFgAlt2",
		provider = "LinePercent",
		highlight = "GalaxyFgAlt2",
	},
}

gls.short_line_left[1] = {
	ViMode = {
		provider = function()
			return vi_mode()
		end,
		highlight = "GalaxyFg",
		separator = " ",
		separator_highlight = "GalaxyFgAlt",
	},
}

--[[ gls.short_line_left[2] = {
	BufferSpace = {
		provider = function()
			return " "
		end,
		highlight = "GalaxyFgAlt2",
	},
} ]]

gls.short_line_left[3] = {
	BufferType = {
		provider = "FileTypeName",
		highlight = "GalaxyFgAlt",
	},
}
