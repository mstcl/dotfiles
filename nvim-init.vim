" :.config/nvim/init.vim
" vim:set fdm=marker:
"+-----------------------------------+
"|  _       _ _         _            |
"| (_)_ __ (_) |___   _(_)_ __ ___   |
"| | | '_ \| | __\ \ / / | '_ ` _ \  |
"| | | | | | | |_ \ V /| | | | | | | |
"| |_|_| |_|_|\__(_)_/ |_|_| |_| |_| |
"|                                   |
"+-----------------------------------+

" SET PLUGINS {{{
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'rmagatti/auto-session'
    Plug 'folke/which-key.nvim'
    Plug 'mbbill/undotree'
    Plug 'Konfekt/FastFold'
    Plug 'lambdalisue/suda.vim'
    Plug 'glepnir/dashboard-nvim'
    Plug 'mattn/emmet-vim'
    Plug 'gauteh/vim-cppman'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'sirver/ultisnips'
    Plug 'puremourning/vimspector', {
        \ 'do': 'python3 install_gadget.py --enable-vscode-cpptools'
        \ }
    Plug 'jupyter-vim/jupyter-vim'
    Plug 'yggdroot/indentline'
    Plug 'vimwiki/vimwiki'
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/goyo.vim'
    Plug 'tmhedberg/SimpylFold'
    Plug 'junegunn/limelight.vim'
    Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }
    Plug 'tpope/vim-surround'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'michal-h21/vim-zettel'
    Plug 'goerz/jupytext.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-fugitive'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'machakann/vim-highlightedyank'
    Plug 'vifm/vifm.vim'
    Plug 'flazz/vim-colorschemes'
    Plug 'deviantfero/wpgtk.vim'
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'hrsh7th/nvim-compe'
    Plug 'zhimsel/vim-stay'
    Plug 'luochen1990/rainbow'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'liuchengxu/vista.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'junegunn/vim-easy-align'
    Plug 'psliwka/vim-smoothie'
    " Plug 'bfrg/vim-cpp-modern'
    " Plug 'b3nj5m1n/kommentary'
    " Plug 'norcalli/nvim-colorizer.lua'
    " Plug 'preservim/tagbar'
    " Plug 'vim-scripts/indentpython.vim'
    " Plug 'simrat39/symbols-outline.nvim'
    " Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    " Plug 'vim-python/python-syntax'
    " Plug 'junegunn/fzf.vim'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " Plug 'kyazdani42/nvim-tree.lua'
    " Plug 'dylanaraps/wal.vim'
    " Plug 'morhetz/gruvbox'
    " Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}

" GENERAL AUTOCOMMANDS {{{
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | set filetype=sh | endif
autocmd BufNewFile,BufReadPost *.md setlocal spell! spelllang=en_gb | highlight VimwikiDelText term=strikethrough cterm=strikethrough gui=strikethrough | highlight VimwikiCode guifg=lightblue
autocmd BufReadPost *.rasi set filetype=css
autocmd! BufWritePost $MYVIMRC,nvim-init.vim nested source $MYVIMRC | set foldmethod=marker | echo "Reloaded neovim"
autocmd Filetype dashboard set showtabline=0 | set laststatus=0 | set noruler | highlight RedundantSpaces ctermbg=none guibg=none
autocmd WinEnter,BufEnter * if &filetype != 'dashboard' | highlight RedundantSpaces ctermbg=red guibg=red | set showtabline=2 | set laststatus=2 | endif
autocmd FileType fzf set nonumber norelativenumber
" }}}

" GENERAL OPTIONS {{{
set omnifunc=syntaxcomplete#Complete
filetype plugin on
syntax on
set hidden
set showcmd
set path+=**
set timeoutlen=200
set wrap
set lazyredraw
set foldmethod=syntax
set foldenable
set noshowmode
set modeline
set termguicolors
set formatoptions-=cro
set linebreak
set nocompatible
set number
set mouse=a
set hlsearch
set relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set backspace=indent,eol,start
set autoindent
set ignorecase
set incsearch
set smartcase
set complete+=kspell
set scrolloff=1
set clipboard=unnamedplus
set sidescrolloff=5
set cursorline
set scrolloff=3
set history=1000
set wrapmargin=0
set textwidth=0
set spell spelllang=en_gb
set timeoutlen=500
set nospell
set encoding=utf-8
set fillchars=eob:\ ,vert:│
set nolist
set listchars=tab:›_,eol:¬,trail:·
set completeopt=menuone,noselect
set shortmess+=Ssatq
" }}}

