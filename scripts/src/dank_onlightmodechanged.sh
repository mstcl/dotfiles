#!/usr/bin/env bash

current=$2

# export ALACRITTY_CONFIG_FILE="$HOME/.config/alacritty/alacritty.toml"
export GIT_CONFIG_FILE="$HOME/.config/git/config"
export NVIM_CONFIG_FILE="$HOME/.config/nvim/plugin/99_override.lua"
export FOOT_CONFIG_FILE="$HOME/.config/foot/foot.ini"

if [ "$current" = "light" ]; then
	,gui_light_theme
else
	,gui_dark_theme
fi
