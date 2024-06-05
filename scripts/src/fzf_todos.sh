#/usr/bin/env bash

source ~/.local/bin/fzf_defaults

todo --porcelain list |
	jq -r '.[] | "\(.id|tostring)\t\(.summary)"' |
	fzf --with-nth 2 -d "\t" \
		--header=$'\e[1;34m<ctrl-e>\e[0m edit \e[1;34m<ctrl-x>\e[0m mark done' \
		--preview-window "hidden" \
		--preview "todo -h show {1}" \
		--bind 'ctrl-n:preview-up' \
		--bind 'ctrl-p:preview-down' \
		--bind='ctrl-e:become(todo edit {1})' \
		--bind='ctrl-x:become(todo done {1})'
