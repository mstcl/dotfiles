#!/usr/bin/env bash

current=$(gsettings get org.gnome.desktop.interface color-scheme)

# export ALACRITTY_CONFIG_FILE="$HOME/.config/alacritty/alacritty.toml"
export GIT_CONFIG_FILE="$HOME/.config/git/config"
export NVIM_CONFIG_FILE="$HOME/.config/nvim/plugin/99_override.lua"
export FOOT_CONFIG_FILE="$HOME/.config/foot/foot.ini"

if [ "$current" = "'prefer-dark'" ]; then
	gui_light_theme
else
	gui_dark_theme
fi
