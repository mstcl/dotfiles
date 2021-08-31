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
" Require plugins.lua {{{
" lua require('impatient')
lua require('plugins')
" }}}
" Remove these built-in plugins {{{
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
" }}}
" AUTO-COMMANDS {{{
" Open a file where it was left off {{{
if has("autocmd")
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
" }}}
" Stop autocommenting! {{{
autocmd BufEnter * setlocal formatoptions-=cro
" }}}
" Close Outline if it's the only window left {{{
autocmd BufEnter * if (winnr("$") == 1 && &filetype =~# 'Outline') | q | endif
" }}}
" Highlight yanked {{{
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{"IncSearch", 1000}
augroup END
" }}}
" Rasi extension is css-based {{{
autocmd BufReadPost *.rasi set filetype=css
" }}}
" Jupyter Notebook {{{
autocmd BufReadPost *.ipynb set filetype=python
" }}}
" Autosource init.vim upon saving {{{
autocmd! BufWritePost $MYVIMRC,nvim-init.vim nested source $MYVIMRC | set foldmethod=marker | echo "Reloaded neovim"
" }}}
" Markdown options {{{
augroup MDoptions
    autocmd!
    autocmd BufNewFile,BufRead *.md set nolist
    autocmd BufNewFile,BufRead *.md nnoremap <silent> <buffer> <C-K> :execute 'syn region markdownStrike matchgroup=markdownStrikeDelimiter start="\%(\~\~\)" end="\%(\~\~\)"' . ' concealends'<CR>
augroup END
" }}}
" Tex options {{{
augroup TEXoptions
    autocmd!
    autocmd BufNewFile,BufRead *.tex set nolist | setlocal spell
augroup END
" }}}
" Enable indent-blankline for some filetypes only {{{
augroup IndentFT
    autocmd!
    autocmd BufNewFile,BufRead *.{vim,tex,python,lua,cpp,css,sh,ini,conf,html,json,toml,yaml,xml,cfg,dosini} silent! IndentBlanklineEnable
    autocmd BufNewFile,BufRead *.{vim,tex,python,lua,cpp,css,sh,ini,conf,html,json,toml,yaml,xml,cfg,dosini} nnoremap <silent> zA zA:IndentBlanklineRefresh<CR> | nnoremap <silent> za za:IndentBlanklineRefresh<CR> | nnoremap <silent> zm zm:IndentBlanklineRefresh<CR> | nnoremap <silent> zM zM:IndentBlanklineRefresh<CR> | nnoremap <silent> zc zc:IndentBlanklineRefresh<CR> | nnoremap <silent> zC zC:IndentBlanklineRefresh<CR> | nnoremap <silent> zr zr:IndentBlanklineRefresh<CR> | nnoremap <silent> zR zR:IndentBlanklineRefresh<CR>
augroup end
" }}}
" Autochdir {{{
autocmd BufEnter * silent! lcd %:p:h
" }}}
" Terminal no number {{{
autocmd Filetype floaterm set nonumber | set norelativenumber
" }}}
" Highlight current matched search {{{
augroup procsearch
  autocmd!
  au CmdLineLeave * let b:cmdtype = expand('<afile>') | if (b:cmdtype == '/' || b:cmdtype == '?') | call timer_start(200, 'ProcessSearch') | endif
augroup END
function! ProcessSearch(timerid)
    let l:patt = '\%#' . @/
    if &ic | let l:patt = '\c' . l:patt | endif
    exe 'match IncSearch /' . l:patt . '/'
endfunc
" }}}
" Insert only settings {{{
" autocmd InsertLeave,WinEnter * set cursorline
" autocmd InsertEnter,WinLeave * set nocursorline
" }}}
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
" Terminal title {{{
let &titlestring = "nvim " ". expand("%:t")
set title
" }}}
" Use document modeline {{{
set modeline
" }}}
" Visual settings {{{
set cursorline
set hidden
set noshowmode
set showcmd
set lazyredraw
set conceallevel=2
set termguicolors
set showtabline=2
set laststatus=2
set noruler
" }}}
" Folding {{{
set foldmethod=indent
set nofoldenable
set foldcolumn=4
" }}}
" Editing {{{
set wrap
set wrapmargin=0
set textwidth=0
set formatoptions-=cro
set linebreak
set mouse=a
" }}}
" Use lua syntax in lua codeblock {{{
let g:vimsyn_embed='l'
" }}}
" Latex syntax {{{
let g:tex_flavor="latex"
let g:tex_fold_enabled=1
let g:tex_conceal="abdgms"
" }}}
" Keep undo history {{{
set undofile
" }}}
" Number {{{
set number
set relativenumber
" }}}
" Change default split {{{
set splitbelow
set splitright
" }}}
" Typing {{{
set timeoutlen=400
set ttimeout
set ttimeoutlen=10
" }}}
" Search options {{{
set hlsearch
set ignorecase
set incsearch
set smartcase
" }}}
" Indentation {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
" }}}
" Normal backspace {{{
set backspace=indent,eol,start
" }}}
" Systemwide clipboard {{{
set clipboard=unnamedplus
" }}}
" Scrolloff {{{
set sidescrolloff=5
set scrolloff=1
" }}}
" Set history {{{
set history=1000
" }}}
" Spelling {{{
set spell spelllang=en_gb
set nospell
set encoding=utf-8
" }}}
" Funky characters {{{
set fillchars+=eob:\ ,vert:│,foldopen:▾,foldclose:▸,foldsep:│,fold:\ ,diff:╱
set list
set listchars=tab:»·,extends:›,precedes:‹,nbsp:∩,eol:¶,trail:·
set showbreak=↳
" }}}
" Nvim-compe completion {{{
set completeopt=menuone,noselect
" }}}
" No-obnoxious nvim {{{
set shortmess+=OoSsatqc
" }}}
" Huh I don't know if this should be here {{{
set path+=**
" }}}
" Detect other filetypes {{{
filetype plugin on
" }}}
" }}}
" MAPPINGS {{{
" GENERAL {{{
" Set leaders {{{
let mapleader = ","
let maplocalleader = ",."
" }}}
" Toggle relativenumber {{{
nnoremap <silent> <C-N>  :set relativenumber!<CR>
" }}}
" Center search results {{{
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" }}}
" Type comma easily {{{
inoremap ,, ,
" }}}
" Toggle paste mode {{{
set pastetoggle=<F2>
function! ShowPaste()
    if &paste
        set showmode
    else
        set noshowmode
    endif
endfunction
autocmd InsertLeave,InsertEnter * call ShowPaste()
" }}}
" Floaterm {{{
nnoremap <silent> <F1>  :FloatermNew<CR>
tnoremap <silent> <F1>  <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F2>  :FloatermPrev<CR>
tnoremap <silent> <F2>  <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <F3>  :FloatermNext<CR>
tnoremap <silent> <F3>  <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <F4>  :FloatermToggle<CR>
tnoremap <silent> <F4>  <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <F10> :FloatermKill<CR>
tnoremap <silent> <F10> <C-\><C-n>:FloatermKill<CR>
vnoremap <silent> <F8>  :'<,'>FloatermSend<CR>
nnoremap <silent> <F5>  :FloatermNew --width=0.5 --wintype=vsplit --name=repl --position=botright ipython3<CR>
" }}}
" Better indentation {{{
xnoremap < <gv
xnoremap > >gv
" }}}
" Access command with space {{{
nnoremap <space> :
vnoremap <space> :
" }}}
" Move lines {{{
vnoremap <silent> <A-j> :m '>+1<cr>gv=gv
vnoremap <silent> <A-k> :m '<-2<cr>gv=gv
nnoremap <silent> <A-j> :<c-u>execute 'move +'. v:count1<cr>
nnoremap <silent> <A-k> :<c-u>execute 'move -1-'. v:count1<cr>
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
" }}}
" New line(s) above/below in normal mode {{{
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" }}}
" Unbind arrow keys in normal mode {{{
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>
" }}}
" Compe atocompletion and navigation {{{
lua << EOF
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
EOF
" }}}
" Easy align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
" Move between hunk {{{s
nnoremap ]p :Gitsigns next_hunk<CR>
nnoremap [p :Gitsigns prev_hunk<CR>
" }}}
" Barbar buffer motions {{{
" Move to previous/next
nnoremap <silent>    <Left>    :BufferPrevious<CR>
nnoremap <silent>    <Right>   :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<>     :BufferMovePrevious<CR>
nnoremap <silent>    <A->>     :BufferMoveNext<CR>
" Goto buffer in position
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
" Leader e (empty) {{{

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
" Leader j (empty) {{{

" }}}
" Leader k {{{
nnoremap <silent> <Leader>k :Telescope zoxide list<CR>
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
" Telescope pickers
nnoremap <silent> <leader>n  :Telescope builtin<CR>
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
" }}}
" Leader r (empty) {{{
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
" Disable search highlighting, update diffs and redraw the screen (from vim-galore)
nnoremap <silent> <Leader>\  :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" Telescope grep
nnoremap <silent> <leader>/  :Telescope live_grep<CR>
" }}}
" Leader semicolon {{{
nnoremap <silent> <Leader>;  :Telescope keymaps<CR>
" }}}
" Leader apostrophe {{{
nnoremap <silent> <Leader>'  :Telescope registers<CR>
" }}}
" }}}
" LOCAL LEADER {{{
" Telescope LSP {{{
nnoremap <silent> <LocalLeader>d :Telescope lsp_definitions<CR>
nnoremap <silent> <LocalLeader>q :Telescope lsp_document_diagnostics<CR>
nnoremap <silent> <LocalLeader>r :Telescope lsp_references<CR>
" }}}
" Toggle python3 {{{
nnoremap <silent> <Leader>j  :<CR>i
" }}}
" }}}
" }}}
" DASHBOARD ASCII {{{
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
" }}}
