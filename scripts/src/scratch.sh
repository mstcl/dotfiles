#!/bin/bash

tmp_file=$(mktemp)
alacritty --class=launcher --command $SHELL -lc \
	"nvim -c startinsert -c 'setlocal spell' -c 'set ft=markdown' ${tmp_file}" &&
	xclip -selection clipboard <$tmp_file
