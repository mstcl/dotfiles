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
    'LuaTree',
    'vista',
    'qf',
    'dbui',
    'startify',
    '',
    'floaterm',
    'alpha',
    'man',
    'term',
    'nerdtree',
    'dashboard',
    'Packer',
    'NvimTree',
    'Help',
    'diff',
    'undotree',
    'netrw',
    'plug',
    'Outline',
    'quickfix',
    'toggleterm'
}

gls.left[1] = {
ViMode = {
        provider = function()
            local mode_color = {n = "#505050", i = "#8b8f7e",v="#637a8a",
            [''] = "#637a8a",V="#637a8a",
            c = "#877979",no = "#aa8f7c",s = "#917563",
            S="#917563",[''] = "#917563",
            ic = "#90907f",R = "#877979",Rv = "#877979",
            cv = "#aa8f7c",ce = "#aa8f7c", r = "#aa8f7c",
            rm = "#4c5d69", ['r?'] = "#4c5d69",
            ['!']  = "#aa8f7c",t = "#aa8f7c"}
            vim.api.nvim_command("hi GalaxyViMode guibg=#454545 guifg=" .. mode_color[vim.fn.mode()])
            return "▊ "
        end,
        highlight = "GalaxyFg",
        separator = '',
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
  },
}

gls.mid[1] = {
    Search = {
        provider = SearchResults,
        highlight = "GalaxyFgAlt",
    }
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
    icon = "  ",
    highlight = "GalaxyRed",
  },
}

gls.right[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = "GalaxyOrange",
  },
}

gls.right[10] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = " 𥉉",
    highlight = "GalaxyYellow",
  },
}

gls.right[11] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = "GalaxyBlue",
    },
}

gls.right[12] = {
    TrailingWhiteSpace = {
        provider = whitespace,
        icon = ' ',
        highlight = "GalaxyMagenta",
    }
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
