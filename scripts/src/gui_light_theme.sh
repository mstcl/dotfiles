#!/usr/bin/env bash

set -u

gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
# sed -i "s/tavern/ivory/" "${ALACRITTY_CONFIG_FILE}"
sed -i "s/features = tavern/features = ivory/" "${GIT_CONFIG_FILE}"
sed -i "s/tavern/ivory/" "${NVIM_CONFIG_FILE}"
sed -i "s/initial-color-theme=1/initial-color-theme=2/" "${FOOT_CONFIG_FILE}"

pkill -SIGUSR2 foot
pkill -SIGUSR1 nvim
