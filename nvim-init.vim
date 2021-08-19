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

" SET PLUGINS {{{
" require plugins.lua
lua require('plugins')

" remove these built-in plugins
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
    "matchit"
    }

    for _, plugin in pairs(disabled_built_ins) do
        vim.g["loaded_" .. plugin] = 1
    end
EOF
" }}}

" GENERAL AUTOCOMMANDS {{{
" autocompile packer on saving of plugins.lua
autocmd BufWritePost plugins.lua source <afile> | PackerCompile

" default non-extension filetype is bash
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=sh | set filetype=sh | endif

" rasi extension is css-based
autocmd BufReadPost *.rasi set filetype=css

" autosource init.vim upon saving
autocmd! BufWritePost $MYVIMRC,nvim-init.vim nested source $MYVIMRC | set foldmethod=marker | echo "Reloaded neovim"

" hide things for nvim-dashboard
autocmd Filetype dashboard set showtabline=0 | set laststatus=0 | set noruler
autocmd WinEnter,BufEnter * if &filetype != 'dashboard' | set showtabline=2 | set laststatus=2 | endif

" vimwiki settings
augroup vimwiki
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal spell! spelllang=en_gb | highlight VimwikiDelText term=strikethrough cterm=strikethrough gui=strikethrough | highlight VimwikiCode guifg=lightblue
    autocmd Filetype vimwiki set fdm=expr
augroup END
" }}}

" GENERAL OPTIONS {{{
" terminal title
let &titlestring = "nvim " . expand("%:t")
set title

" use document modeline
set modeline

" vimstay/auto-session option to restore session
set viewoptions=cursor,folds,slash,unix
set sessionoptions+=options,resize,winpos,terminal

" visual settings
set cursorline
set hidden
set noshowmode
set showcmd
set lazyredraw
set termguicolors

" folding
set foldmethod=indent
set nofoldenable

" editing
set wrap
set formatoptions-=cro
set wrapmargin=0
set textwidth=0
set linebreak
set mouse=a

" rule
set number
set relativenumber

" change default split
set splitbelow
set splitright

" for fast as fuck typers
set timeoutlen=400

" search options
set hlsearch
set ignorecase
set incsearch
set smartcase

" indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent

" normal backspace
set backspace=indent,eol,start

" systemwide clipboard
set clipboard=unnamedplus

" scrolloff
set sidescrolloff=5
set scrolloff=1

" set history
set history=1000

" spelling
set spell spelllang=en_gb
set nospell
set encoding=utf-8

" funky characters
set fillchars=eob:\ ,vert:│
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,eol:¶,trail:·

" nvim-compe completion
set completeopt=menuone,noselect

" no-obnoxious nvim
set shortmess+=Ssatqc

" huh I don't know if this should be here
set path+=**

" detect extraneous filetype
filetype plugin on
" }}}

" KEY BINDINGS {{{
" set leaders
let mapleader = ",."
let maplocalleader = ",.."

" type comma easily
inoremap ,, ,

" access command with space
nnoremap <space> :

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv

" new line above/below in normal mode
nmap     mo o<esc>
nmap     mO O<esc>

" unbind arrow keys in normal mode
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"

" control keymaps {{{
" vimwiki todo toggle
nmap <C-O> <Plug>VimwikiToggleListItem
" }}}

" leader a {{{
nnoremap <silent> <Leader>ap  :AutoPairsToggle<CR>
" }}}

" leader b {{{
" buffer motions
nnoremap <silent> <Leader>bn  :bn<CR>
nnoremap <silent> <Leader>bd  :bd<CR>
nnoremap <silent> <Leader>bp  :bp<CR>
" }}}

" leader c {{{
" toggle colour highlighting
nnoremap <silent> <Leader>ch  :HexokinaseToggle<CR>
" comment chunk
nnoremap <silent> <leader>c}  V}:call nerdcommenter#Comment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{  V{:call nerdcommenter#Comment('x', 'toggle')<CR>

" }}}

" leader d {{{
" goto dashboard
nnoremap <silent> <Leader>db  :Dashboard<CR>
"}}}

" leader f {{{
" telescope
nnoremap <silent> <Leader>ff  :Telescope find_files<CR>
nnoremap <silent> <Leader>fe  :Telescope file_browser<CR>
nnoremap <silent> <Leader>fgc :Telescope git_commits<CR>
nnoremap <silent> <Leader>fgs :Telescope git_status<CR>
nnoremap <silent> <Leader>fb  :Telescope buffers<CR>
nnoremap <silent> <Leader>fh  :Telescope oldfiles<CR>
nnoremap <silent> <Leader>fc  :Telescope commands<CR>
nnoremap <silent> <Leader>fr  :Telescope registers<CR>
nnoremap <silent> <leader>fv  :Telescope vim_options<CR>
nnoremap <silent> <leader>fmr :Telescope marks<CR>
nnoremap <silent> <leader>fl  :Telescope colorscheme<CR>
nnoremap <silent> <leader>fs  :Telescope spell_suggest<CR>
nnoremap <silent> <leader>fk  :Telescope keymaps<CR>
nnoremap <silent> <leader>fft :Telescope filetypes<CR>
nnoremap <silent> <leader>ffh :Telescope highlights<CR>
nnoremap <silent> <leader>fz  :Telescope live_grep<CR>
nnoremap <silent> <leader>fy  :Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <leader>fmp :Telescope man_pages<CR>
" }}}

