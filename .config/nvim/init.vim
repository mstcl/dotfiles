" :.config/nvim/init.vim
" vim:set fdm=marker foldenable:
" PLUGINS {{{
" Require plugins.lua {{{
lua require'impatient'
lua require'plugins'
set background=dark
colorscheme despair
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
" Reload snippets after editing {{{
augroup nvimcmp
    autocmd!
    autocmd BufWritePost *.snippets :CmpUltisnipsReloadSnippets
" }}}
" Alpha options {{{
augroup alpha
    autocmd!
    autocmd User AlphaReady set laststatus=0 | set showtabline=0 | set nofoldenable | autocmd BufUnload <buffer> set showtabline=2 | set laststatus=2
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
    if has('autocmd')
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
    autocmd!
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
    " .conf files
    autocmd BufReadPost *.conf set filetype=config
augroup END
" }}}
" Autosource init.vim upon saving {{{
augroup vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC,nvim-init.vim nested source $MYVIMRC | set foldmethod=marker | echo "Reloaded neovim"
augroup END
" }}}
" Markdown options {{{
function! MathAndLiquid()
    syn region math start=/\$\$/ end=/\$\$/
    syn match math_block '\$[^$].\{-}\$'
    syn match liquid '{%.*%}'
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    syn region highlight_block start='```' end='```'
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction
augroup MDoptions
    autocmd!
    autocmd BufNewFile,BufRead *.md set nolist | inoremap <silent> <C-L>  <c-g>u<Esc>[s1z=`]a<c-g>u
    autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
augroup END
" }}}
" Tex options {{{
augroup TEXoptions
    autocmd!
    autocmd BufNewFile,BufRead *.tex set nolist | setlocal spell | inoremap <silent> <C-L>  <c-g>u<Esc>[s1z=`]a<c-g>u
augroup END
" }}}
" Enable indent-blankline for some filetypes only {{{
augroup IndentFT
    autocmd!
    autocmd BufNewFile,BufRead *.{vim,ipynb,tex,py,lua,cpp,css,sh,ini,conf,html,json,toml,zsh,yaml,xml} silent! IndentBlanklineEnable
    autocmd BufNewFile,BufRead *.{vim,ipynb,tex,py,lua,cpp,css,sh,ini,conf,html,json,toml,zsh,yaml,xml} nnoremap <silent> zA zA:IndentBlanklineRefresh<CR> | nnoremap <silent> za za:IndentBlanklineRefresh<CR> | nnoremap <silent> zm zm:IndentBlanklineRefresh<CR> | nnoremap <silent> zM zM:IndentBlanklineRefresh<CR> | nnoremap <silent> zc zc:IndentBlanklineRefresh<CR> | nnoremap <silent> zC zC:IndentBlanklineRefresh<CR> | nnoremap <silent> zr zr:IndentBlanklineRefresh<CR> | nnoremap <silent> zR zR:IndentBlanklineRefresh<CR>
augroup END
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
    if &ignorecase | let l:patt = '\c' . l:patt | endif
    exe 'match IncSearch /' . l:patt . '/'
endfunc
" }}}
" Fold with treesitter {{{
augroup FoldTS
    autocmd!
    au BufNewFile,BufRead *.{vim,tex,py,lua,cpp,sh,toml} set foldmethod=expr | set foldexpr=nvim_treesitter#foldexpr()
augroup END
" }}}
" Telescope no prompt {{{
augroup TelescopeStuff
autocmd FileType TelescopePrompt lua require'cmp'.setup.buffer {
\   completion = { autocomplete = false }
\ }
augroup END
" }}}
" }}}
" OPTIONS {{{
" Terminal title {{{
let &titlestring = 'nvim ' ". expand("%:t")
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
set cursorline
set cursorlineopt=number
set synmaxcol=400
set colorcolumn=99999
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
let g:tex_flavor='latex'
let g:tex_fold_enabled=1
let g:tex_conceal='abdgms'
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
set listchars=tab:<->,extends:›,precedes:‹,nbsp:∩,eol:¶,trail:×,lead:\ ,space:·,multispace:···+
set showbreak=↳
" }}}
" Nvim-cmp completion {{{
set completeopt=menu,menuone,noselect
" }}}
" No-obnoxious nvim {{{
set shortmess+=OoSsatTcI
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
" FUNCTIONS {{{
" Toggle number {{{
function! SetNumber()
    if &number
        if &relativenumber
            setlocal nonumber
            setlocal norelativenumber
        else
            setlocal relativenumber
        endif
    else
        setlocal number
    endif
endfunction
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
augroup showpaste
    autocmd InsertLeave,InsertEnter * call ShowPaste()
augroup END
" }}}
" Idk what this is {{{
function! s:s(delta) abort
if pumvisible()
  let l:i = complete_info(['selected']).selected
  call timer_start(0, { -> nvim_select_popupmenu_item(l:i + a:delta, v:true, v:false, {}) })
endif
return "\<Ignore>"
endfunction
" }}}
" Delete whitespace {{{
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
" }}}
" Toggle foldcolumn {{{
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction
" }}}
" Toggle cmp {{{
function ToggleCmp()
    if g:cmp_toggle==v:true
        let g:cmp_toggle=v:false
    else
        let g:cmp_toggle=v:true
    endif
endfunction
" }}}
" }}}
