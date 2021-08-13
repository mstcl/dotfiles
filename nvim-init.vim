" :.config/nvim/init.vim
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
    Plug 'rmagatti/auto-session'
    Plug 'folke/which-key.nvim'
    Plug 'Konfekt/FastFold'
    Plug 'lambdalisue/suda.vim'
    Plug 'glepnir/dashboard-nvim'
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
    Plug 'b3nj5m1n/kommentary'
    Plug 'preservim/tagbar'
    Plug 'junegunn/goyo.vim'
    Plug 'tmhedberg/SimpylFold'
    Plug 'junegunn/limelight.vim'
    Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }
    Plug 'tpope/vim-surround'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'hrsh7th/nvim-compe'
    Plug 'zhimsel/vim-stay'
    Plug 'luochen1990/rainbow'
    Plug 'p00f/nvim-ts-rainbow'
    " Plug 'bfrg/vim-cpp-modern'
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

"---GENERAL AUTOCOMMANDS---
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | set filetype=sh | endif
autocmd BufNewFile,BufReadPost *.md setlocal spell! spelllang=en_gb | highlight VimwikiDelText term=strikethrough cterm=strikethrough gui=strikethrough | highlight VimwikiCode guifg=lightblue
autocmd BufReadPost *.rasi set filetype=css
function! ShowTrailingWhitespace()
    if &filetype == 'dashboard'
        highlight RedundantSpaces cterm=none guibg=none
        return
    endif
    highlight RedundantSpaces ctermbg=red guibg=red
    match RedundantSpaces /\s\+$/
endfunction
autocmd WinEnter,BufEnter,BufNewFile,BufWritePre,BufReadPost * call ShowTrailingWhitespace()
autocmd! BufWritePost $MYVIMRC,nvim-init.vim nested source $MYVIMRC | echom "Reloaded neovim"
autocmd Filetype dashboard set showtabline=0 | set laststatus=0 | set noruler
autocmd WinEnter,BufEnter * if &filetype != 'dashboard' | set showtabline=2 | set laststatus=2 | endif

"---GENERAL OPTIONS---
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
set termguicolors
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
set history=1000
set wrapmargin=0
set textwidth=0
set spell spelllang=en_gb
set timeoutlen=500
set nospell
set encoding=utf-8
set fillchars=eob:\ 
set nolist
set listchars=tab:›_,eol:¬,trail:·
set completeopt=menuone,noselect

"---GENERAL BINDINGS---
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
nnoremap <silent> <Leader>nn :set number!<CR> <bar> :set relativenumber!<CR>
nnoremap <silent> <Leader>tn :tabnew<CR>
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <Leader>sco :set conceallevel=0<CR>
nnoremap <Leader>sci :set conceallevel=2<CR>
" nnoremap pp p
" nnoremap pa O<esc>p
" nnoremap pb o<esc>p
nmap mo o<esc>
nmap mO O<esc>
nnoremap <Leader>bn :bn<CR>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"---COLORSCHEME---
colorscheme psycho

"---VIFM---
let g:loaded_netrw = 1
let g:vifm_replace_netrw=1
nnoremap <Leader>ee :Vifm<CR>
nnoremap <Leader>et :TabVifm<CR>
nnoremap <Leader>esv :VsplitVifm<CR>
nnoremap <Leader>esh :SplitVifm<CR>
nnoremap <Leader>ed :DiffVifm<CR>

"---RAINBOW---
let g:rainbow_active = 1
let g:rainbow_conf = {
    \'parentheses': ['start=/(/ end=/)/ fold','start=/\[/ end=/\]/ fold','start=/{/ end=/}/ fold','start=/\(\(\<operator\>\)\@<!<\)\&[a-zA-Z0-9_]\@<=<\ze[^<]/ end=/>/'],
\}

"---TS-RAINBOW---
lua << EOF
    require'nvim-treesitter.configs'.setup {
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1400,
      }
    }
EOF

