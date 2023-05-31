#!/usr/bin/env bash

i3-msg workspace '11:A' && wezterm --config-file "/home/lckdscl/dotfiles/.config/wezterm/wezterm-nvim.lua" start --class "whole" -e "bat" --color never -r 3:59 ~/.config/sxhkd/sxhkdrc && i3-msg workspace back_and_forth