" leader i {{{
" indent line toggle
nnoremap <silent> <Leader>il  :IndentBlanklineToggle<CR>
" }}}

" leader l  {{{
" toggle listchars
nnoremap <silent> <Leader>ll  :set list!<CR>
" }}}

" leader p {{{
" enter paste mode
nnoremap <silent> <Leader>pt  :set paste!<CR>
nnoremap <silent> <Leader>ps  :PackerStatus <CR>
" }}}

" leader n {{{
" disasble search highlighting
nnoremap <silent> <Leader>nh  :noh <CR>
" set number/relativenumber
nnoremap <silent> <Leader>nr  :set relativenumber!<CR>
nnoremap <silent> <Leader>nn  :set number!<CR> <bar> :set norelativenumber<CR>
" }}}

" leader r {{{
" restore session
nnoremap <silent> <leader>rs :RestoreSession<CR>
" }}}

" leader s {{{
" new split
nnoremap <silent> <Leader>spv :vs<CR>
nnoremap <silent> <Leader>sph :sp<CR>
" source nvim config
nnoremap <silent> <Leader>sv  :source $MYVIMRC<CR>
" set spell
nnoremap <silent> <Leader>sh  :setlocal spell! spelllang=en_gb<CR>
" change conceal level on the fly
nnoremap <silent> <Leader>sco :set conceallevel=0<CR>
nnoremap <silent> <Leader>sci :set conceallevel=2<CR>
" }}}

" leader t {{{
" new tab
nnoremap <silent> <Leader>tn  :tabnew<CR>
" treesitter toggles
nnoremap <silent> <Leader>tsr :TSBufToggle rainbow<CR>
nnoremap <silent> <Leader>tsh :TSBufToggle highlight<CR>
" }}}

" leader v {{{
nnoremap <silent> <Leader>vt :Vista!! <CR>
nnoremap <silent> <Leader>vs :Vista focus <CR>
nnoremap <silent> <Leader>vf :Vista finder <CR>
" }}}

" leader w {{{
" delete whitespace
" delete whitespace
nnoremap <silent> <leader>wp  :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" vimwiki generate links
nnoremap <silent> <Leader>wa :VimwikiGenerateLinks<CR>
" }}}

" leader z {{{
" zenmode toggle
nnoremap <silent> <Leader>zm :ZenMode<CR>
" vim-zettel new document
nnoremap <silent> <Leader>zn :ZettelNew
" }}}

" leader space {{{
" switch between prev/next buffer
nnoremap <silent> <Leader><space> <C-^>
" }}}

" fold with indent-blankline {{{
nnoremap <silent> zA zA:IndentBlanklineRefresh<CR>
nnoremap <silent> za za:IndentBlanklineRefresh<CR>
nnoremap <silent> zm zm:IndentBlanklineRefresh<CR>
nnoremap <silent> zM zM:IndentBlanklineRefresh<CR>
nnoremap <silent> zc zc:IndentBlanklineRefresh<CR>
nnoremap <silent> zC zC:IndentBlanklineRefresh<CR>
nnoremap <silent> zr zr:IndentBlanklineRefresh<CR>
nnoremap <silent> zR zR:IndentBlanklineRefresh<CR>
" }}}

" compe autocompletion and navigation {{{
lua << EOF
vim.api.nvim_set_keymap("i", "<C-space>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
EOF

" popup menu scroll {{{
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

" PLUGIN OPTIONS {{{
" HEXOKINASE {{{
let g:Hexokinase_highlighters = [ 'virtual' ]
let g:Hexokinase_optInPatterns = 'triple_hex,full_hex,rgb,rgba,hsl,hsla,colour_names'
" }}}

" DASHBOARD {{{
let g:dashboard_default_executive = 'telescope'
let g:dashboard_enable_session = 0
let g:dashboard_custom_section={
\ 'history_list': {
    \ 'description': [' History                 LDR fh'],
    \ 'command': ':Telescope oldfiles<CR>' },
\ 'buffer_list': {
    \ 'description': ['﬘ Buffer                  LDR fb'],
    \ 'command': ':Telescope buffers<CR>' },
\ 'find_files': {
    \ 'description': [' Files                   LDR ff'],
    \ 'command': ':Telescope find_files<CR>' },
\ 'explorer': {
    \ 'description': [' Browse                  LDR fe'],
    \ 'command': ':Telescope file_browser<CR>' },
\ 'fuzzy': {
    \ 'description': [' Fuzzy                   LDR fz'],
    \ 'command': ':Telescope live_grep' },
\ 'session': {
    \ 'description': [' Restore                 LDR rs'],
    \ 'command': ':RestoreSession' }
\ }
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
let g:total_plugins = trim(system("fd -d 2 . $HOME'/.local/share/nvim/site/pack/packer' | head -n -2 | wc -l"))
let g:dashboard_custom_footer = [' neovim loaded '. g:total_plugins .' plugins']
" }}}

" ULTISNIPS {{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/ultisnips"]
" }}}

