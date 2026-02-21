#!/bin/bash

source ~/.local/bin/,fzf_defaults

cid=$(clipcatctl list | sort | fzf -d ': ' --with-nth '2' --preview 'echo $(clipcatctl get {1})' \
	--header=$'\e[1;34m<ctrl-x>\e[0m exit & clear \e[1;34m<ctrl-r>\e[0m reload\n\e[1;34m<enter>\e[0m copy\e[1;34m<left>\e[0m remove\n\n' \
	--border-label='Cached clipboard' \
	--bind 'enter:become(echo {1})' \
	--bind 'ctrl-x:execute(clipcatctl clear)+abort' \
	--bind 'ctrl-r:reload(clipcatctl list)' \
	--bind 'left:execute(clipcatctl remove {1})+reload(clipcatctl list)' \
	--bind 'ctrl-n:preview-up' \
	--bind 'ctrl-p:preview-down')

if [[ $cid == "" ]]; then
	exit
fi

clipcatctl promote $cid