" GENERAL BINDINGS {{{
let mapleader = ",."
let maplocalleader = ",.."
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <silent> <Leader>p :set paste!<CR>
nnoremap <Leader>ll :set list!<CR>
nnoremap <space> :
nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>
nnoremap <silent> <Leader>sh :setlocal spell! spelllang=en_gb<CR>
nnoremap <silent> <Leader>nr :set relativenumber!<CR>
nnoremap <silent> <Leader>nn :set number!<CR> <bar> :set norelativenumber<CR>
nnoremap <silent> <Leader>tn :tabnew<CR>
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <Leader>sco :set conceallevel=0<CR>
nnoremap <Leader>sci :set conceallevel=2<CR>
nmap mo o<esc>
nmap mO O<esc>
nnoremap <silent> <Leader>bn :bn<CR>
nnoremap <silent> <Leader>bd :bd<CR>
nnoremap <silent> <Leader>bp :bp<CR>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <silent> <Leader>nh :noh <CR>
inoremap ,, ,
" }}}

" COLORSCHEME {{{
colorscheme psycho
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/
" }}}

" VIFM {{{
let g:loaded_netrw = 1
let g:vifm_replace_netrw=1
nnoremap <Leader>ee :Vifm<CR>
nnoremap <Leader>et :TabVifm<CR>
nnoremap <Leader>esv :VsplitVifm<CR>
nnoremap <Leader>esh :SplitVifm<CR>
nnoremap <Leader>ed :DiffVifm<CR>
" }}}

" RAINBOW {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
    \'parentheses': ['start=/(/ end=/)/ fold','start=/\[/ end=/\]/ fold','start=/{/ end=/}/ fold','start=/\(\(\<operator\>\)\@<!<\)\&[a-zA-Z0-9_]\@<=<\ze[^<]/ end=/>/'],
    \'separately': {
        \'fzf': 0,
    \}
\}
" }}}

" TS-RAINBOW {{{
lua << EOF
    require'nvim-treesitter.configs'.setup {
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1400,
      }
    }
EOF
" }}}

" WHICH-KEY {{{
lua << EOF
    require("which-key").setup {
        plugins = {
            marks = true,
            registers = true,
            spelling = {
            enabled = false,
            suggestions = 20,
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = true,
                z = true,
                g = true,
                },
        },
        operators = {},
        key_labels = {
            ["<space>"] = "SPC",
            ["<cr>"] = "RET",
            ["<tab>"] = "TAB",
            },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
        },
        window = {
            border = "none",
            position = "top",
            margin = {0,0,0,0},
            padding = {1,0,1,0},
        },
        layout = {
            height = { min = 4, max = 25 },
            width = { min = 10, max = 50 },
            spacing = 2,
            align = "center",
        },
        ignore_missing = false,
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
        show_help = false,
        triggers = "auto",
        triggers_blacklist = {
            i = { "j", "k" },
            v = { "j", "k" },
        },
    }
EOF
"}}}

" VIM-STAY {{{
set viewoptions=cursor,folds,slash,unix
" }}}

" FASTFOLD {{{
nnoremap zuz <Plug>(FastFoldUpate)
let g:fastfold_savehook = 1
let g:fastfold_minlines = 400
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
" }}}

" DASHBOARD {{{
let g:dashboard_default_executive='fzf'
let g:dashboard_fzf_engine='ag'
" let g:dashboard_custom_section = {
    " \ 'last_session'       : 's l',
    " \ 'find_history'       : 'f h',
    " \ 'find_file'          : 'f f',
    " \ 'new_file'           : 'c n',
    " \ 'change_colorscheme' : 'f c',
    " \ 'find_word'          : 'f a',
    " \ 'book_marks'         : 'f b',
    " \'buffer_list': {
    "     \'description': [' Recently lase session                 SPC b b'],
    "     \'command': 'Some Command' or function('your funciton name')
    " \}
" \}
let g:dashboard_custom_section={
\ 'history_list': {
  \ 'description': [' History                 f h'],
  \ 'command': ':History<CR>' },
\ 'buffer_list': {
  \ 'description': ['﬘ Buffer                  f b'],
  \ 'command': ':Buffers<CR>' },
\ 'find_files': {
  \ 'description': [' Files                   f f'],
  \ 'command': ':Files<CR>' },
\ 'explorer': {
  \ 'description': [' Browse                  e e'],
  \ 'command': ':Vifm<CR>' }
\ }
" header {{{
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
nnoremap <silent> <Leader>db :highlight RedundantSpaces ctermbg=none guibg=none <CR> <bar> :Dashboard<CR>
" }}}
" }}}

