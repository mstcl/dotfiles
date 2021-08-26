" :.config/nvim/init.vim
" vim:set fdm=marker foldenable:
"+-----------------------------------+
"|  _       _ _         _            |
"| (_)_ __ (_) |___   _(_)_ __ ___   |
"| | | '_ \| | __\ \ / / | '_ ` _ \  |
"| | | | | | | |_ \ V /| | | | | | | |
"| |_|_| |_|_|\__(_)_/ |_|_| |_| |_| |
"|                                   |
"+-----------------------------------+

" PLUGINS {{{
" Require plugins.lua
lua require('plugins')

" Remove these built-in plugins
lua << EOF
local disabled_built_ins = {
    "netrw",
    "gzip",
    "zip",
    "netrwPlugin",
    "netrwSettings",
    "tar",
    "tarPlugin",
    "netrwFileHandlers",
    "zipPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "spellfile_plugin",
    --"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
EOF
" }}}

" AUTOCOMMANDS {{{
" Open a file where it was left off
if has("autocmd")
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" function! GitDir ()
"     silent! !git rev-parse --is-inside-work-tree
"     if v:shell_error == 0
"         echo "true"
"     else
"         echo "false"
"     endif
" endfunction

" Stop autocommenting!
autocmd Filetype * setlocal formatoptions-=cro

" Close Outline if it's the only window left
autocmd BufEnter * if (winnr("$") == 1 && &filetype =~# 'Outline') | q | endif

" highlight yanked
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{"IncSearch", 1000}
augroup END

" Default non-extension filetype is bash
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | set filetype=sh | endif

" Rasi extension is css-based
autocmd BufReadPost *.rasi set filetype=css

" Jupyter Notebook
autocmd BufReadPost *.ipynb set filetype=python

" Autosource init.vim upon saving
autocmd! BufWritePost $MYVIMRC,nvim-init.vim nested source $MYVIMRC | set foldmethod=marker | echo "Reloaded neovim"

" Hide things for nvim-dashboard
" autocmd FileType TelescopePrompt set nolist
autocmd Filetype dashboard set showtabline=0 | set laststatus=0 | set noruler | autocmd WinLeave <buffer> set showtabline=2 | set laststatus=2

" Markdown options
augroup MDoptions
    autocmd!
    autocmd BufNewFile,BufRead *.md set nolist | setlocal spell
    autocmd Filetype markdown nnoremap g= :HeaderIncrease<CR>
    autocmd Filetype markdown nnoremap g- :HeaderDecrease<CR>
augroup END

" Enable indent-blankline for some filetypes only
augroup IndentFT
    autocmd!
    autocmd BufNewFile,BufRead *.{vim,python,lua,cpp,css,sh,ini,conf,html,json,toml,yaml,xml} silent! IndentBlanklineEnable
augroup end

" Autochdir
autocmd BufEnter * silent! lcd %:p:h

" Highlight current matched search
augroup procsearch
  autocmd!
  au CmdLineLeave * let b:cmdtype = expand('<afile>') | if (b:cmdtype == '/' || b:cmdtype == '?') | call timer_start(200, 'ProcessSearch') | endif
augroup END

function! ProcessSearch(timerid)
    let l:patt = '\%#' . @/
    if &ic | let l:patt = '\c' . l:patt | endif
    exe 'match IncSearch /' . l:patt . '/'
endfunc

" Wilder autocommand and setup {{{
autocmd CmdlineEnter * ++once call s:wilder_init()
function! s:wilder_init() abort
    call wilder#setup({
        \ 'modes': [':', '/', '?'],
        \ 'next_key': '<Tab>',
        \ 'previous_key': '<S-Tab>',
        \ 'accept_key': '<Down>',
        \ 'reject_key': '<Up>',
    \ })
    call wilder#set_option('pipeline', [
        \ wilder#debounce(10),
        \ wilder#branch(
        \ [
            \ wilder#check({_, x -> empty(x)}),
            \ wilder#history(),
            \ wilder#result({
                \ 'draw': [{_, x -> ' ' . x}],
            \ }),
        \ ],
            \ wilder#cmdline_pipeline({
                \ 'use_python': 0,
                \ 'fuzzy': 1,
                \ 'fuzzy_filter': wilder#vim_fuzzy_filter(),
            \ }),
            \ wilder#search_pipeline({
                \ 'pattern': wilder#python_fuzzy_pattern(),
                \ 'sorter': wilder#python_difflib_sorter(),
                \ 'engine': 're',
            \ }),
        \ ),
    \ ])

    call wilder#set_option('renderer', wilder#popupmenu_renderer({
        \ 'highlighter': wilder#basic_highlighter(),
        \ 'left': [
            \ wilder#popupmenu_devicons(),
        \ ],
        \ 'right': [
            \ ' ',
            \ wilder#popupmenu_scrollbar(),
        \ ],
    \ }))
