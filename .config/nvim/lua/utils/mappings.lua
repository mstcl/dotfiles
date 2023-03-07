local map = vim.keymap.set

map("n", "Q", "", { silent = true, noremap = true })
map("n", "gQ", "", { silent = true, noremap = true })

map("n", "<Up>", "", { silent = true, noremap = true })
map("n", "<Down>", "", { silent = true, noremap = true })
map("n", "<Left>", "", { silent = true, noremap = true })
map("n", "<Right>", "", { silent = true, noremap = true })

map("n", "<space>", ":", { silent = true, noremap = true })
map("v", "<space>", ":", { silent = true, noremap = true })

map("x", "ga", "<Plug>(EasyAlign)", { silent = true, noremap = false })
map("n", "ga", "<Plug>(EasyAlign)", { silent = true, noremap = false })

map("n", "<C-S>v", ":vs<CR>", { silent = true, noremap = true })
map("n", "<C-S>h", ":sp<CR>", { silent = true, noremap = true })

map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true })
map("n", "<A-j>", ":<c-u>execute 'move +'. v:count1<CR>", { silent = true, noremap = true })
map("n", "<A-k>", ":<c-u>execute 'move -1-'. v:count1<CR>", { silent = true, noremap = true })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true, noremap = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { silent = true, noremap = true })

map("n", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[", { silent = true, noremap = true })
map("n", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<CR>", { silent = true, noremap = true })

map("n", "<F1>", "<cmd>lua require'FTerm'.toggle()<CR>", { silent = true, noremap = true })

map("n", "<C-T>", "<cmd>NvimTreeToggle<CR>", { silent = true, noremap = true })
map("n", "<C-N>", "<cmd>call SetNumber()<CR>", { silent = true, noremap = true })
map("n", "<C-L>", "<cmd>set list!<CR>", { silent = true, noremap = true })
map("n", "<C-J>", "<cmd>set cursorline!<CR>", { silent = true, noremap = true })
map("n", "<C-P>", ":nohlsearch<CR>:diffupdate<CR>:syntax sync fromstart<CR><c-l>", { silent = true, noremap = true })

map("n", "n", "nzz", { silent = true, noremap = true })
map("n", "N", "Nzz", { silent = true, noremap = true })
map("n", "*", "*zz", { silent = true, noremap = true })
map("n", "#", "#zz", { silent = true, noremap = true })
map("n", "g*", "g*zz", { silent = true, noremap = true })
map("n", "g#", "g#zz", { silent = true, noremap = true })

map("i", ",,", ",", { silent = true, noremap = true })

map("x", "<", "<gv", { silent = true, noremap = true })
map("x", ">", ">gv", { silent = true, noremap = true })

map("n", "<leader>a", ":call FoldColumnToggle()<CR>", { silent = true, noremap = true })
map('n', 'zR', "<cmd>lua require('ufo').openAllFolds<CR>", {silent = true, noremap = true })
map('n', 'zM', "<cmd>lua require('ufo').closeAllFolds<CR>", {silent = true, noremap = true })
map('n', 'zr', "<cmd>lua require('ufo').openFoldsExceptKinds<CR>", {silent = true, noremap = true })
map('n', 'zm', "<cmd>lua require('ufo').closeFoldsWith<CR>", {silent = true, noremap = true })

map("n", "<leader>b", "<cmd>Telescope buffers<CR>", { silent = true, noremap = true })

map("n", "<leader>c", ":ColorizerToggle<CR>", { silent = true, noremap = true })

map("n", "<leader>dd", "<cmd>DiffviewOpen<CR>", { silent = true, noremap = true })
map("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { silent = true, noremap = true })
map("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { silent = true, noremap = true })

map("n", "<leader>er", "<cmd>lua require'dapui'.toggle()<CR>", { silent = true, noremap = true })
map("n", "<leader>es", "<cmd>lua require'dap'.continue()<CR>", { silent = true, noremap = true })
map("n", "<leader>eu", "<cmd>lua require'dap'.step_over()<CR>", { silent = true, noremap = true })
map("n", "<leader>ei", "<cmd>lua require'dap'.step_into()<CR>", { silent = true, noremap = true })
map("n", "<F4>", "<cmd>lua require'dap'.step_into()<CR>", { silent = true, noremap = true })
map("n", "<leader>eo", "<cmd>lua require'dap'.step_out()<CR>", { silent = true, noremap = true })
map("n", "<leader>eb", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true, noremap = true })
map(
	"n",
	"<leader>ec",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ silent = true, noremap = true }
)
map(
	"n",
	"<leader>ef",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	{ silent = true, noremap = true }
)

map("n", "<leader>f", "<cmd>Telescope find_files<CR>", { silent = true, noremap = true })

map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { silent = true, noremap = true })
map("n", "<leader>gb", "<cmd>Telescope git_bcommits<CR>", { silent = true, noremap = true })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { silent = true, noremap = true })
map("n", "<leader>gl", "<cmd>Gitsigns toggle_signs<CR>", { silent = true, noremap = true })
map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { silent = true, noremap = true })

map("n", "<leader>h", "<cmd>Telescope oldfiles<CR>", { silent = true, noremap = true })

map("n", "<leader>i", "<cmd>IndentBlanklineToggle<CR>", { silent = true, noremap = true })

