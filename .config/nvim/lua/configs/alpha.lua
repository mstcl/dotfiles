local present, alpha = pcall(require, "alpha")
if not present then
	return
end

local spacing = ""
local margin = 25
local width = 27
local banner = {
	[[            ██╗███╗   ██╗███████╗ ██████╗ ██████╗ ██╗███╗   ███╗    ██╗]],
	[[           ██╔╝████╗  ██║██╔════╝██╔═══██╗██╔══██╗██║████╗ ████║   ██╔╝]],
	[[          ██╔╝ ██╔██╗ ██║█████╗  ██║   ██║██████╔╝██║██╔████╔██║  ██╔╝ ]],
	[[         ██╔╝  ██║╚██╗██║██╔══╝  ██║   ██║██╔══██╗██║██║╚██╔╝██║ ██╔╝  ]],
	[[        ██╔╝   ██║ ╚████║███████╗╚██████╔╝██████╔╝██║██║ ╚═╝ ██║██╔╝   ]],
	[[        ╚═╝    ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝     ╚═╝╚═╝    ]],
}

local header = {
	type = "text",
	val = banner,
	opts = {
		position = "left",
		hl = "AlphaAscii",
	},
}

local plugins_gen = io.popen('fd -d 1 . $HOME"/.local/share/nvim/lazy" | wc -l | tr -d "\n" ')
local plugins = plugins_gen:read("*a")
plugins_gen:close()

local date_gen = io.popen('echo "$(date +%d)/$(date +%m)/$(date +%y)($(date +%a))$(date +%X)" | tr -d "\n"')
local date = date_gen:read("*a")
date_gen:close()

local id_gen = io.popen('shuf -i 10000000-99999999 -n 1 | tr -d "\n"')
local id = id_gen:read("*a")
id_gen:close()

local id_1 = tostring(tonumber(id) - 1)
local id_2 = tostring(tonumber(id) - 2)

local phrase_gen = io.popen('sh "$HOME"/scripts/other/random_4chin_word.sh | tr -d "\n"')
local phrase = phrase_gen:read("*a")
phrase_gen:close()

local heading = {
	type = "text",
	val = spacing .. " Anonymous " .. date .. " No." .. id .. " ⏵",
	opts = {
		position = "left",
		hl = "AlphaButtons",
	},
}

local post_buttons = {
	type = "text",
	val = spacing .. "They don't get it. For me, it's neovim.        ",
	opts = {
		position = "left",
		hl = "AlphaFooter",
	},
}

local pre_foot = {
	type = "text",
	val = spacing .. ">>" .. id_2 .. "(OP)                                 ",
	opts = {
		position = "left",
		hl = "AlphaEmphasis",
	},
}

local footer = {
	type = "text",
	val = spacing .. "I've " .. plugins .. " plugins, it launches instantly kek.    ",
	opts = {
		position = "left",
		hl = "AlphaFooter",
	},
}

local pre_foot_2 = {
	type = "text",
	val = spacing .. ">>" .. id_1 .. "                                     ",
	opts = {
		position = "left",
		hl = "AlphaEmphasis",
	},
}

local footer_2 = {
	type = "text",
	val = spacing .. phrase .. "          ",
	opts = {
		position = "left",
		hl = "AlphaFooter",
	},
}

local function button(sc, txt, keybind)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "left",
		text = txt,
		shortcut = sc,
		cursor = margin + 2,
		width = width,
		align_shortcut = "right",
		hl_shortcut = "AlphaShortcuts",
		hl = "AlphaHeader",
	}
	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = opts,
	}
end

local buttons = {
	type = "group",
	val = {
		button("LDR h", " >open oldfiles", ":Telescope oldfiles<CR>"),
		button("LDR .", " >open frecency", ":Telescope frecency<CR>"),
		button("LDR f", " >fuzzy search", ":Telescope find_files<CR>"),
		button("LDR y", " >browse folders", ":Telescope file_browser<CR>"),
		button("LDR /", " >regex search", ":Telescope live_grep<CR>"),
		button("LDR p", " >plugin status", ":Lazy show<CR>"),
	},
	opts = {
		spacing = 0,
	},
}

local section = {
	header = header,
	buttons = buttons,
	heading = heading,
	post_buttons = post_buttons,
	pre_foot = pre_foot,
	footer = footer,
	pre_foot_2 = pre_foot_2,
	footer_2 = footer_2,
}

local opts = {
	layout = {
		{ type = "padding", val = 10 },
		section.header,
		{ type = "padding", val = 1 },
		section.heading,
		{ type = "padding", val = 1 },
		section.buttons,
		{ type = "padding", val = 1 },
		section.post_buttons,
		{ type = "padding", val = 1 },
		section.pre_foot,
		section.footer,
		{ type = "padding", val = 1 },
		section.pre_foot_2,
		section.footer_2,
	},
	opts = {
		margin = margin,
	},
}
alpha.setup(opts)