endfunction
" }}}
" }}}

" OPTIONS {{{
" Terminal title
let &titlestring = "nvim " ". expand("%:t")
set title

" Use document modeline
set modeline

" Visual settings
set cursorline
set hidden
set noshowmode
set showcmd
set lazyredraw
set conceallevel=2
set termguicolors
set foldcolumn=4

" Folding
set foldmethod=indent
set nofoldenable

" Editing
set wrap
set wrapmargin=0
set textwidth=0
set formatoptions-=cro
set linebreak
set mouse=a
let g:vimsyn_embed= 'l'

" Rule
set number
set relativenumber

" Change default split
set splitbelow
set splitright

" For fast as fuck typers
set timeoutlen=400

" Search options
set hlsearch
set ignorecase
set incsearch
set smartcase

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent

" Normal backspace
set backspace=indent,eol,start

" Systemwide clipboard
set clipboard=unnamedplus

" Scrolloff
set sidescrolloff=5
set scrolloff=1

" Set history
set history=1000

" Spelling
set spell spelllang=en_gb
set nospell
set encoding=utf-8

" Funky characters
set fillchars+=eob:\ ,vert:│,foldopen:▾,foldclose:▸,foldsep:│,fold:─,diff:╱
set list
set listchars=tab:»·,extends:›,precedes:‹,nbsp:∩,eol:¶,trail:·

" Nvim-compe completion
set completeopt=menuone,noselect

" No-obnoxious nvim
set shortmess+=OoSsatqc

" Huh I don't know if this should be here
set path+=**

" Detect other filetypes off by default
filetype plugin on
" }}}

" MAPPINGS {{{
" GENERAL {{{
" Set leaders
let mapleader = ","
let maplocalleader = ",."

" Center search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Type comma easily
inoremap ,, ,

" Toggle paste mode
set pastetoggle=<F2>
function! ShowPaste()
    if &paste
        set showmode
    else
        set noshowmode
    endif
endfunction
autocmd InsertLeave,InsertEnter * call ShowPaste()


" Better indentation
xnoremap < <gv
xnoremap > >gv

" Access command with space
nnoremap <space> :

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv

" New line above/below in normal mode
nmap mo o<esc>
nmap mO O<esc>

" Unbind arrow keys in normal mode
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>

