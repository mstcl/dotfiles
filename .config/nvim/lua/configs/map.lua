local present, map = pcall(require, "mini.map")
if not present then
	return
end

local git_integration = map.gen_integration.gitsigns({
	add = "GitSignsAdd",
	change = "GitSignsChange",
	delete = "GitSignsDelete",
})

local diagnostic_integration = map.gen_integration.diagnostic({
	error = "DiagnosticFloatingError",
	warn = "DiagnosticFloatingWarn",
	info = "DiagnosticFloatingInfo",
	hint = "DiagnosticFloatingHint",
})

map.setup({
	integrations = { diagnostic_integration, git_integration },
	symbols = {
		encode = map.gen_encode_symbols.dot("3x2"), scroll_line = "▓",
		scroll_view = "▒",
	},
	-- Window options
	window = {
		focusable = false,
		side = "right",
		show_integration_count = false,
		width = 10,
		winblend = 25,
	},
})
