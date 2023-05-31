local present, barbecue = pcall(require, "barbecue")
if not present then
	return
end

local bg = "#" .. tostring(string.format("%06x", vim.api.nvim_get_hl_by_name("WinBar", true).background))
local fg = "#" .. tostring(string.format("%06x", vim.api.nvim_get_hl_by_name("Operator", true).foreground))

barbecue.setup({
	create_autocmd = false,
	theme = {
		normal = { bg = bg, fg = fg },
		context = { bg = bg, fg = fg },
		basename = { bg = bg, fg = fg, bold = true },
		ellipsis = { bg = bg, fg = fg },
		separator = { bg = bg, fg = fg },
		modified = { bg = bg, fg = fg },
		dirname = { bg = bg, fg = fg },
	},
	show_dirname = false,
	show_basename = false,
	symbols = {
		separator = "❯",
		ellipsis = "…",
		modified = "✗",
	},
	show_modified = false,
	kinds = {
		File = "⊡",
		Module = "◫",
		Namespace = "ξ",
		Package = "◫",
		Class = "⁐",
		Method = "ƒ",
		Property = "✓",
		Field = "⊟",
		Constructor = "☂",
		Enum = "ζ",
		Interface = "♺",
		Function = "ƒ",
		Variable = "Ψ",
		Constant = "π",
		String = "⟙",
		Number = "#",
		Boolean = "◕",
		Array = "☷",
		Object = "☁",
		Keyword = "✮",
		Null = "∅",
		EnumMember = "⁜",
		Struct = "◧",
		Event = "",
		Operator = "⁑",
		TypeParameter = "⊞",
	},
})