"---WHICH-KEY--
lua << EOF
    require("which-key").setup {
        plugins = {
            marks = true,
            registers = true,
            spelling = {
            enabled = true,
            suggestions = 20,
            },
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
                },
        },
        operators = { gc = "Comments" },
        key_labels = {
        },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
        },
        window = {
            border = "none",
            position = "bottom",
            margin = { 1, 0, 1, 0 },
            padding = { 2, 2, 2, 2 },
        },
        layout = {
            height = { min = 4, max = 25 },
            width = { min = 20, max = 50 },
            spacing = 3,
            align = "left",
        },
        ignore_missing = false,
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
        show_help = true,
        triggers = "auto",
        triggers_blacklist = {
            i = { "j", "k" },
            v = { "j", "k" },
        },
    }
EOF

"---VIM-STAY---
set viewoptions=cursor,folds,slash,unix

"---FASTFOLD---
nnoremap zuz <Plug>(FastFoldUpate)
let g:fastfold_savehook = 1
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

"---DASHBOARD---
let g:dashboard_default_executive='fzf'
let g:dashboard_fzf_engine='ag'
let g:dashboard_custom_shortcut={
    \ 'last_session'       : 'SPC s l',
    \ 'find_history'       : 'SPC f h',
    \ 'find_file'          : 'SPC f f',
    \ 'new_file'           : 'SPC c n',
    \ 'change_colorscheme' : 'SPC f c',
    \ 'find_word'          : 'SPC f a',
    \ 'book_marks'         : 'SPC f b',
    \}
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
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>s
nnoremap <Leader>db :highlight RedundantSpaces ctermbg=none guibg=none <CR> <bar> :Dashboard<CR>

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

"---AUTOPAIRS---
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
"let g:AutoPairsFlyMode = "1"

"---ULTISNIPS---
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<leader>ul'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/ultisnips"]
inoremap <c-x><c-k> <c-x><c-k>

"---INDENTLINE---
let g:indentLine_fileTypeExclude = ['FZF', 'Terminal', 'startify', 'nerdtree', 'NvimTree', 'man', 'Scratch', 'help', 'vimwiki', 'dashboard']
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceChar = '·'
autocmd TermOpen * IndentLinesDisable
nnoremap <Leader>il :IndentLinesToggle<CR>

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
let g:vimwiki_toc_header = 'Contents'
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
autocmd InsertEnter *.{vimwiki,wiki,md} set conceallevel=0
autocmd InsertLeave *.{vimwiki,wiki,md} set conceallevel=2
nnoremap <Leader>wa :VimwikiGenerateLinks<CR>
nmap <C-O> <Plug>VimwikiToggleListItem
inoremap <s-CR> <ESC>:VimwikiReturn 1 5<CR>
let g:vimwiki_listsyms = '    x'
"let g:vimwiki_listsym_rejected = ' '
let g:vimwiki_hl_headers = 1
let g:vimwiki_links_header = 'List of pages'
let g:vimwiki_links_header_level = 2
let g:vimwiki_tags_header = 'Tags'

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
nnoremap <leader>tb :TagbarToggle<CR>

"---VIMZETTEL---
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

"---FZF.VIM---
let g:fzf_layout = {'window': 'enew'}
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
let g:fzf_preview_window = []
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

"---JUPYTEXT---
let g:jupytext_fmt = 'py:percent'

"---COLORIZER---
let g:colorizer_auto_color = 1
lua require'colorizer'.setup()

"---GOYO---
function! s:goyo_enter()
    Limelight
    LeadingSpaceDisable
    set nolist
    "NvimTreeClose
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

"---AIRLINE---
let g:airline_statusline_ontop = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])
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
    \''     : 'V'
\}
let g:airline_filetype_overrides = {
    \'startify': ['', ''],
    \'NvimTree': ['', ''],
    \'help': ['H', ''],
    \'vim-plug': ['P', ''],
    \'Tagbar': ['', ''],
\}
function! MyLineNumber()
    return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). '/'.
        \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction
call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})
let g:airline_section_z = airline#section#create(['%3p%% |  ', 'linenr', ' | %3v'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

"---NVIMTREE---
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

"---TREESITTER---
lua <<EOF
require'nvim-treesitter.configs'.setup {
   ensure_installed= {"python","json","scss","html","cpp","css"},
        highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        },
    }
EOF
