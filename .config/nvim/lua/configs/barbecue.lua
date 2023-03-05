local present, barbecue = pcall(require, "barbecue")
if not present then
	return
end

barbecue.setup({
	create_autocmd = true,
	theme = {
		normal = { bg = "#f0f0f0", fg = "#2f2f2f" },
	},
})
