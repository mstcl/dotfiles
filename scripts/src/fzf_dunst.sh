#!/bin/bash

source ~/.local/bin/fzf_defaults

dunstctl history | jq -r \
	'.data[0][] | "\(.id.data)\t\u001b[1;33m\(.summary.data)\u001b[0m\t\(.appname.data)"' |
	fzf --ansi -d '\t' --with-nth '2,3' \
		--preview "dunstctl history | jq -c '.data[0][] | select(.id.data == {1})' | jq -r '.body.data'" \
		--border-label='Saved notifications'
