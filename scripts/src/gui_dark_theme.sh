#!/usr/bin/env bash

set -u

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# sed -i "s/ivory/tavern/" "${ALACRITTY_CONFIG_FILE}"
sed -i "s/features = ivory/features = tavern/" "${GIT_CONFIG_FILE}"
sed -i "s/ivory/tavern/" "${NVIM_CONFIG_FILE}"
sed -i "s/initial-color-theme=light/initial-color-theme=dark/" "${FOOT_CONFIG_FILE}"

pkill -SIGUSR1 foot || true
pkill -SIGUSR1 nvim || true
