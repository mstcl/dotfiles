" :.config/nvim/init.vim
" vim:set fdm=marker foldenable:
" PLUGINS {{{
" Require plugins.lua {{{
lua require('impatient')
lua require('plugins')
colorscheme marbles
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
    "matchit",
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
EOF
" }}}
" }}}
" COMMANDS {{{
" Wipe register {{{
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" }}}
" }}}
" AUTO-COMMANDS {{{
" Auto show line diagnostic {{{
augroup diagnostic
    autocmd!
    autocmd CursorHold,CursorHoldI *.{vim,tex,python,lua,cpp,sh,bash,md,bib,lua} lua vim.lsp.diagnostic.show_line_diagnostics({border = "single", focusable=false})
augroup END
" }}}
" Alpha options {{{
augroup alpha
    autocmd FileType alpha set showtabline=0 | set ft= | set nofoldenable | autocmd BufUnload <buffer> set showtabline=2
    autocmd WinEnter,BufRead,BufNewFile * if &ft != 'alpha' | call CleanEmptyBuffers() | endif
augroup END
function! CleanEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        exe 'bw ' . join(buffers, ' ')
    endif
endfunction
" }}}
" Open a file where it was left off {{{
augroup stay
    autocmd!
    if has("autocmd")
        autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                    \| exe "normal! g'\"" | endif
    endif
