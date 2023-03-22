local present, barbecue = pcall(require, "barbecue")
if not present then
	return
end

barbecue.setup({
	create_autocmd = false,
	theme = {
		normal = { bg = "#f0f0f0", fg = "#7c7c7c" },
		context = { bg = "#f0f0f0", fg = "#7c7c7c" },
		basename = { bg = "#f0f0f0", fg = "#7c7c7c", bold = true },
		ellipsis = { bg = "#f0f0f0", fg = "#7c7c7c" },
		separator = { bg = "#f0f0f0", fg = "#7c7c7c" },
		modified = { bg = "#f0f0f0", fg = "#7c7c7c" },
		dirname = { bg = "#f0f0f0", fg = "#7c7c7c" },
	},
	symbols = {
		separator = "·",
		ellipsis = "…",
		modified = "",
	},
	show_modified = true,
})
