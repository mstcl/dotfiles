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
    --netrw",
    --netrwPlugin",
    --"netrwSettings",
    --"netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    }

    for _, plugin in pairs(disabled_built_ins) do
        vim.g["loaded_" .. plugin] = 1
    end
EOF
" }}}

" AUTOCOMMANDS {{{
" Close Outline if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && &filetype =~# 'Outline') | q | endif

" highlight yanked
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{"IncSearch", 1000}
augroup END

" Default non-extension filetype is bash
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | set filetype=sh | endif

" Rasi extension is css-based
autocmd BufReadPost *.rasi set filetype=css

" Autosource init.vim upon saving
autocmd! BufWritePost $MYVIMRC,nvim-init.vim nested source $MYVIMRC | set foldmethod=marker | echo "Reloaded neovim"

" Hide things for nvim-dashboard
autocmd Filetype dashboard set showtabline=0 | set laststatus=0 | set noruler
autocmd WinEnter,BufEnter * if &filetype != 'dashboard' | set showtabline=2 | set laststatus=2 | endif

" Vimwiki settings
augroup VimwikiSettings
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal spell! spelllang=en_gb | highlight VimwikiDelText term=strikethrough cterm=strikethrough gui=strikethrough | highlight VimwikiCode guifg=lightblue
    autocmd Filetype vimwiki set fdm=expr
    autocmd InsertEnter *.{vimwiki,wiki,md} set conceallevel=0
    autocmd InsertLeave *.{vimwiki,wiki,md} set conceallevel=2
augroup END

" Vimwiki remaps
augroup VimwikiRemaps
    autocmd!
    autocmd Filetype vimwiki inoremap <silent><expr><buffer> <cr> pumvisible() ? compe#confirm({'keys': '<CR>', 'select': v:true})
                              \: "<C-]><Esc>:VimwikiReturn 1 5<CR>"
augroup end

" Wilder autocommand and setup
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

" OPTIONS {{{
" Terminal title
let &titlestring = "nvim " . expand("%:t")
set title

" Use document modeline
set modeline

" Vimstay/auto-session option to restore session
set viewoptions=cursor,folds,slash,unix
set sessionoptions+=options,resize,winpos,terminal

" Visual settings
set cursorline
set hidden
set noshowmode
set showcmd
set lazyredraw
set termguicolors

" Folding
set foldmethod=indent
set nofoldenable

" Editing
set wrap
set formatoptions-=cro
set wrapmargin=0
set textwidth=0
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
set fillchars=eob:\ ,vert:│
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,eol:¶,trail:·

" Nvim-compe completion
set completeopt=menuone,noselect

" No-obnoxious nvim
set shortmess+=Ssatqc

" Huh I don't know if this should be here
set path+=**

" Detect extraneous filetype
filetype plugin on
" }}}

" MAPPINGS {{{
" Set leaders
let mapleader = ",."
let maplocalleader = ",.."

" Type comma easily
inoremap ,, ,

" append a letter before or after then return to normal mode
nnoremap <silent> s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <silent> S :exec "normal a".nr2char(getchar())."\e"<CR>

" Better indentation
xnoremap < <gv
xnoremap > >gv

" Access command with space
nnoremap <space> :

" Move lines {{{
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv
" }}}

" New line above/below in normal mode
nmap     mo o<esc>
nmap     mO O<esc>

" Unbind arrow keys in normal mode {{{
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>
" }}}

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"

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

" Vimwiki todo toggle
nmap <C-O> <Plug>VimwikiToggleListItem

" Leader b {{{
" Goto dashboard
nnoremap <silent> <Leader>b  :Dashboard<CR>
"}}}

" Leader c {{{
" Toggle colour highlighting
nnoremap <silent> <Leader>ch  :HexokinaseToggle<CR>
" }}}

