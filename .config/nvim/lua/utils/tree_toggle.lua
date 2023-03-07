local nt = require('nvim-tree')
local api = require('nvim-tree.api')
local tree ={}
local g = vim.g
g.nvim_tree_width = 25
local tree_width = g.nvim_tree_width
tree.toggle = function()
    nt.toggle()
end

return tree
