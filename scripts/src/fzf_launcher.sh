#!/bin/bash

source ~/.local/bin/fzf_defaults

i3-dmenu-desktop --dmenu="fzf --border-label='Launcher' --bind 'enter:accept'"
