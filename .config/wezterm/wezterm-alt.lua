local wezterm = require("wezterm")
local default = require("./wezterm")
local palette = require("colors")

local original = wezterm.color.parse(palette.color1)
local bg = original:darken(0.015)

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

for k, v in pairs(default) do
	config[k] = v
end

config.colors.background = bg
config.colors.cursor_fg = bg
config.colors.scrollbar_thumb = bg
config.colors.ansi[1] = bg
config.colors.tab_bar.background = bg
config.colors.tab_bar.active_tab.bg_color = bg
config.colors.tab_bar.inactive_tab.bg_color = bg
config.colors.tab_bar.inactive_tab_hover.bg_color = bg
config.colors.tab_bar.new_tab.bg_color = bg
config.colors.tab_bar.new_tab_hover.bg_color = bg
config.command_palette_bg_color = bg
config.command_palette_fg_color = bg

return config
