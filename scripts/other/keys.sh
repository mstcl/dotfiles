#!/usr/bin/env bash

kitty -o font_size=13 -o tab_bar_min_tabs=2 -T keysHelp -e  $SHELL -lc "i3-msg workspace '11:A' && bat ~/.config/sxhkd/sxhkdrc && i3-msg workspace back_and_forth"
