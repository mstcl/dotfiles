vim.g.bufferline = {
	animation = true,
	auto_hide = true,
	tabpages = true,
	closable = true,
	clickable = true,
	diagnostics = {
		{ enabled = true, icon = "ﬀ" }, -- ERROR
		{ enabled = false }, -- WARN
		{ enabled = false }, -- INFO
		{ enabled = true }, -- HINT
	},
	hide = { extensions = true, inactive = true },
	exclude_name = { "python", "[dap-repl]" },
	icons = true,
	icon_custom_colors = false,
	icon_separator_active = "",
	icon_separator_inactive = "",
	icon_close_tab = "✕",
	icon_close_tab_modified = "●",
	icon_pinned = "☀",
	insert_at_end = false,
	maximum_padding = 2,
	maximum_length = 10,
	semantic_letters = true,
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
	no_name_title = nil,
}
