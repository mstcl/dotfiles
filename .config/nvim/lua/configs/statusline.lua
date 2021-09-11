-- :.config/nvim/lua/statusline.lua
-- vim:set ft=lua:
local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local whitespace = require('galaxyline.provider_whitespace')
local search = require('galaxyline.provider_search')
local function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

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

local colors = {
    bg       = '#353535',
    bg2      = '#454545',
    bg3      = '#151515',
    line_bg  = '#121212',
    fg       = '#949494',
    fg_green = '#8d7667',
    yellow   = '#8b8f7e',
    cyan     = '#937f74',
    darkblue = '#987a6b',
    green    = '#aa8f7c',
    orange   = '#6b6e61',
    purple   = '#877979',
    magenta  = '#6c6161',
    blue     = '#6c574c',
    red      = '#637a8a',
}

gls.left[2] = {
    ViMode3 = {
        provider = function()
            local aliases = {
                n      = '  ',
                i      = '  ',
                c      = '  ',
                V      = '  ',
                [''] = '  ',
                v      = '  ',
                C      = '  ',
                ['r?'] = '  ',
                rm     = '  ',
                R      = '  ',
                Rv     = '  ',
                s      = '  ',
                S      = '  ',
                ['r']  = '  ',
                [''] = '  ',
                t      = '  ',
                ['!']  = '  ',
            }
            local mode_color = {n = colors.yellow, i = colors.green,v=colors.blue,
            [''] = colors.blue,V=colors.blue,
            c = colors.magenta,no = colors.red,s = colors.orange,
            S=colors.orange,[''] = colors.orange,
            ic = colors.yellow,R = colors.purple,Rv = colors.purple,
            cv = colors.red,ce=colors.red, r = colors.cyan,
            rm = colors.cyan, ['r?'] = colors.cyan,
            ['!']  = colors.red,t = colors.red}
            local vim_mode = vim.fn.mode()
            vim.api.nvim_command('hi GalaxyViMode3 gui=bold guifg='..mode_color[vim_mode])
            return aliases[vim_mode]
        end,
        highlight = {colors.line_bg, colors.line_bg},
        separator = '',
        separator_highlight = {colors.bg,colors.bg2},
    },
}

gls.left[3] = {
    ViMode = {
        icon = function()
            local icons = {
                n      = ' ',
                i      = ' ',
                c      = ' ',
                V      = ' ',
                [''] = ' ',
                v      = ' ',
                C      = ' ',
                R      = ' ',
                t      = ' ',
            }
            return icons[vim.fn.mode()]
        end,
        provider = function()
            local alias = {
                n      = 'NORMAL',
                i      = 'INSERT',
                c      = 'COMMAND',
                V      = 'V-LINE',
                [''] = 'V-BLOCK',
                v      = 'VISUAL',
                C      = 'COMMAND',
                ['r?'] = ':CONFIRM',
                rm     = '--MORE',
                R      = 'REPLACE',
                Rv     = 'REPLACE-V',
                s      = 'S',
                S      = 'S',
                ['r']  = 'HIT-ENTER',
                [''] = 'SELECT',
                t      = 'TERMINAL',
                ['!']  = 'SH',
            }
            local mode_color = {n = colors.yellow, i = colors.green,v=colors.blue,
            [''] = colors.blue,V=colors.blue,
            c = colors.magenta,no = colors.red,s = colors.orange,
            S=colors.orange,[''] = colors.orange,
            ic = colors.yellow,R = colors.purple,Rv = colors.purple,
            cv = colors.red,ce=colors.red, r = colors.cyan,
            rm = colors.cyan, ['r?'] = colors.cyan,
            ['!']  = colors.red,t = colors.red}
            local vim_mode = vim.fn.mode()
            vim.api.nvim_command('hi GalaxyViMode gui=bold guibg='..mode_color[vim_mode])
            return alias[vim_mode]
        end,
        highlight = {colors.line_bg, colors.bg},
        separator = '',
        separator_highlight = {colors.bg,colors.bg2},
    },
}

