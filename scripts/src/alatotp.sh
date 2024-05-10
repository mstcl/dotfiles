#!/usr/bin/env sh
#
# Use rbw and fzf to get TOTP

alacritty msg create-window --class=launcher --command fzf_totp || alacritty --class=launcher --command fzf_pass
