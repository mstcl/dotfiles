#!/bin/bash

source ~/.local/bin/fzf_defaults

cmd=$(j4-dmenu-desktop --log-level="ERROR" --skip-i3-exec-check --no-exec --dmenu="fzf --border-label='Launcher' --bind 'enter:accept'" | tr -d "'")

[[ -n "$cmd" ]] && niri msg action spawn -- "$cmd"
