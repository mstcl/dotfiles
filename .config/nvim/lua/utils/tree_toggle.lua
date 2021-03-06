local tree ={}
local g = vim.g
g.nvim_tree_width = 25
local tree_width = g.nvim_tree_width
tree.toggle = function()
    require('nvim-tree').toggle()
    if require('nvim-tree.view').is_visible() then
        require('bufferline.state').set_offset(tree_width + 1, ' ')
        require('nvim-tree').find_file(true)
    else
        require('bufferline.state').set_offset(0)
    end
end

return tree