" Compe atocompletion and navigation
lua << EOF
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
EOF

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Move between hunks
nnoremap ]p :Gitsigns next_hunk<CR>
nnoremap [p :Gitsigns prev_hunk<CR>

" Fold with indent-blankline {{{
nnoremap <silent> zA zA:IndentBlanklineRefresh<CR>
nnoremap <silent> za za:IndentBlanklineRefresh<CR>
nnoremap <silent> zm zm:IndentBlanklineRefresh<CR>
nnoremap <silent> zM zM:IndentBlanklineRefresh<CR>
nnoremap <silent> zc zc:IndentBlanklineRefresh<CR>
nnoremap <silent> zC zC:IndentBlanklineRefresh<CR>
nnoremap <silent> zr zr:IndentBlanklineRefresh<CR>
nnoremap <silent> zR zR:IndentBlanklineRefresh<CR>
" }}}

" Barbar buffer motions {{{
" Move to previous/next
nnoremap <silent>    <Left>    :BufferPrevious<CR>
nnoremap <silent>    <Right>   :BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<>     :BufferMovePrevious<CR>
nnoremap <silent>    <A->>     :BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1>     :BufferGoto 1<CR>
nnoremap <silent>    <A-2>     :BufferGoto 2<CR>
nnoremap <silent>    <A-3>     :BufferGoto 3<CR>
nnoremap <silent>    <A-4>     :BufferGoto 4<CR>
nnoremap <silent>    <A-5>     :BufferGoto 5<CR>
nnoremap <silent>    <A-6>     :BufferGoto 6<CR>
nnoremap <silent>    <A-7>     :BufferGoto 7<CR>
nnoremap <silent>    <A-8>     :BufferGoto 8<CR>
nnoremap <silent>    <A-9>     :BufferLast<CR>

" Pin/unpin buffer
nnoremap <silent>    <A-s>     :BufferPin<CR>

" Close buffer
nnoremap <silent>    <A-c>     :BufferClose<CR>

" Magic buffer-picking mode
nnoremap <silent>    <C-s>     :BufferPick<CR>
" }}}

" Popup menu scroll {{{
function! s:s(delta) abort
if pumvisible()
  let l:i = complete_info(['selected']).selected
  call timer_start(0, { -> nvim_select_popupmenu_item(l:i + a:delta, v:true, v:false, {}) })
endif
return "\<Ignore>"
endfunction
inoremap <silent><expr><C-j> <SID>s(+4)
inoremap <silent><expr><C-k> <SID>s(-4)
" }}}
" }}}

" LEADER KEYS {{{

" Leader a {{{
" Toggle foldcolumn
nnoremap <silent> <leader>a  :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction
" }}}

" Leader b {{{
nnoremap <silent> <Leader>b  :Telescope buffers<CR>
" }}}

" Leader c {{{
" Toggle colour highlighting
nnoremap <silent> <Leader>c  :ColorizerToggle<CR>
" }}}

" Leader d {{{
" Goto dashboard
nnoremap <silent> <Leader>d  :Dashboard<CR>
"}}}

" Leader e {{{
" Telescope pickers
nnoremap <silent> <leader>e  :Telescope builtin<CR>
" }}}

" Leader f {{{
" Some telescope maps
nnoremap <silent> <Leader>f  :Telescope find_files<CR>
" }}}

" Leader g {{{
" Toggle git signs
nnoremap <silent> <Leader>gl :Gitsigns toggle_signs<CR>

" Telescope git stuff
nnoremap <silent> <Leader>gb :Telescope git_commits<CR>
nnoremap <silent> <Leader>gc :Telescope git_bcommits<CR>
nnoremap <silent> <Leader>gs :Telescope git_status<CR>

" Preview hunks
nnoremap <silent> <Leader>gh :Gitsigns preview_hunk<CR>
" }}}

" Leader h {{{
" Telescope history
nnoremap <silent> <Leader>h  :Telescope oldfiles<CR>
" }}}

" Leader i {{{
" Indent line toggle
nnoremap <silent> <Leader>i  :IndentBlanklineToggle<CR>
" }}}

" Leader j {{{

" }}}

" Leader l  {{{
" Toggle listchars
nnoremap <silent> <Leader>l  :set list!<CR>
" }}}

" Leader m {{{
" Telescope man page
nnoremap <silent> <leader>m  :Telescope man_pages<CR>
" }}}

" Leader n {{{
" Set number/relativenumber
nnoremap <silent> <Leader>nr :set relativenumber!<CR>
nnoremap <silent> <Leader>nn :set number!<CR>
" }}}

" Leader o {{{
" Symbols outline panel
nnoremap <silent> <Leader>o  :SymbolsOutline<CR>
" }}}

" Leader p {{{
" Packer stuff
nnoremap <silent> <Leader>ps :PackerStatus<CR>
nnoremap <silent> <Leader>pr :wa<CR> <bar> :source %<CR> <bar> :PackerCompile<CR> <bar> :PackerInstall<CR> <bar> :echo "Recompiled Packer"<CR>
nnoremap <silent> <Leader>pi :PackerInstall<CR>
nnoremap <silent> <Leader>pc :PackerCompile<CR>
" }}}

" Leader q {{{
" Telescope LSP
nnoremap <silent> <leader>qr :Telescope lsp_references<CR>
nnoremap <silent> <leader>qd :Telescope lsp_definitions<CR>
nnoremap <silent> <leader>qq :Telescope lsp_document_diagnostics<CR>
" }}}

" Leader r {{{
" Restore session
nnoremap <silent> <leader>r  :SessionLoad<CR>
" }}}

" Leader s {{{
" New split
nnoremap <silent> <Leader>sv :vs<CR>
nnoremap <silent> <Leader>sx :sp<CR>

" Set spell
nnoremap <silent> <Leader>sp :setlocal spell! spelllang=en_gb<CR>
" }}}

" Leader t {{{
" Open sidebar
nnoremap <silent> <Leader>t  :lua require'tree'.toggle()<CR>
" }}}

" Leader u {{{
" Undotree toggle
nnoremap <silent> <Leader>u  :UndotreeToggle<CR>
" }}}

" Leader v {{{
" Treesitter toggles
nnoremap <silent> <Leader>vr :TSBufToggle rainbow<CR>
nnoremap <silent> <Leader>vh :TSBufToggle highlight<CR>
" }}}

" Leader w {{{
" Delete whitespace
nnoremap <silent> <leader>w  :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" }}}

" Leader y {{{
nnoremap <silent> <Leader>y  :Telescope file_browser<CR>
" }}}

" Leader z {{{
" Zenmode toggle
nnoremap <silent> <Leader>z  :ZenMode<CR>
" }}}

" Leader space {{{
" switch between prev/next buffer
nnoremap <silent> <Leader><space> <C-^>
" }}}

" Leader slash {{{
" Disable search highlighting
nnoremap <silent> <Leader>\  :noh<cr>

" Telescope grep
nnoremap <silent> <leader>/  :Telescope live_grep<CR>
" }}}

" Leader dot {{{
nnoremap <silent> <leader>.  :Telescope keymaps<CR>
" }}}

" Leader apostrophe {{{
nnoremap <silent> <Leader>'  :Telescope registers<CR>
" }}}

" }}}
" }}}

" DASHBOARD ASCII {{{
" LAYERS {{{
" let g:dashboard_custom_header = [
"     \ '                                                       ',
"     \ '                                                       ',
"     \ '                                                       ',
"     \ '                                                       ',
"     \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
"     \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
"     \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
"     \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
"     \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
"     \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
"     \ '                                                       ',
"     \ '                                                       ',
"     \ '                                                       ',
"     \ '                                                       ',
"     \]
" }}}
" ROSE {{{
let g:dashboard_custom_header = [
\'                                             ',
\'                ..ooo.                       ',
\'            .888888888.                      ',
\'             88"P""T"T888 8o                 ',
\'         o8o 8.8"8 88o."8o 8o                ',
\'        88 . o88o8 8 88."8 88P"o             ',
\'       88 o8 88 oo.8 888 8 888 88            ',
\'       88 88 88o888" 88"  o888 88            ',
\'       88."8o."T88P.88". 88888 88            ',
\'       888."888."88P".o8 8888 888            ',
\'       "888o"8888oo8888 o888 o8P"            ',
\'        "8888.""888P"P.888".88P              ',
\'         "88888ooo  888P".o888               ',
\'           ""8P"".oooooo8888P                ',
\'  .oo888ooo.    8888NICK8P8                  ',
\'o88888"888"88o.  "8888"".88   .oo888oo..     ',
\' 8888" "88 88888.       88".o88888888"888.   ',
\' "8888o.""o 88"88o.    o8".888"888"88 "88P   ',
\'  T888C.oo. "8."8"8   o8"o888 o88" ".=888"   ',
\'   88888888o "8 8 8  .8 .8"88 8"".o888o8P    ',
\'    "8888C.o8o  8 8  8" 8 o" ...o"""8888     ',
\'      "88888888 " 8 .8  8   88888888888"     ',
\'        "8888888o  .8o=" o8o..o(8oo88"       ',
\'            "888" 88"    888888888""         ',
\'                o8P       "888"""            ',
\'          ...oo88                            ',
\' "8oo...oo888""                              ',
\]
" }}}
" BLOODY {{{
let g:dashboard_custom_header = [
\'',
\'',
\'',
\'',
\'   ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓',
\'   ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒',
\'  ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░',
\'  ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ',
\'  ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒',
\'  ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░',
\'  ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░',
\'     ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ',
\'           ░    ░  ░    ░ ░        ░   ░         ░   ',
\'                                  ░                  ',
\'                       v0.5.0                        ',
\'',
\]
" }}}
" PRIEST {{{
" let g:dashboard_custom_header = [
" \'',
" \'',
" \'',
" \'',
" \'  ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  ',
" \'  ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄',
" \'  ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███',
" \'  ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███',
" \'  ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███',
" \'  ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███',
" \'  ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███',
" \'   ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀ ',
" \'                                                                   ',
" \'',
" \]
" }}}
" }}}
