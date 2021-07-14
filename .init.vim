"------------------------------------------------------"
"-----------------------PLUGINS------------------------"
"------------------------------------------------------"
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'bfrg/vim-cpp-modern'
Plug 'bfrg/vim-cpp-modern'
Plug 'puremourning/vimspector', {
    \ 'do': 'python3 install_gadget.py --enable-vscode-cpptools'
    \ }
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/indentpython.vim'
Plug 'jupyter-vim/jupyter-vim'
Plug 'yggdroot/indentline'
Plug 'vimwiki/vimwiki'
Plug 'preservim/tagbar'
Plug 'junegunn/goyo.vim'
Plug 'vim-python/python-syntax'
Plug 'tmhedberg/SimpylFold'
Plug 'junegunn/limelight.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'michal-h21/vim-zettel'
Plug 'goerz/jupytext.vim'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'dylanaraps/wal.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'deviantfero/wpgtk.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()


"------------------------------------------------------"
"-----------------------GENERAL------------------------"
"------------------------------------------------------"
set nocompatible
filetype plugin on
syntax on
syntax enable
set wrap
set termguicolors
set linebreak
set nonumber
set mouse=a
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set ignorecase
set incsearch
set smartcase
set complete+=kspell
set encoding=utf-8
set scrolloff=1
set sidescrolloff=5
set history=1000
set softtabstop=4
set textwidth=79
set encoding=utf-8
set wrapmargin=0
set textwidth=0
set spell spelllang=en_gb
set nospell
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
set list
set listchars=tab:›\ ,eol:¬

let mapleader = ","
let maplocalleader = ",,"

nnoremap ; :
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <space> za
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>sc :setlocal spell! spelllang=en_gb<CR>
nmap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nmap <Leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>
nmap <Leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>nn :set invnumber<CR>
nnoremap <Leader>nt :tabnew<CR>
nnoremap <Leader>rr :registers<CR>
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"-----------------------------------------------------"
"-----------------------SYNTAX------------------------"
"-----------------------------------------------------"
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | set filetype=sh | endif
autocmd BufReadPost *.rasi set filetype=css


"----------------------------------------------------------"
"-----------------------COLORSCHEME------------------------"
"----------------------------------------------------------"
colorscheme maniac
"highlight EndOfBuffer ctermfg=black ctermbg=black
"hi NonText guifg=bg
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/


"-----------------------INDENTLINE------------------------"
let g:indentLine_fileTypeExclude = ['startify', 'nerdtree', 'NvimTree']
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '│'
let g:indentLine_enabled = 0
"let g:indentLine_setConceal = 0
let g:indentLine_leadingSpaceChar = '.'

nnoremap <F9> :LeadingSpaceToggle<CR>


"-------------------------------------------------------"
"-----------------------STARTIFY------------------------"
"-------------------------------------------------------"
let g:startify_custom_header =
    \ 'startify#center(startify#fortune#cowsay())'


"------------------------------------------------------"
"-----------------------DEVICON------------------------"
"------------------------------------------------------"
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable = 1


"------------------------------------------------------"
"-----------------------VIMWIKI------------------------"
"------------------------------------------------------"
let g:vimwiki_list = [{
    \'path': '~/vimwiki',
    \'auto_tags':1,
    \'auto_toc':1,
    \'path_html': '~/vimwiki/site_html/',
    \'template_path': '~/vimwiki/templates',
    \'template_default': 'def_template',
    \'template_ext': '.html'
\}]
let g:vimwiki_use_mouse = 1
let g:vimwiki_folding = 'syntax'
let g:vimwiki_auto_chdir = 1

let g:tagbar_type_vimwiki = {
    \'ctagstype':'vimwiki',
    \'kinds':['h:header'],
    \'sro':'&&&',
    \'kind2scope':{'h':' '},
    \'scope2kind':{'header':'h'},
    \'sort':0,
    \'ctagsbin': 'python3',
    \'ctagsargs': '~/scripts/vim/vwtags.py default'
\}

let g:zettel_format = "%raw_title"
let g:zettel_backlinks_title = "backlinks"

nmap <C-O> <Plug>VimwikiToggleListItem
nnoremap <Leader>zo :ZettelOpen<CR>
nnoremap <Leader>wa :VimwikiAll2HTML<CR>
nnoremap <Leader>zb :ZettelBackLinks<CR>


"--------------------------------------------------"
"-----------------------FZF------------------------"
"--------------------------------------------------"
let g:fzf_layout = {'window': 'enew'}
let g:nv_search_paths = ['~/.config']
let g:fzf_colors = {
    \'fg':         ['fg', 'Normal'],
    \'bg':         ['bg', 'Normal'],
    \'preview-bg': ['bg', 'Normal'],
    \'hl+':        ['fg', 'Statement'],
    \'info':       ['fg', 'PreProc'],
    \'prompt':     ['fg', 'Conditional'],
    \'pointer':    ['fg', 'Exception'],
    \'spinner':    ['fg', 'Label'],
    \'header':     ['fg', 'Comment']}

let g:jupytext_fmt = 'py:percent'

let g:nv_search_paths = ['~/.config']
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>g :GFiles?<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>c :Commands<CR>


"------------------------------------------------------"
"-----------------------RAINBOW------------------------"
"------------------------------------------------------"
let g:rainbow_active = 0
let g:rainbow_conf = {
    \'separately': {
        \'nerdtree': 0,
    \}
\}

nnoremap <F6> :RainbowToggle<CR>

