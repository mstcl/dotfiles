local present, compe = pcall(require, "compe")
if not present then
   return
end

compe.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
        border = { '┌', '─' ,'┐', '│', '┘', '─', '└', '│' },
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    };
    source = {
        path = {
            menu = "ﱿ Path"
        };
        ultisnips = {
            menu = " Ultisnips"
        };
        nvim_lsp = {
            menu = " LSP"
        };
        nvim_lua = {
            menu = " Lua"
        };
        buffer = {
            menu = "﬘ Buffer"
        };
        spell = false;
        treesitter = {
            menu = " Treesitter"
        };
    };
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<S-Tab>"
    end
end

vim.api.map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

