local present, lsp = pcall(require, "lspconfig")
if not present then
   return
end

local on_attach = function(client,bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', '<C-K>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<Leader>qD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<Leader>qi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<Leader>qf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<Leader>qd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>qs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>', opts)
    vim.fn.sign_define('LightBulbSign', { text = "", texthl = "LightbulbTextHL" })
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb{ sign = {enabled = false, priority = 9}, virtual_text = { enabled = true, text = "     Code actions available" } }]]
    require "lsp_signature".on_attach({ bind = true, handler_opts = { border = 'single' }, floating_window = true, floating_window_above_cur_line = true, fix_pos = true, hint_enable = false, })
end

lsp.clangd.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

lsp.pyright.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

lsp.vimls.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

lsp.bashls.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

lsp.texlab.setup {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    cmd = { "texlab" },
    filetypes = { "tex", "bib" },
    settings = {
        texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f", '-shell-escape'},
                executable = "latexmk",
                forwardSearchAfter = true,
                onSave = true
            },
            chktex = {
                onEdit = true,
                onOpenAndSave = true
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
                executable = "zathura",
                args = {"--synctex-forward", "%l:1:%f", "%p"}
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = false
            }
        }
    }
}

lsp.sumneko_lua.setup {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    cmd = {"/usr/bin/lua-language-server", "-E", "/usr/share/lua-language-server/main.lua"};
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = "/usr/bin/luajit",
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    }
}

local lsp_configs = require('lspconfig/configs')
local lsp_util = require('lspconfig/util')

lsp_configs.prosemd = {
    default_config = {
        cmd = { "/home/lckdscl/.local/bin/prosemd-lsp", "--stdio" },
        -- filetypes = { "markdown" },
        filetypes = {},
        root_dir = function(fname)
            return lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
        end,
        settings = {},
    }
}

lsp.prosemd.setup {
    on_attach = on_attach
}

require("grammar-guard").init()
lsp.grammar_guard.setup({
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        ltex = {
            enabled = { "latex", "tex", "bib", "markdown" },
            language = "en-GB",
            diagnosticSeverity = "information",
            setenceCacheSize = 2000,
            additionalRules = {
                enablePickyRules = false,
                motherTongue = "en-GB",
            },
            trace = { server = "verbose" },
            dictionary = {},
            disabledRules = {['en-GB'] = {'OXFORD_SPELLING_Z_NOT_S','MORFOLOGIK_RULE_EN_GB', 'COPYRIGHT'}},
            hiddenFalsePositives = {},
        },
    },
})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "double",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "double",
})

local icons = {
    Class = " Class",
    Color = " Color",
    Constant = " Constant",
    Constructor = " Constructor",
    Enum = "了 Enum",
    EnumMember = "  EnumMember",
    Field = " Field",
    File = " File",
    Folder = " Folder",
    Function = " Function",
    Interface = " Interface",
    Keyword = " Keyword",
    Method = "ƒ Method",
    Module = " Module",
    Property = " Property",
    Snippet = "﬌ Snippet",
    Struct = " Structure",
    Text = " Text",
    Unit = " Unit",
    Value = " Value",
    Variable = " Variable",
}

local kinds = vim.lsp.protocol.CompletionItemKind
    for i, kind in ipairs(kinds) do
    kinds[i] = icons[kind] or kind
end
