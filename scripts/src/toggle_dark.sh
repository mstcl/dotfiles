#!/usr/bin/env bash

current=$(gsettings get org.gnome.desktop.interface color-scheme)

# ALACRITTY_CONFIG_FILE="$HOME/.config/alacritty/alacritty.toml"
GIT_CONFIG_FILE="$HOME/.config/git/config"
NVIM_CONFIG_FILE="$HOME/.config/nvim/plugin/99_override.lua"
FOOT_CONFIG_FILE="$HOME/.config/foot/foot.ini"

if [ "$current" = "'prefer-dark'" ]; then
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
	# sed -i "s/tavern/ivory/" "${ALACRITTY_CONFIG_FILE}"
	sed -i "s/features = tavern/features = ivory/" "${GIT_CONFIG_FILE}"
	sed -i "s/tavern/ivory/" "${NVIM_CONFIG_FILE}"
	sed -i "s/initial-color-theme=1/initial-color-theme=2/" "${FOOT_CONFIG_FILE}"

	pkill -SIGUSR2 foot
else
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
	# sed -i "s/ivory/tavern/" "${ALACRITTY_CONFIG_FILE}"
	sed -i "s/features = ivory/features = tavern/" "${GIT_CONFIG_FILE}"
	sed -i "s/ivory/tavern/" "${NVIM_CONFIG_FILE}"
	sed -i "s/initial-color-theme=2/initial-color-theme=1/" "${FOOT_CONFIG_FILE}"

	pkill -SIGUSR1 foot
fi
