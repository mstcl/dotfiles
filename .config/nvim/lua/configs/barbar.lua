local present, barbar = pcall(require, "barbar")
if not present then
	return
end

barbar.setup({
	animation = true,
	auto_hide = true,
	tabpages = true,
	closable = true,
	clickable = true,
	focus_on_close = "left",
	hide = { extensions = false, inactive = false },
	highlight_inactive_file_icons = false,
	exclude_name = { "python", "[dap-repl]" },
	icons = {
		buffer_index = false,
		buffer_number = false,
		button = "✕",
		gitsigns = {
			added = { enabled = false, icon = "+" },
			changed = { enabled = false, icon = "~" },
			deleted = { enabled = false, icon = "-" },
		},
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "✘" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false, icon = "?" },
		},
		filetype = {
			custom_colors = false,
			enabled = true,
		},
		separator = { left = "│", right = "" },
		modified = { button = "●" },
		pinned = { button = "☀", filename = true },
		current = { buffer_index = false },
		inactive = {filetype = {enabled = true}},
	},
	insert_at_end = false,
	maximum_padding = 2,
	maximum_length = 10,
	semantic_letters = true,
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
	no_name_title = nil,
})