gls.left[5] = {
    ViMode2 = {
        provider = function()
            local aliases = {
                n      = ' ',
                i      = ' ',
                c      = ' ',
                V      = ' ',
                [''] = ' ',
                v      = ' ',
                C      = ' ',
                ['r?'] = ' ',
                rm     = ' ',
                R      = ' ',
                Rv     = ' ',
                s      = ' ',
                S      = ' ',
                ['r']  = ' ',
                [''] = ' ',
                t      = ' ',
                ['!']  = ' ',
            }
            local mode_color = {n = colors.yellow, i = colors.green,v=colors.blue,
            [''] = colors.blue,V=colors.blue,
            c = colors.magenta,no = colors.red,s = colors.orange,
            S=colors.orange,[''] = colors.orange,
            ic = colors.yellow,R = colors.purple,Rv = colors.purple,
            cv = colors.red,ce=colors.red, r = colors.cyan,
            rm = colors.cyan, ['r?'] = colors.cyan,
            ['!']  = colors.red,t = colors.red}
            local vim_mode = vim.fn.mode()
            vim.api.nvim_command('hi GalaxyViMode2 gui=bold guifg='..mode_color[vim_mode])
            return aliases[vim_mode]
        end,
        highlight = {colors.line_bg, colors.line_bg},
        separator = '',
        separator_highlight = {colors.bg,colors.bg2},
    },
}

gls.left[7] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        icon = '  ',
        separator = ' ',
        separator_highlight = {colors.bg,colors.line_bg},
        highlight = {colors.bg,colors.line_bg,'bold'},
    }
}

gls.left[8]  = {
    DiffAdd = {
        provider = 'DiffAdd',
        icon = '+',
        highlight = {colors.bg,colors.line_bg,'bold'},
    }
}

gls.left[9] = {
    DiffModified = {
        provider = 'DiffModified',
        icon = '~',
        highlight = {colors.bg,colors.line_bg,'bold'},
    }
}

gls.left[10] = {
    DiffRemove = {
        provider = 'DiffRemove',
        icon = '-',
        highlight = {colors.bg,colors.line_bg,'bold'},
    }
}
gls.right[1] = {
    Search = {
        provider = search,
        icon = ' ',
        highlight = {colors.bg,colors.line_bg,'bold'},
        separator_highlight = {'NONE',colors.line_bg},
    }
}

gls.right[2] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    icon = '漣',
    separator_highlight = {colors.cyan,colors.line_bg},
    highlight = {colors.bg,colors.line_bg,'bold'}
  }
}

gls.right[3] = {
    RightEnd = {
        provider = function() return ' ' end,
        highlight = {colors.orange,colors.line_bg},
        separator = '',
        separator_highlight = {'NONE',colors.line_bg},
    },
}


gls.right[4] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.bg,colors.line_bg,'bold'}
    }
}

gls.right[5] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.bg,colors.line_bg,'bold'},
    }
}

gls.right[6] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.bg,colors.line_bg,'bold'},
    }
}

gls.right[7] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        highlight = {colors.bg,colors.line_bg,'bold'},
        icon = '  ',
    }
}


gls.right[8] = {
    Sep = {
        provider = function() return '' end,
        highlight = {colors.orange,colors.orange},
        separator = '',
        separator_highlight = {'NONE',colors.line_bg,'bold'},
    },
}

gls.right[9] = {
    TrailingWhiteSpace = {
        provider = whitespace,
        icon = ' ',
        highlight = {colors.red,colors.line_bg,'bold'},
    }
}

gls.right[10] = {
    FTpre = {
        -- provider = function() return '' end,
        provider = function() return '' end,
        condition = function() return has_file_type() end,
        highlight = {colors.bg,colors.line_bg},
        separator = '',
        separator_highlight = {'NONE',colors.line_bg},
    },
}

gls.right[11] ={
    FileIcon = {
        provider = 'FileIcon',
        separator = '',
        condition = function() return has_file_type() end,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
        separator_highlight = {'NONE',colors.line_bg},
    },
}

gls.right[12] = {
    Filetype = {
        condition = function() return has_file_type() end,
        provider = 'FileTypeName',
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg,'bold'},
        separator = '',
        separator_highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg,'bold'},
    }
}

gls.right[13] = {
    FTend = {
        -- provider = function() return '  ' end,
        provider = function() return '  ' end,
        condition = function() return has_file_type() end,
        highlight = {colors.bg,colors.line_bg},
        separator = '',
        separator_highlight = {'NONE',colors.line_bg},
    },
}
gls.short_line_left[1] = {
    RainbowReFd = {
        provider = function() return ' ' end,
        highlight = {colors.orange,colors.line_bg},
        separator = '',
        separator_highlight = {'NONE',colors.line_bg},
    },
}

gls.short_line_left[2] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = '',
        separator_highlight = {'NONE',colors.line_bg},
        highlight = {colors.bg2,colors.line_bg,'bold'}
    }
}