augroup END
" }}}
" Stop autocommenting! {{{
augroup editing
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=cro
augroup END
" }}}
" Close Outline if it's the only window left {{{
augroup Outline
    autocmd BufEnter * if (winnr("$") == 1 && &filetype =~# 'Outline') | q | endif
augroup END
" }}}
" Highlight yanked {{{
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{"IncSearch", 1000}
augroup END
" }}}
" Set filetypes {{{
augroup filetypes
    autocmd!
    " Rasi extension is css-based
    autocmd BufReadPost *.rasi set filetype=css
    " Jupyter Notebook
    autocmd BufReadPost *.ipynb set filetype=python
augroup END
" }}}
" Autosource init.vim upon saving {{{
augroup vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC,nvim-init.vim nested source $MYVIMRC | set foldmethod=marker | echo "Reloaded neovim"
augroup END
" }}}
" Markdown options {{{
augroup MDoptions
    autocmd!
    autocmd BufNewFile,BufRead *.md set nolist
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
    autocmd BufNewFile,BufRead *.{vim,tex,python,lua,cpp,css,sh,ini,conf,html,json,toml,zsh,bash,yaml,xml,cfg,dosini} silent! IndentBlanklineEnable
    autocmd BufNewFile,BufRead *.{vim,tex,python,lua,cpp,css,sh,ini,conf,html,json,toml,zsh,bash,yaml,xml,cfg,dosini} nnoremap <silent> zA zA:IndentBlanklineRefresh<CR> | nnoremap <silent> za za:IndentBlanklineRefresh<CR> | nnoremap <silent> zm zm:IndentBlanklineRefresh<CR> | nnoremap <silent> zM zM:IndentBlanklineRefresh<CR> | nnoremap <silent> zc zc:IndentBlanklineRefresh<CR> | nnoremap <silent> zC zC:IndentBlanklineRefresh<CR> | nnoremap <silent> zr zr:IndentBlanklineRefresh<CR> | nnoremap <silent> zR zR:IndentBlanklineRefresh<CR>
augroup end
" }}}
" Terminal no number {{{
augroup floaterm
    autocmd!
    autocmd Filetype floaterm set nonumber | set norelativenumber
augroup END
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
" }}}
" OPTIONS {{{
" Terminal title {{{
let &titlestring = "nvim " ". expand("%:t")
set title
" }}}
" Autochdir {{{
set autochdir
" }}}
" Update time for LSP {{{
set updatetime=180
" }}}
" Use document modeline {{{
set modeline
" }}}
" Visual settings {{{
set nocursorline
set synmaxcol=200
set hidden
set noshowmode
set noshowcmd
set lazyredraw
set ttyfast
set conceallevel=2
set termguicolors
set showtabline=2
set laststatus=2
set noruler
" }}}
" Folding {{{
set foldmethod=syntax
set foldminlines=1
set foldnestmax=6
set foldenable
set foldlevelstart=1
set foldcolumn=0
" }}}
" Editing {{{
set wrap
set scrolljump=1
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
set norelativenumber
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
" No swapfiles {{{
set noswapfile
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
" Toggle tree {{{
nnoremap <silent> <C-T>  :lua require'utils.tree_toggle'.toggle()<CR>
" }}}
" Toggle relativenumber {{{
nnoremap <silent> <C-N> :set relativenumber!<CR>
" }}}
" Toggle list {{{
nnoremap <silent> <C-L>  :set list!<CR>
" }}}
" Toggle cursorline {{{
nnoremap <silent> <C-J>  :setlocal cursorline!<CR>
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
" Move between hunks {{{
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
nnoremap <silent>    <A-t>     :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c>     :BufferClose<CR>
" Magic buffer-picking mode
nnoremap <silent>    <A-u>     :BufferPick<CR>
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
" Make split {{{
nnoremap <silent> <C-S>v :vs<CR>
nnoremap <silent> <C-S>h :sp<CR>
" }}}
" Clear search highlighting {{{
nnoremap <silent> <C-P>  :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
" }}}
" }}}
" }}}
" LEADER KEYS {{{
" Leader a: Toggle foldcolumn {{{
nnoremap <silent> <leader>a  :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif

endfunction
" }}}
" Leader b: Telescope buffers {{{
nnoremap <silent> <Leader>b  :Telescope buffers<CR>
" }}}
" Leader c: Toggle colour highlighting {{{
nnoremap <silent> <Leader>c  :ColorizerToggle<CR>
" }}}
" Leader d: Alpha screen {{{
nnoremap <silent> <Leader>d  :Alpha<CR>
"}}}
" Leader e: Focus tree {{{
nnoremap <silent> <Leader>e  :NvimTreeFocus<CR>
" }}}
" Leader f: Telescope find files {{{
nnoremap <silent> <Leader>f  :Telescope find_files<CR>
" }}}
" Leader g: Git commands {{{
nnoremap <silent> <Leader>gl :Gitsigns toggle_signs<CR>
nnoremap <silent> <Leader>gb :Telescope git_commits<CR>
nnoremap <silent> <Leader>gc :Telescope git_bcommits<CR>
nnoremap <silent> <Leader>gs :Telescope git_status<CR>
nnoremap <silent> <Leader>gh :Gitsigns preview_hunk<CR>
" }}}
" Leader h: Telescope history {{{
nnoremap <silent> <Leader>h  :Telescope oldfiles<CR>
" }}}
" Leader i: Indent blankline toggle {{{
nnoremap <silent> <Leader>i  :IndentBlanklineToggle<CR>
" }}}
" Leader j: Last telescope picker {{{
nnoremap <silent> <Leader>j  :Telescope resume<CR>
" }}}
" Leader k: Telescope chdir with oxide {{{
nnoremap <silent> <Leader>k :Telescope zoxide list<CR>
" }}}
" Leader l (empty)  {{{
" }}}
" Leader m: Telescope man pages {{{
nnoremap <silent> <leader>m  :Telescope man_pages<CR>
" }}}
" Leader n: Telescope pickers {{{
nnoremap <silent> <leader>n  :Telescope builtin<CR>
" }}}
" Leader o: Code outline {{{
nnoremap <silent> <Leader>o  :SymbolsOutline<CR>
" }}}
" Leader p: Packer commands {{{
nnoremap <silent> <Leader>ps :PackerStatus<CR>
nnoremap <silent> <Leader>pr :wa<CR> <bar> :source %<CR> <bar> :PackerCompile<CR> <bar> :PackerInstall<CR> <bar> :echo "Recompiled Packer"<CR>
nnoremap <silent> <Leader>pi :PackerInstall<CR>
nnoremap <silent> <Leader>pc :PackerCompile<CR>
" }}}
" Leader q: Telescope LSP {{{
nnoremap <silent> <Leader>qe  :Telescope lsp_definitions<CR>
nnoremap <silent> <Leader>qq  :Telescope lsp_document_diagnostics<CR>
nnoremap <silent> <Leader>qr  :Telescope lsp_references<CR>
nnoremap <silent> <Leader>qp  :Telescope lsp_implementations<CR>
nnoremap <silent> <Leader>qc  :Telescope lsp_code_actions<CR>
" }}}
" Leader r: Telesope registers {{{
nnoremap <silent> <Leader>r  :Telescope registers<CR>
" }}}
" Leader s: spells {{{
nnoremap <silent> <Leader>sp :setlocal spell! spelllang=en_gb<CR>
nnoremap <silent> <Leader>sf :Telescope spell_suggest<CR>
" }}}
" Leader t (empty) {{{
" }}}
" Leader u: Undo tree {{{
" Undotree toggle
nnoremap <silent> <Leader>u  :UndotreeToggle<CR>
" }}}
" Leader v: Treesitter toggles {{{
nnoremap <silent> <Leader>vr :TSBufToggle rainbow<CR>
nnoremap <silent> <Leader>vh :TSBufToggle highlight<CR>
" }}}
" Leader w: Delete whitespace {{{
nnoremap <silent> <leader>w  :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" }}}
" Leader y: Telescope browse files {{{
nnoremap <silent> <Leader>y  :Telescope file_browser<CR>
" }}}
" Leader z: Zenmod {{{
nnoremap <silent> <Leader>z  :ZenMode<CR>
" }}}
" Leader space: Switch buffers {{{
nnoremap <silent> <Leader><space> <C-^>
" }}}
" Leader slash: Telescope grep {{{
nnoremap <silent> <leader>/  :Telescope live_grep<CR>
" }}}
" Leader semicolon: Telescope keymaps {{{
nnoremap <silent> <Leader>;  :Telescope keymaps<CR>
" }}}
" }}}
" LOCAL LEADER {{{
" }}}
" }}}