map("n", "<leader>j", "<cmd>Telescope resume<CR>", { silent = true, noremap = true })

map("n", "<leader>k", "<cmd>Telescope zoxide list<CR>", { silent = true, noremap = true })

map("n", "<leader>l", ":call ToggleCmp()<CR>", { silent = true, noremap = true })

map("n", "<leader>m", "<cmd>Telescope man_pages<CR>", { silent = true, noremap = true })

map("n", "<leader>n", "<cmd>Telescope builtin<CR>", { silent = true, noremap = true })

map("n", "<leader>o", "<cmd>SymbolsOutline<CR>", { silent = true, noremap = true })

map("n", "<leader>p", "<cmd>Lazy show<CR>", { silent = true, noremap = true })

map("n", "<leader>qr", "<cmd>Trouble lsp_references<CR>", { silent = true, noremap = true })
map("n", "<leader>qd", "<cmd>lua Scroll('definition')<CR>", { silent = true, noremap = true })
map("n", "<leader>qi", "<cmd>Trouble lsp_implentations<CR>", { silent = true, noremap = true })
map("n", "<leader>qt", "<cmd>Trouble lsp_type_definitions<CR>", { silent = true, noremap = true })
map("n", "<leader>qc", "<cmd>Telescope lsp_code_actions<CR>", { silent = true, noremap = true })

map("n", "<leader>r", "<cmd>Registers<CR>", { silent = true, noremap = true })

map("n", "<leader>sp", ":setlocal spell! spelllang=en_gb<CR>", { silent = true, noremap = true })
map("n", "<leader>sf", "<cmd>Telescope spell_suggests<CR>", { silent = true, noremap = true })

map("n", "<leader>t", ":lua require('telescope').extensions.dict.synonyms()<CR>", { silent = true, noremap = true })

map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { silent = true, noremap = true })

map("n", "<leader>vr", "<cmd>TSBufToggle rainbow<CR>", { silent = true, noremap = true })
map("n", "<leader>vh", "<cmd>TSBufToggle highlight<CR>", { silent = true, noremap = true })

map("n", "<leader>w", ":call TrimWhiteSpace()<CR>", { silent = true, noremap = true })

map("n", "<leader>xx", "<cmd>Trouble<CR>", { silent = true, noremap = true })
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", { silent = true, noremap = true })
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", { silent = true, noremap = true })
map("n", "<leader>xl", "<cmd>Trouble loclist<CR>", { silent = true, noremap = true })
map("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", { silent = true, noremap = true })

map("n", "<leader>y", "<cmd>Telescope file_browser<CR>", { silent = true, noremap = true })

map("n", "<leader>z", "<cmd>ZenMode<CR>", { silent = true, noremap = true })

map("n", "<leader><space>", "<C-^>", { silent = true, noremap = true })

map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { silent = true, noremap = true })

map("n", "<leader>;", "<cmd>Telescope keymaps<CR>", { silent = true, noremap = true })

map("n", "<leader>.", "<cmd>Telescope frecency<CR>", { silent = true, noremap = true })

map("n", "]p", "<cmd>Gitsigns next_hunk<CR>", { silent = true, noremap = true })
map("n", "[p", "<cmd>Gitsigns prev_hunk<CR>", { silent = true, noremap = true })

map("n", "<Left>", "<cmd>BufferPrevious<CR>", { silent = true, noremap = true })
map("n", "<Right>", "<cmd>BufferNext<CR>", { silent = true, noremap = true })

map("n", "<A-<>", "<cmd>BufferMovePrevious<CR>", { silent = true, noremap = true })
map("n", "<A->>", "<cmd>BufferMoveNext<CR>", { silent = true, noremap = true })
map("n", "<A-1>", "<cmd>BufferGoto 1<CR>", { silent = true, noremap = true })
map("n", "<A-2>", "<cmd>BufferGoto 2<CR>", { silent = true, noremap = true })
map("n", "<A-3>", "<cmd>BufferGoto 3<CR>", { silent = true, noremap = true })
map("n", "<A-4>", "<cmd>BufferGoto 4<CR>", { silent = true, noremap = true })
map("n", "<A-5>", "<cmd>BufferGoto 5<CR>", { silent = true, noremap = true })
map("n", "<A-6>", "<cmd>BufferGoto 6<CR>", { silent = true, noremap = true })
map("n", "<A-7>", "<cmd>BufferGoto 7<CR>", { silent = true, noremap = true })
map("n", "<A-8>", "<cmd>BufferGoto 8<CR>", { silent = true, noremap = true })
map("n", "<A-9>", "<cmd>BufferLast<CR>", { silent = true, noremap = true })
map("n", "<A-t>", "<cmd>BufferPin<CR>", { silent = true, noremap = true })
map("n", "<A-c>", "<cmd>BufferClose<CR>", { silent = true, noremap = true })
map("n", "<A-u>", "<cmd>BufferPick<CR>", { silent = true, noremap = true })

-- Half-window movements:
map({ 'n', 'x' }, '<C-u>', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
map({ 'n', 'x' }, '<C-d>', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

-- Page movements:
map({ 'n', 'x' }, '<C-b>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
map({ 'n', 'x' }, '<C-f>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
map({ 'n', 'x' }, '<PageUp>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
map({ 'n', 'x' }, '<PageDown>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")

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
