#!/usr/bin/env bash

set -u

gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
# sed -i "s/tavern/ivory/" "${ALACRITTY_CONFIG_FILE}"
sed -i "s/features = tavern/features = ivory/" "${GIT_CONFIG_FILE}"
sed -i "s/tavern/ivory/" "${NVIM_CONFIG_FILE}"
sed -i "s/initial-color-theme=dark/initial-color-theme=light/" "${FOOT_CONFIG_FILE}"

pkill -SIGUSR2 foot || true
pkill -SIGUSR1 nvim || true