"--------------------------------------------------------"
"-----------------------COLORIZER------------------------"
"--------------------------------------------------------"
let g:colorizer_auto_color = 1
lua require'colorizer'.setup()


"-----------------------------------------------------"
"-----------------------TAGBAR------------------------"
"-----------------------------------------------------"
nnoremap <F8> :TagbarToggle<CR>


"---------------------------------------------------"
"-----------------------GOYO------------------------"
"---------------------------------------------------"
function! s:goyo_enter()
    Limelight
    LeadingSpaceDisable
    NERDTreeClose
    let b:quitting = 0
let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
        qa
        endif
    endif
    Limelight!
    LeadingSpaceEnable
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>gg :Goyo<CR>
nnoremap <Leader>gx :Goyo!<CR>

"------------------------------------------------------"
"-----------------------AIRLINE------------------------"
"------------------------------------------------------"
let g:airline_statusline_ontop = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])
let g:airline_theme='gotcha'
let g:airline_section_c_only_filename = 1
let g:airline_mode_map = {
    \'__'     : '-',
    \'c'      : 'C',
    \'i'      : 'I',
    \'ic'     : 'I',
    \'ix'     : 'I',
    \'n'      : 'N',
    \'multi'  : 'M',
    \'ni'     : 'N',
    \'no'     : 'N',
    \'R'      : 'R',
    \'Rv'     : 'R',
    \'s'      : 'S',
    \'S'      : 'S',
    \''     : 'S',
    \'t'      : 'T',
    \'v'      : 'V',
    \'V'      : 'V',
    \''     : 'V',
\}
let g:airline_filetype_overrides = {
    \'startify': ['', ''],
    \'NvimTree': ['', ''],
    \'help': ['H', ''],
    \'vim-plug': ['P', ''],
    \'Tagbar': ['', ''],
\}

function! MyLineNumber()
    return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
        \substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction
call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})

function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', ' %{tabpagewinnr(tabpagenr())} ')
    return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')


"-------------------------------------------------------"
"-----------------------NVIMTREE------------------------"
"-------------------------------------------------------"
let g:nvim_tree_side = 'left'
let g:nvim_tree_width = '20%'
let g:nvim_tree_ignore = ['node_modules']
let g:nvim_tree_gitignore = 0
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_ignore_ft = ['startify', 'dashboard']
let g:nvim_tree_quit_on_open = 0
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 0
let g:nvim_tree_hide_dotfiles = 0
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_root_folder_modifier = ':~'
let g:nvim_tree_tab_open = 1
let g:nvim_tree_auto_resize = 1
let g:nvim_tree_disable_netrw = 0
let g:nvim_tree_hijack_netrw = 0
let g:nvim_tree_add_trailing = 0
let g:nvim_tree_group_empty = 0
let g:nvim_tree_lsp_diagnostics = 0
let g:nvim_tree_disable_window_picker = 0
let g:nvim_tree_hijack_cursor = 1
let g:nvim_tree_icon_padding = ' '
let g:nvim_tree_update_cwd = 1
let g:nvim_tree_window_picker_exclude = {
    \'filetype': [
        \'packer',
        \'qf'
    \],
    \'buftype': [
        \'terminal'
    \]
\}
let g:nvim_tree_special_files = {'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1}
let g:nvim_tree_show_icons = {
    \'git': 1,
    \'folders': 1,
    \'files': 1,
    \'folder_arrows': 1,
\}
let g:nvim_tree_icons = {
    \'default': '',
    \'symlink': '',
    \'git': {
        \'unstaged': "✗",
        \'staged': "✓",
        \'unmerged': "",
        \'renamed': "➜",
        \'untracked': "★",
        \'deleted': "",
        \'ignored': "◌"
    \},
    \'folder': {
        \'arrow_open': "",
        \'arrow_closed': "",
        \'default': "",
        \'open': "",
        \'empty': "",
        \'empty_open': "",
        \'symlink': "",
        \'symlink_open': "",
    \},
    \'lsp': {
        \'hint': "",
        \'info': "",
        \'warning': "",
        \'error': "",
    \}
\}

nnoremap <leader>ntr :NvimTreeRefresh<CR>
nnoremap <leader>ntf :NvimTreeFindFile<CR>
nnoremap <F7> :NvimTreeToggle<CR>


"-----------------------------------------------------"
"-----------------------CPPMAN------------------------"
"-----------------------------------------------------"
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()

au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>


"---------------------------------------------------------"
"-----------------------VIMSPECTOR------------------------"
"---------------------------------------------------------"
command! -nargs=+ Vfb call vimspector#AddFunctionBreakpoint(<f-args>)

nnoremap <localleader>gd :call vimspector#Launch()<cr>
nnoremap <localleader>gc :call vimspector#Continue()<cr>
nnoremap <localleader>gs :call vimspector#Stop()<cr>
nnoremap <localleader>gR :call vimspector#Restart()<cr>
nnoremap <localleader>gp :call vimspector#Pause()<cr>
nnoremap <localleader>gb :call vimspector#ToggleBreakpoint()<cr>
nnoremap <localleader>gB :call vimspector#ToggleConditionalBreakpoint()<cr>
nnoremap <localleader>gn :call vimspector#StepOver()<cr>
nnoremap <localleader>gi :call vimspector#StepInto()<cr>
nnoremap <localleader>go :call vimspector#StepOut()<cr>
nnoremap <localleader>gr :call vimspector#RunToCursor()<cr>
