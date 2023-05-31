local present, wilder = pcall(require, "wilder")
if not present then
	return
end

wilder.setup({ modes = { ":", "/", "?" } })
wilder.set_option("pipeline", {
	wilder.branch(
		wilder.python_file_finder_pipeline({
			file_command = { "rg", "--files" },
			dir_command = { "fd", "-td" },
			filters = { "fuzzy_filter", "difflib_sorter" },
		}),
		wilder.substitute_pipeline({
			pipeline = wilder.python_search_pipeline({
				skip_cmdtype_check = 1,
				pattern = wilder.python_fuzzy_pattern({
					start_at_boundary = 0,
				}),
			}),
		}),
		wilder.cmdline_pipeline({
			language = "vim",
			fuzzy = 2,
		}),
		{
			wilder.check(function(ctx, x)
				return x == ""
			end),
			wilder.history(),
		},
		wilder.python_search_pipeline({
			pattern = wilder.python_fuzzy_pattern({
				start_at_boundary = 0,
			}),
			sorter = wilder.python_difflib_sorter(),
			engine = "re2",
		})
	),
})

local highlighters = {
	wilder.pcre2_highlighter(),
}

local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
	border = "single",
	empty_message = wilder.popupmenu_empty_message_with_spinner(),
	highlights = {
		default = "Wilder",
		border = "TelescopePromptBorder",
		accent = "WilderAccent",
		selected = "WilderSelected",
		selected_accent = "WilderSelectedAccent",
	},
	highlighter = wilder.basic_highlighter(),
	min_height = "0%",
	max_height = "20%",
	left = {
		" ",
		wilder.popupmenu_devicons(),
		wilder.popupmenu_buffer_flags({
			flags = " a + ",
			icons = { ["+"] = "●", a = "☰", h = "☷" },
		}),
	},
	right = {
		" ",
		wilder.popupmenu_scrollbar(),
	},
}))

local popupmenu_renderer_2 = wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
	-- 'single', 'double', 'rounded' or 'solid'
	-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
    highlights = {
		default = "TelescopeNormal",
		border = "TelescopePromptBorder",
		accent = "TelescopeMatching",
		selected = "TelescopeSelection",
		selected_accent = "TelescopeSelection",
	},
    highlighter = wilder.basic_highlighter(),
	border = "single",
	max_height = "55%", -- max height of the palette
	min_height = 0, -- set to the same as 'max_height' for a fixed height window
	prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
	reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
}))

local wildmenu_renderer = wilder.wildmenu_renderer({
	highlights = {
		default = "WilderWildMenu",
		selected = "WilderWildMenuSelected",
		selected_accent = "WilderWildMenuSelectedAccent",
		accent = "WilderWildMenuAccent",
	},
	highlighter = wilder.basic_highlighter(),
	separator = " · ",
	left = { " SEARCH ", wilder.wildmenu_spinner(), " " },
	right = { " ", wilder.wildmenu_index() },
})

wilder.set_option(
	"renderer",
	wilder.renderer_mux({
		[":"] = popupmenu_renderer_2,
		["/"] = wildmenu_renderer,
		substitute = wildmenu_renderer,
	})
)
