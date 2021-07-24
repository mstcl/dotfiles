"+-----------------------------------+
"|  _       _ _         _            |
"| (_)_ __ (_) |___   _(_)_ __ ___   |
"| | | '_ \| | __\ \ / / | '_ ` _ \  |
"| | | | | | | |_ \ V /| | | | | | | |
"| |_|_| |_|_|\__(_)_/ |_|_| |_| |_| |
"|                                   |
"+-----------------------------------+

"---PLUGINS---
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'glepnir/dashboard-nvim'
    Plug 'gauteh/vim-cppman'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'sirver/ultisnips'
    Plug 'bfrg/vim-cpp-modern'
    Plug 'puremourning/vimspector', {
        \ 'do': 'python3 install_gadget.py --enable-vscode-cpptools'
        \ }
    Plug 'luochen1990/rainbow'
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
    "Plug 'mhinz/vim-startify'
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
    Plug 'hrsh7th/nvim-compe'
call plug#end()

"---GENERAL AUTOCOMMANDS---
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | set filetype=sh | endif
autocmd BufReadPost *.rasi set filetype=css
function! ShowTrailingWhitespace()
    if &ft == 'dashboard'
        return
    endif
    highlight RedundantSpaces ctermbg=red guibg=red
    match RedundantSpaces /\s\+$/
endfunction
autocmd BufWritePre * call ShowTrailingWhitespace()

"---GENERAL OPTIONS---
set omnifunc=syntaxcomplete#Complete
filetype plugin on
syntax on
set wrap
set termguicolors
set linebreak
set nocompatible
set nonumber
set mouse=a
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set ignorecase
set incsearch
set smartcase
set complete+=kspell
set scrolloff=1
set sidescrolloff=5
set history=1000
set wrapmargin=0
set textwidth=0
set spell spelllang=en_gb
set nospell
set encoding=utf-8
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
set list
set listchars=tab:›\ ,eol:¬
set completeopt=menuone,noselect

"---GENERAL BINDINGS---
let mapleader = ","
let maplocalleader = ",,"

nnoremap <space> :
inoremap <Leader>; <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>sh :setlocal spell! spelllang=en_gb<CR>
nnoremap <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>to :tabe <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>sp :split <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <Leader>nn :set invnumber<CR>
nnoremap <Leader>nt :tabnew<CR>
nnoremap <Leader>rr :registers<CR>
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>sc :set conceallevel=0<CR>
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap pa O<esc>"0p
nnoremap pb o<esc>"0p
nnoremap <Leader>ww :match RedundantSpaces /\s\+$/<CR>

"---COLORSCHEME---
colorscheme psycho


"---DASHBOARD---
let g:dashboard_default_executive='fzf'
let g:dashboard_fzf_engine='ag'
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC c n',
\ 'change_colorscheme' : 'SPC t c',
\ 'find_word'          : 'SPC f a',
\ 'book_marks'         : 'SPC f b',
\ }
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
let g:dashboard_custom_header = [
\ '                                                       ',
\ '                                                       ',
\ '                                                       ',
\ '                                                       ',
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\ '                                                       ',
\ '                                                       ',
\ '                                                       ',
\ '                                                       ',
\]
nnoremap <Leader>ss :<C-u>SessionSave<CR>
nnoremap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

"---LSPCONFIG---
lua << EOF
    require'lspconfig'.clangd.setup{}
    require'lspconfig'.pyright.setup{}
EOF
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'H', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<Leader>ba', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>br', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>bl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<Leader>bd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>br', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<Leader>bc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<Leader>dl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<Leader>dq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<Leader>bf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end
local servers = { "clangd", "pyright" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
        debounce_text_changes = 150,
        }
    }
end
EOF

"---TREESITTER---
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed= {"python","json","scss","html","cpp","css"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
}
EOF

