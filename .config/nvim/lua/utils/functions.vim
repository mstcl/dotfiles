function! CleanEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        exe 'bw ' . join(buffers, ' ')
    endif
endfunction

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

function! ProcessSearch(timerid)
    let l:patt = '\%#' . @/
    if &ignorecase | let l:patt = '\c' . l:patt | endif
    exe 'match IncSearch /' . l:patt . '/'
endfunc

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

function! ShowPaste()
    if &paste
        set showmode
    else
        set noshowmode
    endif
endfunction

function! s:s(delta) abort
if pumvisible()
  let l:i = complete_info(['selected']).selected
  call timer_start(0, { -> nvim_select_popupmenu_item(l:i + a:delta, v:true, v:false, {}) })
endif
return "\<Ignore>"
endfunction

function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

function ToggleCmp()
    if g:cmp_toggle==v:true
        let g:cmp_toggle=v:false
    else
        let g:cmp_toggle=v:true
    endif
endfunction

function OpenMarkdownPreview (url)
  execute "silent ! librewolf --new-window " . a:url
endfunction