" LSPCONFIG {{{
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
" }}}

" AUTOPAIRS {{{
let g:AutoPairsShortcutFastWrap = '<M-e>'
let g:AutoPairsMapBS = "1"
let g:AutoPairsShortcutToggle='<M-p>'
let g:AutoPairsShortcutJump='<M-n>'
let g:AutoPairsShortcutBackInsert='<M-b>'
let g:AutopairsMultilineBackspace = "1"
let g:AutoPairsMultilineClose = 1
let g:AutoPairs = autopairs#AutoPairsDefine([
    \{"open": '\w\zs<', "close": '>'},
    \{"open": "$", "close": "$", "filetype": "tex"},
    \{"open": '\\left(', 'close': '\right)', "filetype": "tex"},
    \{"open": '\\left(', 'close': '\right)', "filetype": "vimwiki"},
    \{"open": '\vclass .{-} (: (.{-}[ ,])+)? ?\{', 'close': '};', 'mapopen': '{', 'filetype': 'cpp'},
    \{"open": "*", "close": "*", "filetype": ["help"]},
    \{"open": "*", "close": "*", "filetype": ["vimwiki"]},
    \{"open": "**", "close": "**", "filetype": ["vimwiki"]},
    \{"open": "_", "close": "_", "filetype": ["vimwiki"]},
    \{"open": "~~", "close": "~~", "filetype": ["vimwiki"]},
    \{"open": "++", "close": "++", "filetype": ["vimwiki"]},
    \{"open": "|", "close": "|", "filetype": "help"}
\])
let g:AutoPairsFlyMode = "0"
nnoremap <Leader>ap :AutoPairsToggle<CR>
" }}}

" ULTISNIPS {{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<leader>ul'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/ultisnips"]
inoremap <c-x><c-k> <c-x><c-k>
" }}}

" INDENTLINE {{{
let g:indentLine_fileTypeExclude = ['FZF', 'Terminal', 'startify', 'nerdtree', 'NvimTree', 'man', 'Scratch', 'help', 'vimwiki', 'dashboard', 'WhichKey']
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceChar = '·'
autocmd TermOpen * IndentLinesDisable
nnoremap <Leader>il :IndentLinesToggle<CR>
" }}}

" STARTIFY (unused) {{{
" let g:startify_custom_header =
"     \ 'startify#center(startify#fortune#cowsay())'
"}}}

" WEBDEVICONS {{{
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable = 1
" }}}

" VIMWIKI {{{
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
let g:vimwiki_toc_header = 'Contents'
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
autocmd InsertEnter *.{vimwiki,wiki,md} set conceallevel=0
autocmd InsertLeave *.{vimwiki,wiki,md} set conceallevel=2
nnoremap <Leader>wa :VimwikiGenerateLinks<CR>
nmap <C-O> <Plug>VimwikiToggleListItem
inoremap <s-CR> <ESC>:VimwikiReturn 1 5<CR>
let g:vimwiki_listsyms = '    x'
let g:vimwiki_hl_headers = 1
let g:vimwiki_links_header = 'List of pages'
let g:vimwiki_links_header_level = 2
let g:vimwiki_tags_header = 'Tags'
" }}}

" TAGBAR (unused) {{{
" let g:tagbar_type_vimwiki = {
"     \'ctagstype':'vimwiki',
"     \'kinds':['h:header'],
"     \'sro':'&&&',
"     \'kind2scope':{'h':' '},
"     \'scope2kind':{'header':'h'},
"     \'sort':0,
"     \'ctagsbin': 'python3',
"     \'ctagsargs': '~/scripts/vim/vwtags.py default'
" \}
" nnoremap <leader>tb :TagbarToggle<CR>
" }}}

