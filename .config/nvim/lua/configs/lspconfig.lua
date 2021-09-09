local present, lspconfig = pcall(require, "lspconfig")
if not present then
   return
end

local on_attach = function(client,bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gH', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<C-x>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>', opts)
end

lspconfig.clangd.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

lspconfig.pyright.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

lspconfig.vimls.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

lspconfig.bashls.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

lspconfig.texlab.setup {
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

lspconfig.sumneko_lua.setup {
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

require("grammar-guard").init()
lspconfig.grammar_guard.setup({
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
                enablePickyRules = true,
                motherTongue = "en-GB",
            },
            trace = { server = "verbose" },
            dictionary = {},
            disabledRules = {['en-GB'] = {'OXFORD_SPELLING_Z_NOT_S'}},
            hiddenFalsePositives = {},
        },
    },
})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
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
