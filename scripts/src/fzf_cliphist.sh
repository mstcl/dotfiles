#!/bin/bash

source ~/.local/bin/fzf_defaults

cid=$(cliphist list | fzf -d'\t' --with-nth 2 --preview 'echo $(cliphist decode {1})' \
	--header=$'\e[1;34m<ctrl-x>\e[0m exit & clear \e[1;34m<ctrl-r>\e[0m reload\n\e[1;34m<enter>\e[0m copy \e[1;34m<left>\e[0m remove\n\n' \
	--border-label='Cached clipboard' \
	--bind 'enter:become(echo {1})' \
	--bind 'ctrl-x:execute(cliphist wipe)+abort' \
	--bind 'ctrl-r:reload(cliphist list)' \
	--bind 'left:execute(cliphist delete-query {2})+reload(cliphist list)' \
	--bind 'ctrl-n:preview-up' \
	--bind 'ctrl-p:preview-down')

if [[ $cid == "" ]]; then
	exit
fi

cliphist decode $cid | wl-copy -n
