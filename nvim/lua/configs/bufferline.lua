local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

bufferline.setup {
    options = {
        close_command = "bdelete! %d",
        right_mouse_command = nil,
        left_mouse_command = "buffer %d",
        middle_mouse_command = "bdelete! %d",
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count)
            return "("..count..")"
        end,
        custom_filter = function(buf_number)
            if vim.bo[buf_number].filetype ~= "" then
                return true
            end
            if vim.fn.bufname(buf_number) ~= "" then
                return true
            end
        end,
        offsets = {{filetype = "NvimTree", text = "File Explorer"}},
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thick",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        sort_by = 'id'
    }
}
