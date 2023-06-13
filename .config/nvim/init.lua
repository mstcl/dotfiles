vim.g.mapleader = ","
vim.g.maplocalleader = ",."

require'lazy-init'

local disabled_built_ins = {
    "gzip",
    "zip",
    "netrwPlugin",
    "netrwSettings",
    "tar",
    "tarPlugin",
    "netrwFileHandlers",
    "zipPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "spellfile_plugin",
    "matchit",
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

vim.cmd[[
    source /home/lckdscl/.config/nvim/lua/utils/functions.vim
]]

require'utils.commands'
require'utils.autocmds'
require'utils.mappings'
require'utils.settings'
