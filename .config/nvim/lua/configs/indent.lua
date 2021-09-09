local present, indent = pcall(require, "indent_blankline")
if not present then
    return
end

indent.setup {
    buftype_exclude = {"terminal"},
    bufnameExclude = {'README.md'},
    show_current_context = true,
    filetype_exclude = {""},
    enabled = 'true',
}
