-- :.config/nvim/lua/statusline.lua
-- vim:set ft=lua:
local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local gls = gl.section
--[[ local whitespace = require("galaxyline.provider_whitespace")
local extension = require("galaxyline.provider_extensions")
local lspclient = require("galaxyline.provider_lsp") ]]
local whitespace = require("galaxyline.providers.whitespace")
local extension = require("galaxyline.providers.extensions")
local lspclient = require("galaxyline.providers.lsp")
local search = require("galaxyline.providers.search")
ScrollBar = extension.scrollbar_instance
GetLspClient = lspclient.get_lsp_client
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
	normal = "#d5d5d5",
	insert = "#4F6C31",
	visual = "#2b4c5e",
	cmd = "#A8334C",
	replace = "#88507D",
	term = "#a36b37",
}
--[[ gls.left[1] = {
	Gape = {
		provider = function()
			return "█ "
		end,
		highlight = "GalaxyBg",
	},
} ]]

gls.left[2] = {
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
			return "█"
		end,
		highlight = "GalaxyFg",
		separator = " ",
		separator_highlight = "GalaxyFg",
	},
}

gls.left[4] = {
	FileIcon = {
		provider = "FileIcon",
		separator = "",
		condition = condition.buffer_not_empty,
		highlight = "GalaxyFgAlt",
	},
}

gls.left[5] = {
	FileName = {
		provider = "FileName",
		condition = condition.buffer_not_empty,
		highlight = "GalaxyFgAlt",
	},
}

gls.left[6] = {
	FileEncode = {
		provider = "FileEncode",
		condition = condition.buffer_not_empty,
		icon = " |",
		highlight = "GalaxyFgAlt2",
	},
}

gls.left[7] = {
	FileFormat = {
		provider = "FileFormat",
		condition = condition.buffer_not_empty,
		icon = "  | ",
		highlight = "GalaxyFgAlt2",
	},
}

gls.mid[1] = {
	LineInfo = {
		provider = "LineColumn",
		highlight = "GalaxyFgAlt2",
		-- icon = " | ",
	},
}

gls.mid[2] = {
	LinePercent = {
		provider = "LinePercent",
		highlight = "GalaxyFgAlt2",
		icon = " |",
	},
}

gls.mid[3] = {
	Search = {
		provider = SearchResults,
		highlight = "GalaxyFgAlt2",
		icon = " |",
	},
}

gls.right[1] = {
	ShowLspClient = {
		provider = "GetLspClient",
		condition = function()
			local tbl = { ["dashboard"] = true, [""] = true }
			if tbl[vim.bo.filetype] then
				return false
			end
			return true
		end,
		icon = " ",
		separator = " ",
		separator_highlight = "GalaxyFgAlt2",
		highlight = "GalaxyFgAlt2",
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
--[[ gls.right[13] = {
	ScrollBar = {
		provider = "ScrollBar",
		highlight = "GalaxyFgAlt2",
		-- icon = " | ",
	},
} ]]

gls.right[14] = {
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
			return "█"
		end,
		highlight = "GalaxyFg",
		separator_highlight = "GalaxyFg",
	},
}

--[[ gls.right[13] = {
	Gape2 = {
	provider = function()
			return "█ "
		end,
		highlight = "GalaxyBg",
	},
} ]]

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