"---AUTOPAIRS---
let g:AutoPairsShortcutFastWrap = '<C-s>'
autocmd Filetype vimwiki let b:AutoPairs = AutoPairsDefine({'**':'**','*':'*','_':'_','(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','~~':'~~', '++':'++'})
autocmd Filetype markdown let b:AutoPairs = AutoPairsDefine({'**':'**','*':'*','_':'_','(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','~~':'~~'})

"---ULTISNIPS---
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<leader>ul'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/utilsnips"]
inoremap <c-x><c-k> <c-x><c-k>

"---INDENTLINE---
let g:indentLine_fileTypeExclude = ['startify', 'nerdtree', 'NvimTree', 'man', 'Scratch', 'help', 'vimwiki', 'dashboard']
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '│'
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceChar = '·'

nnoremap <F9> :LeadingSpaceToggle<CR>

"---STARTIFY---
let g:startify_custom_header =
    \ 'startify#center(startify#fortune#cowsay())'

"---WEBDEVICONS---
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable = 1

"---VIMWIKI---
let g:vimwiki_list = [{
    \'path': '$HOME/wiki/docs',
    \'ext':'.md',
    \'syntax':'markdown',
    \'path_html': '$HOME/vimwiki.old/site_html/',
    \'template_path': '$HOME/vimwiki.old/templates',
    \'template_default': 'def_template',
    \'template_ext': '.html',
\}]
let g:vimwiki_key_mappings = {
    \ 'table_mappings': 0,
\}
let g:vimwiki_use_mouse = 1
let g:vimwiki_folding = 'expr:quick'
let g:vimwiki_auto_chdir = 1
let g:vimwiki_toc_header = 'contents'
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
autocmd InsertEnter *.{vimwiki,wiki,md} set conceallevel=0
autocmd InsertLeave *.{vimwiki,wiki,md} set conceallevel=2
nnoremap <Leader>wa :VimwikiGenerateLinks<CR>
nmap <C-O> <Plug>VimwikiToggleListItem
inoremap <s-CR> <ESC>:VimwikiReturn 1 5<CR>
let g:vimwiki_listsyms = '    X'
let g:vimwiki_listsym_rejected = ' '
let g:vimwiki_hl_headers = 1
let g:vimwiki_links_header = 'index'
let g:vimwiki_tags_header = 'tags'

"---TAGBAR---
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
nnoremap <F8> :TagbarToggle<CR>

"---VIMZETTEL---
let g:zettel_format = "%raw_title"
let g:zettel_backlinks_title = "backlinks"
let g:zettel_options = [{"template":"/home/lckdscl/wiki/docs/templates/md.tpl", "front_matter": [["tags",""]]}]
nnoremap <Leader>zo :ZettelOpen<CR>
nnoremap <Leader>zb :ZettelBackLinks<CR>

"---FZF---
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
let g:nv_search_paths = ['~/.config']
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
nnoremap <Leader>ff :FZF<CR>
nnoremap <Leader>fg :BCommits<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fc :Commands<CR>
nnoremap <Leader>fw :Windows<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>fb :Marks<CR>
nnoremap <leader>tc :Colors<CR>

"---COMPE---
lua << EOF
require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = true;
        ultisnips = true;
        nvim_lsp = true;
        ultisnip = true;
        calc = true;
        buffer = true;
  };
}
vim.api.nvim_set_keymap("i", "<c-Space>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
EOF
"inoremap <silent><expr> <C-h> compe#complete()
"inoremap <silent><expr> <C-e> compe#close('<C-e>')
"inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
"inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

"---JUPYTEXT---
let g:jupytext_fmt = 'py:percent'

"---RAINBOW---
let g:rainbow_active = 0
let g:rainbow_conf = {
    \'separately': {
        \'nerdtree': 0,
    \}
\}
nnoremap <F6> :RainbowToggle<CR>

"---COLORIZER---
let g:colorizer_auto_color = 1
lua require'colorizer'.setup()

"---GOYO---
function! s:goyo_enter()
    Limelight
    LeadingSpaceDisable
    NvimTreeClose
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction
function! s:goyo_leave()
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

"---AIRLINE---
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

"---NVIMTREE---
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

"---VIMSPECTOR---
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
