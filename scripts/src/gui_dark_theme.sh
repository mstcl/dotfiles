#!/usr/bin/env bash

set -u

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# sed -i "s/ivory/tavern/" "${ALACRITTY_CONFIG_FILE}"
sed -i "s/features = ivory/features = tavern/" "${GIT_CONFIG_FILE}"
sed -i "s/ivory/tavern/" "${NVIM_CONFIG_FILE}"
sed -i "s/initial-color-theme=2/initial-color-theme=1/" "${FOOT_CONFIG_FILE}"

pkill -SIGUSR1 foot
pkill -SIGUSR1 nvim
