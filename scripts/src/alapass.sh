#!/usr/bin/env sh
#
# Use rbw and fzf to get password

alacritty msg create-window --class=launcher --command fzf_pass || alacritty --class=launcher --command fzf_pass
