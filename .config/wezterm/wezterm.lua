local wezterm = require("wezterm")
local palette = require("colors")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.colors = {
	foreground = palette.color8,
	background = palette.color1,
	cursor_bg = palette.color5,
	cursor_fg = palette.color1,
	cursor_border = palette.color5,
	selection_fg = palette.color16,
	selection_bg = palette.color15,
	scrollbar_thumb = palette.color1,
	split = palette.color9,

	ansi = {
		palette.color1,
		palette.color2,
		palette.color3,
		palette.color4,
		palette.color5,
		palette.color6,
		palette.color7,
		palette.color8,
	},
	brights = {
		palette.color9,
		palette.color10,
		palette.color11,
		palette.color12,
		palette.color13,
		palette.color14,
		palette.color15,
		palette.color16,
	},

	tab_bar = {
		background = palette.color1,
		active_tab = {
			bg_color = palette.color1,
			fg_color = palette.color2,
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = palette.color1,
			fg_color = palette.color9,
		},
		inactive_tab_hover = {
			bg_color = palette.color1,
			fg_color = palette.color10,
		},
		new_tab = {
			bg_color = palette.color1,
			fg_color = palette.color9,
		},
		new_tab_hover = {
			bg_color = palette.color1,
			fg_color = palette.color10,
		},
	},
}

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.enable_scroll_bar = false
config.audible_bell = "Disabled"
config.automatically_reload_config = true
config.window_padding = {
	left = "3cell",
	right = "3cell",
	top = "1.5cell",
	bottom = "1.5cell",
}
config.enable_wayland = false
config.font = wezterm.font_with_fallback({ "scientifica", { family = "Symbols Nerd Font", scale = 0.8 } })
config.font_size = 17
config.bold_brightens_ansi_colors = "BrightAndBold"
config.line_height = 1
config.cell_width = 1
config.underline_thickness = "2pt"
config.underline_position = "-2pt"
config.default_cursor_style = "SteadyBar"
config.cursor_thickness = "1px"
config.max_fps = 144
config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 150,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 150,
	target = "CursorColor",
}
config.command_palette_bg_color = palette.color1
config.command_palette_fg_color = palette.color16
config.use_cap_height_to_scale_fallback_fonts = true
config.dpi = 93
config.detect_password_input = false
config.warn_about_missing_glyphs = false

return config
