local present, cmp = pcall(require, "cmp")
if not present then
	return
end
local kind_icons = {
	Text = "",
	Method = "ƒ",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "了",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local has_any_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local press = function(key)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

cmp.setup({
	enabled = function()
		return vim.g.cmp_toggle
	end,
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	cmp.setup.filetype({ "markdown" }, {
		sources = {
			{ name = "path" },
			{ name = "ultisnips" },
			{ name = "nvim_lsp" },
			{
				name = "buffer",
				options = {
					get_bufnrs = function()
						local bufs = {}
						for _, win in ipairs(vim.api.nvim_list_wins()) do
							bufs[vim.api.nvim_win_get_buf(win)] = true
						end
						return vim.tbl_keys(bufs)
					end,
				},
			},
		},
	}),
	sources = cmp.config.sources({
		{ name = "ultisnips" },
		{ name = "path" },
		{ name = "nvim_lsp" },
	}),
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-i>"] = function(fallback)
			if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
				press("<ESC>:call UltiSnips#JumpForwards()<CR>")
			elseif cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif has_any_words_before() then
				press("<Space>")
			else
				fallback()
			end
		end,
		["<Tab>"] = function(fallback)
				if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
					press("<ESC>:call UltiSnips#JumpForwards()<CR>")
				elseif cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				elseif has_any_words_before() then
					press("<Tab>")
				else
					fallback()
				end
			end,
		["<S-Tab>"] = function(fallback)
				if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
					press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
				elseif cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end,
	}),
	formatting = {
		format = function(entry, vim_item)
			vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
			-- vim_item.abbr = vim_item.abbr:sub(1, -2)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				buffer = "[﬘]",
				nvim_lsp = "[]",
				ultisnips = "[]",
			})[entry.source.name]
			return vim_item
		end,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
			max_width = 120,
			max_height = math.floor(vim.o.lines * 0.3),
		},
	},
	experimental = {
		ghost_text = false,
	},
})

vim.g.cmp_toggle = true
