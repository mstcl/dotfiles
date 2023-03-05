local present, indent = pcall(require, "indent_blankline")
if not present then
    return
end

indent.setup {
    buftype_exclude = {"terminal"},
    bufnameExclude = {'README.md'},
    show_current_context = true,
    show_end_of_line = false,
    filetype_exclude = {"tex"},
    enabled = 'true',
}
