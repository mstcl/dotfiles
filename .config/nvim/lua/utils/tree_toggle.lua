local nt = require('nvim-tree')
local api = require('nvim-tree.api')
local tree ={}
local g = vim.g
g.nvim_tree_width = 25
local tree_width = g.nvim_tree_width
tree.toggle = function()
    nt.toggle()
    if api.tree.get_node_under_cursor() then
        require('bufferline.state').set_offset(tree_width + 1, ' ')
        api.open(true)
    else
        require('bufferline.state').set_offset(0)
    end
end

return tree
