" :.config/nvim/init.vim
" vim:set fdm=marker foldenable:
"
" IMPORT PLUGINS AND DISABLE SOME {{{
" lua require'impatient'
" lua require'plugins'
lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
EOF
lua require'lazy-init'
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
" COLORSCHEME {{{
colorscheme despair
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
augroup END
" }}}
" Alpha options {{{
augroup alpha
    autocmd!
    autocmd User AlphaReady set laststatus=0 | set showtabline=0 | set nofoldenable | autocmd BufUnload <buffer> set showtabline=2 | set laststatus=3
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
" Auto close nvim-tree {{{
augroup nvimtreeclose
    autocmd!
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
augroup END
" Telescope no prompt {{{
augroup TelescopeStuff
autocmd FileType TelescopePrompt lua require'cmp'.setup.buffer {
\   completion = { autocomplete = false }
\ }
augroup END
" }}}
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
lua require'utils.mappings'
lua require'utils.settings'
source $HOME/.config/nvim/colors/despair.lua
