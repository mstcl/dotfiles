local set = vim.opt

set.autochdir = false

set.updatetime = 180

set.modeline = true
set.cursorline = true
set.cursorlineopt = "number"
set.colorcolumn = "88"
set.synmaxcol = 400
set.hidden = true
set.showmode = false
set.showcmd = true
-- set.cmdheight = 0
set.lazyredraw = true
set.ttyfast = true
set.conceallevel = 2
set.showtabline = 2
set.laststatus = 3
set.ruler = false

set.iskeyword:append("-")
set.nrformats:append("unsigned")
set.nrformats:remove("bin", "hex")
set.pastetoggle = "<F2>"
set.mouse = "a"

set.termguicolors = true
set.background = "light"

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
set.breakindent = false
set.linebreak = true
set.formatoptions = set.formatoptions - "cro"

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

set.showmatch = true
set.matchtime = 1

set.pumheight = 15
set.pumwidth = 15

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.smarttab = true
set.autoindent = true
set.shiftround = true
set.smartindent = true

set.winblend = 0
set.pumblend = 0

set.backspace = { "indent", "eol", "start" }

set.clipboard = "unnamedplus"

set.sidescrolloff = 5
set.scrolloff = 1

vim.cmd([[set spell spelllang=en_gb]])
set.spell = false
set.encoding = "utf-8"

set.list = true
vim.cmd([[set fillchars+=eob:\ ,vert:│,foldopen:⏷,foldclose:▸,foldsep:│,fold:\ ,diff:╱]])
vim.cmd([[set listchars=tab:<->,extends:›,precedes:‹,nbsp:∩,eol:¶,trail:×,lead:\ ,space:·,multispace:···+]])
set.showbreak = "↳"

set.completeopt = { "menu", "menuone", "noselect" }
set.shortmess = set.shortmess + "OosSatTcI"
set.swapfile = false
set.path = set.path + "**"
set.history = 1000
set.undofile = true
set.undolevels = 500

vim.cmd([[filetype plugin on]])

vim.g["vimsyn_embed"] = "l"

vim.g["tex_flavor"] = "latex"
vim.g["tex_fold_enabled"] = "1"
vim.g["tex_conceal"] = "abdgms"

vim.cmd([[let &titlestring = 'nvim ' ". expand("%:t")]])
set.title = true
set.autoread = true