" Leader f {{{
" Fzflua
nnoremap <silent> <Leader>ff              :FzfLua files<CR>
nnoremap <silent> <Leader>fgc             :FzfLua git_commits<CR>
nnoremap <silent> <Leader>fgb             :FzfLua git_bbcommits<CR>
nnoremap <silent> <Leader>fgs             :FzfLua git_status<CR>
nnoremap <silent> <Leader>fgf             :FzfLua git_files<CR>
nnoremap <silent> <Leader>fb              :FzfLua buffers<CR>
nnoremap <silent> <Leader>fh              :FzfLua oldfiles<CR>
nnoremap <silent> <Leader>f<space><space> :FzfLua commands<CR>
nnoremap <silent> <Leader>f<space>h       :FzfLua command_history<CR>
nnoremap <silent> <Leader>f/              :FzfLua search_history<CR>
nnoremap <silent> <Leader>f"              :FzfLua registers<CR>
nnoremap <silent> <leader>f'              :FzfLua marks<CR>
nnoremap <silent> <leader>fcs             :FzfLua colorschemes<CR>
nnoremap <silent> <leader>fz=             :FzfLua spell_suggest<CR>
nnoremap <silent> <leader>f,              :FzfLua keymaps<CR>
nnoremap <silent> <leader>fzz             :FzfLua live_grep<CR>
nnoremap <silent> <leader>fy              :FzfLua grep<CR>
nnoremap <silent> <leader>ftc             :FzfLua grep_curbuf<CR>
nnoremap <silent> <leader>ftw             :FzfLua grep_cword<CR>
nnoremap <silent> <leader>ftv             :FzfLua grep_visual<CR>
nnoremap <silent> <leader>ftl             :FzfLua grep_last<CR>
nnoremap <silent> <leader>fmp             :FzfLua man_pages<CR>
" Fzflua LSP
nnoremap <silent> <leader>flr             :FzfLua lsp_references<CR>
nnoremap <silent> <leader>fld             :FzfLua lsp_definitions<CR>
nnoremap <silent> <leader>flD             :FzfLua lsp_declarations<CR>
nnoremap <silent> <leader>flt             :FzfLua lsp_typedefs<CR>
nnoremap <silent> <leader>fli             :FzfLua lsp_implementations<CR>
nnoremap <silent> <leader>flq             :FzfLua lsp_document_diagnostics<CR>
" }}}

" Leader i {{{
" Indent line toggle
nnoremap <silent> <Leader>il  :IndentBlanklineToggle<CR>
" }}}

" Leader l  {{{
" Toggle listchars
nnoremap <silent> <Leader>ll  :set list!<CR>
" }}}

" Leader o {{{
nnoremap <Leader>oo :SymbolsOutline<CR>
" }}}

" Leader p {{{
" Enter paste mode
nnoremap <silent> <Leader>pt  :set paste!<CR> <bar> :echo "PASTE MODE TOGGLE" <CR>
nnoremap <silent> <Leader>ps  :PackerStatus <CR>
nnoremap <silent> <Leader>pi  :wa <CR> <bar> :so % <CR> <bar> :PackerCompile <CR> <bar> :PackerInstall <CR> <bar> :echo "Recompiled Packer" <CR>
" }}}

" Leader n {{{
" Disasble search highlighting
nnoremap <silent> <Leader>nh  :noh <CR>
" Set number/relativenumber
nnoremap <silent> <Leader>nr  :set relativenumber!<CR>
nnoremap <silent> <Leader>nn  :set number!<CR> <bar> :set norelativenumber<CR>
" }}}

" Leader r {{{
" Restore session
nnoremap <silent> <leader>rr :SessionLoad<CR>
nnoremap <silent> <leader>rs :SessionSave<CR>
" }}}

" Leader s {{{
" New split
nnoremap <silent> <Leader>spv :vs<CR>
nnoremap <silent> <Leader>sph :sp<CR>
" Source nvim config
nnoremap <silent> <Leader>sv  :source $MYVIMRC<CR>
" Set spell
nnoremap <silent> <Leader>sh  :setlocal spell! spelllang=en_gb<CR>
" Change conceal level on the fly
nnoremap <silent> <Leader>sco :set conceallevel=0<CR>
nnoremap <silent> <Leader>sci :set conceallevel=2<CR>
" }}}

" Leader t {{{
" New tab
nnoremap <silent> <Leader>tn  :tabnew<CR>
" Treesitter toggles
nnoremap <silent> <Leader>tsr :TSBufToggle rainbow<CR>
nnoremap <silent> <Leader>tsh :TSBufToggle highlight<CR>
" }}}

" Leader u {{{
" Undotree toggle
nnoremap <silent> <Leader>ut :UndotreeToggle<CR>
" }}}

" Leader v {{{
nnoremap <silent> <Leader>vt :Vista!! <CR>
nnoremap <silent> <Leader>vs :Vista focus <CR>
" }}}

" Leader w {{{
" Delete whitespace
" Delete whitespace
nnoremap <silent> <leader>wp  :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" Vimwiki generate links
nnoremap <silent> <Leader>wa :VimwikiGenerateLinks<CR>
" }}}

" Leader z {{{
" Zenmode toggle
nnoremap <silent> <Leader>zm :ZenMode<CR>
" Vim-zettel new document
nnoremap <silent> <Leader>zn :ZettelNew
" }}}

" Leader space {{{
" switch between prev/next buffer
nnoremap <silent> <Leader><space> <C-^>
" }}}

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

" Compe atocompletion and navigation {{{
lua << EOF
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
EOF

" Popup menu scroll {{{
function! s:s(delta) abort
if pumvisible()
  let l:i = complete_info(['selected']).selected
  call timer_start(0, { -> nvim_select_popupmenu_item(l:i + a:delta, v:true, v:false, {}) })
endif
return "\<Ignore>"
endfunction
" }}}
inoremap <silent><expr><C-j>     <SID>s(+4)
inoremap <silent><expr><C-k>     <SID>s(-4)
" }}}
" }}}

" DASHBOARD ASCII {{{
" NEOVIM {{{
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
" }}}