" VIMZETTEL {{{
let g:zettel_format = "%raw_title"
let g:zettel_options = [{"template":"/home/lckdscl/wiki/docs/templates/md.tpl", "front_matter": [["tags",""], ["hide","navigation"]]}]
let g:zettel_default_mappings = 0
augroup filetype_vimwiki
    autocmd!
    autocmd FileType vimwiki imap <silent> [[ [[<esc><Plug>ZettelSearchMap
    autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
    autocmd FileType vimwiki xmap zN <Plug>ZettelNewSelectedMap
    autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
   augroup END
nnoremap <Leader>zo :ZettelOpen<CR>
nnoremap <Leader>zb :ZettelBackLinks<CR>
nnoremap <Leader>zn :ZettelNew
" }}}

" FZF.VIM {{{
let g:fzf_layout = { 'window': 'enew' }
let g:nv_search_paths = ['~/']
nnoremap <Leader>ff :FZF<CR>
nnoremap <Leader>fg :BCommits<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fc :Commands<CR>
nnoremap <Leader>fw :Windows<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fa :Rg<CR>
nnoremap <leader>fp :Marks<CR>
nnoremap <leader>fc :Colors<CR>
" }}}

" COMPE {{{
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
" }}}

" JUPYTEXT {{{
let g:jupytext_fmt = 'py:percent'
" }}}

" COLORIZER (unused) {{{
" let g:colorizer_auto_color = 1
" lua require'colorizer'.setup()
" }}}

" GOYO {{{
function! s:goyo_enter()
    Limelight
    LeadingSpaceDisable
    set nolist
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
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
nnoremap <Leader>gg :Goyo<CR>
nnoremap <Leader>gx :Goyo!<CR>
" }}}

" AIRLINE {{{
let g:airline_statusline_ontop = 0
let g:airline_powerline_fonts = 1
let g:airline_disable_statusline = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#exclude_preview = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#keymap_ignored_filetypes =
        \ ['dashboard','vista']
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buf_label_first = 0
let g:airline#extensions#tabline#buffers_label = ''
let airline#extensions#tabline#middle_click_preserves_windows = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline_theme='gotcha'
let g:airline_section_c_only_filename = 1
let g:airline_stl_path_style = 'short'
let g:airline_highlighting_cache = 1
let g:airline_skip_empty_sections = 1
 " mode map {{{
let g:airline_mode_map = {
    \'__'     : '-',
    \'c'      : '',
    \'i'      : '',
    \'ic'     : 'IC',
    \'ix'     : 'IX',
    \'n'      : '',
    \'multi'  : 'M',
    \'ni'     : 'NI',
    \'no'     : 'NO',
    \'R'      : '',
    \'Rv'     : 'RV',
    \'s'      : 'S',
    \'S'      : 'S',
    \''     : 'S',
    \'t'      : 'T',
    \'v'      : '',
    \'V'      : '',
    \''     : ''
\}
" }}}
" filetype overrides {{{q
let g:airline_filetype_overrides = {
    \'help': ['', ''],
    \'vim-plug': ['', ''],
    \'Tagbar': ['', ''],
\}
" }}}
function! MyLineNumber()
    return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). '/'.
        \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction
call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})
let g:airline_section_z = airline#section#create([' ','linenr', 'colnr'])
let g:airline_symbols.colnr = '   '
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_se =''
let g:airline_symbols.whitespace = ''
let g:airline_symbols.dirty = ' '
let g:airline_symbols.branch = ''
let g:airline#extensions#whitespace#trailing_format = 'TR %s'
let g:airline#extensions#whitespace#mixed_indent_format =
 \ 'MI [%s]'
let g:airline#extensions#whitespace#long_format = 'LG %s'
let g:airline#extensions#whitespace#mixed_indent_file_format =
 \ 'MF [%s]'
let g:airline#extensions#whitespace#conflicts_format = 'CF %s'
let g:airline#extensions#scrollbar#enabled = 0
" }}}

" NVIMTREE (unused) {{{
" let g:nvim_tree_side = 'left'
" let g:nvim_tree_width = '20%'
" let g:nvim_tree_ignore = ['node_modules']
" let g:nvim_tree_gitignore = 0
" let g:nvim_tree_auto_open = 1
" let g:nvim_tree_auto_close = 1
" let g:nvim_tree_auto_ignore_ft = ['startify', 'dashboard']
" let g:nvim_tree_quit_on_open = 0
" let g:nvim_tree_follow = 1
" let g:nvim_tree_indent_markers = 0
" let g:nvim_tree_hide_dotfiles = 0
" let g:nvim_tree_git_hl = 1
" let g:nvim_tree_highlight_opened_files = 1
" let g:nvim_tree_root_folder_modifier = ':~'
" let g:nvim_tree_tab_open = 1
" let g:nvim_tree_auto_resize = 1
" let g:nvim_tree_disable_netrw = 0
" let g:nvim_tree_hijack_netrw = 0
" let g:nvim_tree_add_trailing = 0
" let g:nvim_tree_group_empty = 0
" let g:nvim_tree_lsp_diagnostics = 0
" let g:nvim_tree_disable_window_picker = 0
" let g:nvim_tree_hijack_cursor = 1
" let g:nvim_tree_icon_padding = ' '
" let g:nvim_tree_update_cwd = 1
" let g:nvim_tree_window_picker_exclude = {
"     \'filetype': [
"         \'packer',
"         \'qf'
"     \],
"     \'buftype': [
"         \'terminal'
"     \]
" \}
" let g:nvim_tree_special_files = {'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1}
" let g:nvim_tree_show_icons = {
"     \'git': 1,
"     \'folders': 1,
"     \'files': 1,
"     \'folder_arrows': 1,
" \}
" let g:nvim_tree_icons = {
"     \'default': '',
"     \'symlink': '',
"     \'git': {
"         \'unstaged': "✗",
"         \'staged': "✓",
"         \'unmerged': "",
"         \'renamed': "➜",
"         \'untracked': "★",
"         \'deleted': "",
"         \'ignored': "◌"
"     \},
"     \'folder': {
"         \'arrow_open': "",
"         \'arrow_closed': "",
"         \'default': "",
"         \'open': "",
"         \'empty': "",
"         \'empty_open': "",
"         \'symlink': "",
"         \'symlink_open': "",
"     \},
"     \'lsp': {
"         \'hint': "",
"         \'info': "",
"         \'warning': "",
"         \'error': "",
"     \}
" \}
" nnoremap <leader>ntr :NvimTreeRefresh<CR>
" nnoremap <leader>ntf :NvimTreeFindFile
" nnoremap <Leader>ntt :NvimTreeToggle<CR>
" }}}

" VIMSPECTOR {{{
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
" }}}

" TREESITTER {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
   ensure_installed= {"python","json","scss","html","cpp","css"},
        highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        },
    }