" VISTA {{{
let g:vista_default_executive = 'ctags'
let g:vista_icon_indent = [" ➤ ", "│ "]
let g:vista_fzf_preview = ['right:50%']
let g:vista_executive_for = {
    \ 'cpp': 'nvim_lsp',
    \ 'python': 'nvim_lsp',
    \ 'vimwiki': 'markdown'
\ }
let g:vista_vimwiki_executive = 'markdown'
let g:vista_enable_markdown_extension = 1
let g:vista#renderer#icons = {
    \ "function": "\uf794",
    \ "variable": "\uf71b",
\ }
let g:vista_fold_toggle_icons = [' ▼ ', ' ▶ ']
let g:vista_echo_cursor = 0
let g:vista_echo_cursor_strategy="scroll"
let g:vista_stay_on_open = 0
let g:vista_blink = [0, 0]
let g:vista_top_level_blink = [0, 0]
autocmd bufenter * if (winnr("$") == 1 && &filetype =~# 'vista') | q | endif
" }}}

" JUPYTEXT {{{
let g:jupytext_fmt = 'py:percent'
" }}}

" NERDCOMMENTER {{{
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
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
    \ {"open": '\w\zs<', "close": '>'},
    \ {"open": "$", "close": "$", "filetype": "tex"},
    \ {"open": '\\left(', 'close': '\right)', "filetype": "tex"},
    \ {"open": '\\left(', 'close': '\right)', "filetype": "vimwiki"},
    \ {"open": '\vclass .{-} (: (.{-}[ ,])+)? ?\{', 'close': '};', 'mapopen': '{', 'filetype': 'cpp'},
    \ {"open": "*", "close": "*", "filetype": ["help"]},
    \ {"open": "*", "close": "*", "filetype": ["vimwiki"]},
    \ {"open": "**", "close": "**", "filetype": ["vimwiki"]},
    \ {"open": "_", "close": "_", "filetype": ["vimwiki"]},
    \ {"open": "~~", "close": "~~", "filetype": ["vimwiki"]},
    \ {"open": "++", "close": "++", "filetype": ["vimwiki"]},
    \ {"open": "|", "close": "|", "filetype": "help"}
\ ])
let g:AutoPairsFlyMode = "0"
" }}}

" VIMWIKI {{{
let g:vimwiki_list = [{
    \ 'path': '$HOME/wiki/docs',
    \ 'ext':'.md',
    \ 'syntax':'markdown',
    \ 'path_html': '$HOME/vimwiki.old/site_html/',
    \ 'template_path': '$HOME/vimwiki.old/templates',
    \ 'template_default': 'def_template',
    \ 'template_ext': '.html',
\}]
let g:vimwiki_key_mappings = {
    \ 'table_mappings': 0,
\}
let g:vimwiki_use_mouse = 1
let g:vimwiki_folding = 'expr'
let g:vimwiki_auto_chdir = 1
let g:vimwiki_toc_header = 'Contents'
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
autocmd InsertEnter *.{vimwiki,wiki,md} set conceallevel=0
autocmd InsertLeave *.{vimwiki,wiki,md} set conceallevel=2
let g:vimwiki_listsyms = '    x'
let g:vimwiki_hl_headers = 1
let g:vimwiki_links_header = 'List of pages'
let g:vimwiki_links_header_level = 2
let g:vimwiki_tags_header = 'Tags'
" }}}

" VIMZETTEL {{{
let g:zettel_format = "%raw_title"
let g:zettel_options = [{"template":"/home/lckdscl/wiki/docs/templates/md.tpl", "front_matter": [["tags",""], ["hide","navigation"]]}]
let g:zettel_default_mappings = 0
" }}}

" UNDOTREE {{{
nnoremap <silent> <Leader>ut :UndotreeToggle<CR>
let g:undotree_ShortIndicators = 1
let g:undotree_TreeNodeShape = ""
" }}}
" }}}
