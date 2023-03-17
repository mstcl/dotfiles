local set = vim.opt

set.background = "light"
set.autochdir = true
set.updatetime = 180
set.modeline = true
set.cursorline = true
set.cursorlineopt = "number"
set.synmaxcol = 400
set.colorcolumn = "86"
set.hidden = true
set.showmode = false
set.showcmd = true
set.lazyredraw = true
set.ttyfast = true
set.conceallevel = 2
set.termguicolors = true
set.showtabline = 2
set.laststatus = 3
set.ruler = false
set.pastetoggle="<F2>"

set.foldmethod = "syntax"
set.foldminlines = 1
set.foldnestmax = 6
set.foldenable = true
set.foldlevelstart = 99
set.foldlevel = 99
set.foldcolumn = "1"

set.wrap = true
set.whichwrap = set.whichwrap + "<>[]hl"
set.scrolljump = 1
set.wrapmargin = 0
set.textwidth = 0
set.formatoptions = set.formatoptions - "cro"
set.linebreak = true
set.mouse = "a"
set.undofile = true
set.number = true
set.relativenumber = false
set.splitbelow = true
set.splitright = true

set.timeoutlen = 400
set.ttimeout = true
set.ttimeoutlen = 10

set.hlsearch = true
set.ignorecase = true
set.incsearch = true
set.smartcase = true

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.smarttab = true
set.autoindent = true

set.winblend = 0
set.pumblend = 0

set.backspace = { "indent", "eol", "start" }

set.clipboard = "unnamedplus"

set.sidescrolloff = 5
set.scrolloff = 1

set.history = 1000

vim.cmd([[set spell spelllang=en_gb]])
set.spell = false
set.encoding = "utf-8"

set.list = true
vim.cmd([[set fillchars+=eob:\ ,vert:│,foldopen:▾,foldclose:▸,foldsep:│,fold:\ ,diff:╱]])
vim.cmd([[set listchars=tab:<->,extends:›,precedes:‹,nbsp:∩,eol:¶,trail:×,lead:\ ,space:·,multispace:···+]])
set.showbreak = '↳'

set.completeopt = {'menu', 'menuone', 'noselect'}
set.shortmess = set.shortmess + "OosSatTcI"
set.swapfile = false
set.path = set.path + "**"

vim.cmd([[filetype plugin on]])

vim.g['vimsyn_embed'] = 'l'

vim.g['tex_flavor'] = 'latex'
vim.g['tex_fold_enabled'] = '1'
vim.g['tex_conceal'] = 'abdgms'

vim.cmd([[let &titlestring = 'nvim ' ". expand("%:t")]])
set.title = true
