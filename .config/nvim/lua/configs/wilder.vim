call wilder#setup({
     \'modes': [':', '/', '?'],
     \ 'next_key': '<Tab>',
     \ 'previous_key': '<S-Tab>',
     \ 'accept_key': '<Down>',
     \ 'reject_key': '<Up>',
     \ })

call wilder#set_option('pipeline', [
    \ wilder#debounce(10),
    \ wilder#branch(
        \ [
            \ wilder#check({_, x -> empty(x)}),
            \ wilder#history(),
        \ ],
        \ wilder#substitute_pipeline({
            \ 'pipeline': wilder#python_search_pipeline({
                \ 'skip_cmdtype_check': 1,
                \ 'pattern': wilder#python_fuzzy_pattern({
                    \ 'start_at_boundary': 0,
                \ }),
            \ }),
        \ }),
        \ wilder#cmdline_pipeline({
            \ 'language': 'vim',
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

let s:popupmenu_renderer = wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
    \ 'highlights': {
        \ 'default': 'Wilder',
        \ 'border': 'Comment',
        \ 'selected': 'WilderSelected',
        \ 'selected_accent': 'WilderSelectedAccent',
        \ 'accent': 'WilderAccent',
    \ },
    \ 'border': 'single',
    \ 'highlighter': wilder#basic_highlighter(),
    \ 'empty_message': wilder#popupmenu_empty_message_with_spinner(),
    \ 'min_height': '0%',
    \ 'max_height': '20%',
    \ 'reverse': 0,
    \ 'left': [
    \ ' ',
    \ wilder#popupmenu_devicons(),
    \ ' ',
    \ ],
    \ 'right': [
    \ ' ',
    \ wilder#popupmenu_scrollbar({
        \ 'scrollbar_hl': "WilderScroll",
        \ }),
    \ ],
\ }))


let s:wildmenu_renderer = wilder#wildmenu_renderer({
    \ 'highlighter': wilder#basic_highlighter(),
    \ 'highlights' : {
        \ 'default': 'WildMenu',
        \ 'border': 'Comment',
        \ 'selected': 'WilderSelected',
        \ 'selected_accent': 'WilderSelectedAccent',
        \ 'accent': 'WilderAccent',
    \ },
    \ 'left': [' ', wilder#wildmenu_spinner(), ' '],
    \ 'right': [' ', wilder#wildmenu_index()],
\ })

call wilder#set_option('renderer', wilder#renderer_mux({
    \ ':': s:popupmenu_renderer,
    \ '/': s:wildmenu_renderer,
    \ 'substitute': s:wildmenu_renderer,
\ }))
