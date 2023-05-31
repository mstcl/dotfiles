local wezterm = require("wezterm")
local default = require("./wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

for k, v in pairs(default) do
	if k  ~= "window_padding" then
		config[k] = v
	end
end

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