EOF
" }}}

" GITSIGNS {{{
lua << EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    noremap = true,
    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame = false,
  current_line_blame_delay = 1000,
  current_line_blame_position = 'eol',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  word_diff = false,
  use_internal_diff = true,  -- If luajit is present
}
EOF
" }}}

" VISTA {{{
let g:vista_default_executive = 'ctags'
let g:vista_icon_indent = [" ➤ ", "│ "]
let g:vista_fzf_preview = ['right:50%']
let g:vista_executive_for = {
    \'cpp': 'nvim_lsp',
    \'python': 'nvim_lsp',
    \'vimwiki': 'markdown'
\}
let g:vista_vimwiki_executive = 'markdown'
let g:vista_enable_markdown_extension = 1
let g:vista#renderer#icons = {
    \"function": "\uf794",
    \"variable": "\uf71b",
\}
let g:vista_fold_toggle_icons = [' ▼ ', ' ▶ ']
let g:vista_echo_cursor = 0
let g:vista_echo_cursor_strategy="scroll"
let g:vista_stay_on_open = 0
let g:vista_blink = [0, 0]
let g:vista_top_level_blink = [0, 0]
autocmd bufenter * if (winnr("$") == 1 && &filetype =~# 'vista') | q | endif
nnoremap <silent> <Leader>vt :Vista!! <CR>
nnoremap <silent> <Leader>vs :Vista focus <CR>
nnoremap <silent> <Leader>vf :Vista finder <CR>
" }}}

" AUTO-SESSION {{{
lua << EOF
    local opts = {
        log_level = 'error',
        auto_session_enable_last_session = false,
        auto_session_enabled = true,
        auto_save_enabled = nil,
        auto_restore_enabled = nil,
        auto_session_suppress_dirs = nil
    }
    require('auto-session').setup(opts)
EOF
" }}}

" UNDOTREE {{{
nnoremap <Leader>ut :UndotreeToggle<CR>
let g:undotree_ShortIndicators = 1
let g:undotree_TreeNodeShape = ""
" }}}

" HEXOKINASE {{{
let g:Hexokinase_highlighters = [ 'virtual' ]
let g:Hexokinase_optInPatterns = 'triple_hex,full_hex,rgb,rgba,hsl,hsla,colour_names'
" }}}

" NERDCOMMENTER {{{
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
nnoremap <silent> <leader>c} V}:call nerdcommenter#Comment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call nerdcommenter#Comment('x', 'toggle')<CR>
" }}}

" EASY ALIGN {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
