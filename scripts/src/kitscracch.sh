#!/bin/bash

tmp_file=$(mktemp)
kitty -o font_size=13 -o window_padding_width=0 -o tab_bar_min_tabs=2 \
	-T textScratchpad -e $SHELL -lc \
	"nvim -c startinsert -c 'setlocal spell' -c 'set ft=markdown' ${tmp_file}" &&
	xclip -selection clipboard <$tmp_file
