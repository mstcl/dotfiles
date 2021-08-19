" :.config/nvim/init.vim
" vim:set fdm=marker nofoldenable:
"+-----------------------------------+
"|  _       _ _         _            |
"| (_)_ __ (_) |___   _(_)_ __ ___   |
"| | | '_ \| | __\ \ / / | '_ ` _ \  |
"| | | | | | | |_ \ V /| | | | | | | |
"| |_|_| |_|_|\__(_)_/ |_|_| |_| |_| |
"|                                   |
"+-----------------------------------+

" SET PLUGINS {{{
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
    "matchit"
    }

    for _, plugin in pairs(disabled_built_ins) do
        vim.g["loaded_" .. plugin] = 1
    end
EOF
" }}}

" GENERAL AUTOCOMMANDS {{{
" Autocompile packer on saving of plugins.lua
autocmd BufWritePost plugins.lua source <afile> | PackerCompile

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
augroup vimwiki
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal spell! spelllang=en_gb | highlight VimwikiDelText term=strikethrough cterm=strikethrough gui=strikethrough | highlight VimwikiCode guifg=lightblue
    autocmd Filetype vimwiki set fdm=expr
augroup END
" }}}

" GENERAL OPTIONS {{{
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

" KEY BINDINGS {{{
" Set leaders
let mapleader = ",."
let maplocalleader = ",.."

" Type comma easily
inoremap ,, ,

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
nmap     mo o<esc>
nmap     mO O<esc>

" Unbind arrow keys in normal mode
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"

" Barbar buffer motions {{{
" Move to previous/next
nnoremap <silent>    <A-,>     :BufferPrevious<CR>
nnoremap <silent>    <A-.>     :BufferNext<CR>
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

" Leader c {{{
" Toggle colour highlighting
nnoremap <silent> <Leader>ch  :HexokinaseToggle<CR>
" Comment chunk
nnoremap <silent> <leader>c}  V}:call nerdcommenter#Comment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{  V{:call nerdcommenter#Comment('x', 'toggle')<CR>

" }}}

" Leader d {{{
" Goto dashboard
nnoremap <silent> <Leader>db  :Dashboard<CR>
"}}}

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

" Leader p {{{
" Enter paste mode
nnoremap <silent> <Leader>pt  :set paste!<CR> <bar> :echo "PASTE MODE TOGGLE" <CR>
nnoremap <silent> <Leader>ps  :PackerStatus <CR>
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
vim.api.nvim_set_keymap("i", "<C-space>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
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

" PLUGIN OPTIONS {{{
" HEXOKINASE {{{
let g:Hexokinase_highlighters = [ 'virtual' ]
let g:Hexokinase_optInPatterns = 'triple_hex,full_hex,rgb,rgba,hsl,hsla,colour_names'
" }}}

" DASHBOARD {{{
let g:dashboard_default_executive = 'telescope'
let g:dashboard_custom_section={
\ 'history_list': {
    \ 'description': [' History                 LDR fh'],
    \ 'command': ':FzfLua oldfiles' },
\ 'buffer_list': {
    \ 'description': ['﬘ Buffer                  LDR fb'],
    \ 'command': ':FzfLua buffers' },
\ 'find_files': {
    \ 'description': [' Files                   LDR ff'],
    \ 'command': ':FzfLua files' },
\ 'session': {
    \ 'description': [' Restore                 LDR rr'],
    \ 'command': ':SessionLoad' }
\ }
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
    \ 'vimwiki': 'markdown',
    \ 'vim': 'nvim_lsp',
    \ 'sh': 'nvim_lsp',
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

" BARBAR {{{
let bufferline = get(g:, 'bufferline', {})
let bufferline.add_in_buffer_number_order = v:false
let bufferline.animation = v:true
let bufferline.auto_hide = v:false
let bufferline.tabpages = v:true
let bufferline.closable = v:true
let bufferline.clickable = v:true
let bufferline.icons = v:true
let bufferline.icon_custom_colors = v:false
let bufferline.icon_separator_active = ''
let bufferline.icon_separator_inactive = ''
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = ''
let bufferline.icon_pinned = ''
let bufferline.insert_at_end = v:false
let bufferline.maximum_padding = 4
let bufferline.maximum_length = 30
let bufferline.semantic_letters = v:true
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'
let bufferline.no_name_title = v:null
" }}}

" WILDER {{{
call wilder#setup({
    \ 'modes': [':', '/', '?'],
    \ 'next_key': '<Tab>',
    \ 'previous_key': '<S-Tab>',
    \ 'accept_key': '<Down>',
    \ 'reject_key': '<Up>',
\ })

autocmd CmdlineEnter * ++once call s:wilder_init()
function! s:wilder_init() abort
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
