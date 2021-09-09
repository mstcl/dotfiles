local present, scroll = pcall(require, "neoscroll")
if not present then
    return
end


scroll.setup {
    hide_cursor = true,
    stop_eof = true,
    use_local_scrolloff = false,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    easing_function = "quadratic"
}
