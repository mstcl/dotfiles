#!/bin/bash

tmp_file=$(mktemp)
launch_foot $SHELL -lc \
	"nvim -c startinsert -c 'setlocal spell' -c 'set ft=markdown' ${tmp_file}" &&
	xclip -selection clipboard <$tmp_file
