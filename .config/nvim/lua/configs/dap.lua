local dap = require('dap')
local vtext = require('nvim-dap-virtual-text')
local present, ui = pcall(require, "dapui")

if not present then
    return
end

vtext.setup {
    enabled = true,
    enabled_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = false,
    commented = false,
    virt_text_pos = 'eol',
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil
}
dap.defaults.fallback.terminal_win_cmd = "10split new"

local signs = { Breakpoint = " ", BreakpointCondition = " ", LogPoint = " ", Stopped = " ", BreakpointRejected = " " }
for type, icon in pairs(signs) do
    local hl = "Dap" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

ui.setup{
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },
    sidebar = {
        elements = {
            { id = "scopes", size = 0.25, },
            { id = "breakpoints", size = 0.25 },
            -- { id = "stacks", size = 0.25 },
            -- { id = "watches", size = 0.25 },
        },
        size = 25,
        position = "left",
    },
    tray = {
        elements = { "repl" },
        size = 3,
        position = "bottom",
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
}
