local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "Q", "", opts)
map("n", "gQ", "", opts)

map("n", "<Up>", "", opts)
map("n", "<Down>", "", opts)
map("n", "<Left>", "", opts)
map("n", "<Right>", "", opts)

map("n", "<space>", ":", opts)
map("v", "<space>", ":", opts)

map("x", "ga", "<Plug>(EasyAlign)", { silent = true, noremap = false })
map("n", "ga", "<Plug>(EasyAlign)", { silent = true, noremap = false })

map("n", "<C-S>v", ":vs<CR>", opts)
map("n", "<C-S>h", ":sp<CR>", opts)

--[[ map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("n", "<A-j>", ":<c-u>execute 'move +'. v:count1<CR>", opts)
map("n", "<A-k>", ":<c-u>execute 'move -1-'. v:count1<CR>", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts) ]]

-- Normal-mode commands
map('n', '<A-j>', ':MoveLine(1)<CR>', opts)
map('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
map('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
map('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
map('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
map('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

map("n", "<F1>", "<cmd>lua require'FTerm'.toggle()<CR>", opts)

-- map("n", "<C-T>", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<C-N>", "<cmd>call SetNumber()<CR>", opts)
map("n", "<C-L>", "<cmd>set list!<CR>", opts)
map("n", "<C-J>", "<cmd>set cursorline!<CR>", opts)
map("n", "<C-P>", ":nohlsearch<CR>:diffupdate<CR>:syntax sync fromstart<CR><c-l>", opts)

map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)

map("i", ",,", ",", opts)

map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

map("n", "<leader>a", ":call FoldColumnToggle()<CR>", opts)
map('n', 'zR', require('ufo').openAllFolds)
map('n', 'zM', require('ufo').closeAllFolds)
map('n', 'zm', require('ufo').closeFoldsWith, {})

map("n", "<leader>b", "<cmd>Telescope buffers<CR>", opts)

map("n", "<leader>c", ":ColorizerToggle<CR>", opts)

map("n", "<leader>dd", "<cmd>DiffviewOpen<CR>", opts)
map("n", "<leader>dc", "<cmd>DiffviewClose<CR>", opts)
map("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", opts)

map("n", "-", "<cmd>Telescope dap commands<CR>", opts)
map("n", "<leader>ev", "<cmd>Telescope dap variables<CR>", opts)
map("n", "<S->", "<cmd>lua require'dap'.continue()<CR>", opts)
map("n", "<PageUp>", "<cmd>lua require'dap'.step_over()<CR>", opts)

map("n", "<PageDown>", "<cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<End>", "<cmd>lua require'dap'.step_out()<CR>", opts)
map("n", "<Home>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map(
	"n",
	"<leader>ec",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	opts
)
map(
	"n",
	"<leader>ef",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	opts
)

map("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)

map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", opts)
map("n", "<leader>gb", "<cmd>Telescope git_bcommits<CR>", opts)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<leader>gl", "<cmd>Gitsigns toggle_signs<CR>", opts)
map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", opts)

map("n", "<leader>h", "<cmd>Telescope oldfiles<CR>", opts)

map("n", "<leader>i", "<cmd>IndentBlanklineToggle<CR>", opts)

map("n", "<leader>j", "<cmd>Telescope resume<CR>", opts)

map("n", "<leader>k", "<cmd>Telescope lsp_document_symbols<CR>", opts)

map("n", "<leader>l", ":call ToggleCmp()<CR>", opts)

map("n", "<leader>m", "<cmd>Telescope keymaps<CR>", opts)

map("n", "<leader>n", "<cmd>Telescope builtin<CR>", opts)

map("n", "<leader>o", "<cmd>SymbolsOutline<CR>", opts)

map("n", "<leader>p", "<cmd>Telescope lazy<CR>", opts)

map("n", "<leader>qr", "<cmd>Glance references<CR>", opts)
map("n", "<leader>qd", "<cmd>Glance definitions<CR>", opts)
map("n", "<leader>qi", "<cmd>Glance implementations<CR>", opts)
map("n", "<leader>qt", "<cmd>Glance type_definitions<CR>", opts)
map({"n", "v"}, "<leader>qc", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

map("n", "<leader>r", "<cmd>Registers<CR>", opts)

map("n", "<leader>sb", ":lua MiniMap.toggle() <CR>", opts)
map("n", "<leader>sp", ":setlocal spell! spelllang=en_gb<CR>", opts)
map("n", "<leader>sf", "<cmd>Telescope spell_suggests<CR>", opts)

map("n", "<leader>t", "<cmd>Telescope frecency<CR>", opts)
map("n", "<leader>u", "<cmd>Telescope undo<CR>", opts)

map("n", "<leader>vr", "<cmd>TSBufToggle rainbow<CR>", opts)
map("n", "<leader>vh", "<cmd>TSBufToggle highlight<CR>", opts)

map("n", "<leader>w", ":call TrimWhiteSpace()<CR>", opts)

map("n", "<leader>x", "<cmd>Trouble workspace_diagnostics<CR>", opts)

map("n", "<leader>y", "<cmd>Telescope file_browser<CR>", opts)

map("n", "<leader>z", "<cmd>ZenMode<CR>", opts)

map("n", "<leader><space>", "<C-^>", opts)

map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", opts)

map("n", "]p", "<cmd>Gitsigns next_hunk<CR>", opts)
map("n", "[p", "<cmd>Gitsigns prev_hunk<CR>", opts)

map("n", "<Left>", "<cmd>BufferPrevious<CR>", opts)
map("n", "<Right>", "<cmd>BufferNext<CR>", opts)

map("n", "<A-<>", "<cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<cmd>BufferMoveNext<CR>", opts)
map("n", "<A-1>", "<cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<cmd>BufferLast<CR>", opts)
map("n", "<A-t>", "<cmd>BufferPin<CR>", opts)
map("n", "<A-c>", "<cmd>BufferClose<CR>", opts)
map("n", "<A-u>", "<cmd>BufferPick<CR>", opts)

-- Half-window movements:
map({ 'n', 'x' }, '<C-u>', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
map({ 'n', 'x' }, '<C-d>', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

-- Page movements:
map({ 'n', 'x' }, '<C-b>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
map({ 'n', 'x' }, '<C-f>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")

-- Start/end of line:
map({ 'n', 'x' }, '0', "<Cmd>lua Scroll('0')<CR>")
map({ 'n', 'x' }, '^', "<Cmd>lua Scroll('^')<CR>")
map({ 'n', 'x' }, '$', "<Cmd>lua Scroll('$', 0, 1)<CR>")

-- Paragraph movements:
map({ 'n', 'x' }, '{', "<Cmd>lua Scroll('{')<CR>")
map({ 'n', 'x' }, '}', "<Cmd>lua Scroll('}')<CR>")

-- Previous/next search result:
map('n', 'n', "<Cmd>lua Scroll('n', 1)<CR>")
map('n', 'N', "<Cmd>lua Scroll('N', 1)<CR>")
map('n', '*', "<Cmd>lua Scroll('*', 1)<CR>")
map('n', '#', "<Cmd>lua Scroll('#', 1)<CR>")
map('n', 'g*', "<Cmd>lua Scroll('g*', 1)<CR>")
map('n', 'g#', "<Cmd>lua Scroll('g#', 1)<CR>")


-- Screen scrolling:
map('n', 'zz', "<Cmd>lua Scroll('zz', 0, 1)<CR>")
map('n', 'zt', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
map('n', 'zb', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
map('n', 'z.', "<Cmd>lua Scroll('z.', 0, 1)<CR>")
map('n', 'z<CR>', "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
map('n', 'z-', "<Cmd>lua Scroll('z-', 0, 1)<CR>")
map('n', 'z^', "<Cmd>lua Scroll('z^', 0, 1)<CR>")
map('n', 'z+', "<Cmd>lua Scroll('z+', 0, 1)<CR>")
map('n', '<C-y>', "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
map('n', '<C-e>', "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")

-- Horizontal screen scrolling:
map('n', 'zH', "<Cmd>lua Scroll('zH')<CR>")
map('n', 'zL', "<Cmd>lua Scroll('zL')<CR>")
map('n', 'zs', "<Cmd>lua Scroll('zs')<CR>")
map('n', 'ze', "<Cmd>lua Scroll('ze')<CR>")
map('n', 'zh', "<Cmd>lua Scroll('zh', 0, 1)<CR>")
map('n', 'zl', "<Cmd>lua Scroll('zl', 0, 1)<CR>")

-- SCROLL_WHEEL_KEYMAPS:

map({ 'n', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
map({ 'n', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")
