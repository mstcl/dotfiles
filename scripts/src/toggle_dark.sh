#!/usr/bin/env bash

current=$(gsettings get org.gnome.desktop.interface color-scheme)

ALACRITTY_CONFIG_FILE="$HOME/.config/alacritty/alacritty.toml"
GIT_CONFIG_FILE="$HOME/.config/git/config"
NVIM_CONFIG_FILE="$HOME/.config/nvim/plugin/50_ui.lua"

if [ "$current" = "'prefer-dark'" ]; then
	# gsettings
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

	# alacritty
	sed -i "s/tavern/ivory/" "${ALACRITTY_CONFIG_FILE}"
	sed -i "s/features = tavern/features = ivory/" "${GIT_CONFIG_FILE}"
	sed -i "s/tavern/ivory/" "${NVIM_CONFIG_FILE}"
else
	# gsettings
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

	# alacritty
	sed -i "s/ivory/tavern/" "${ALACRITTY_CONFIG_FILE}"
	sed -i "s/features = ivory/features = tavern/" "${GIT_CONFIG_FILE}"
	sed -i "s/ivory/tavern/" "${NVIM_CONFIG_FILE}"
fi
