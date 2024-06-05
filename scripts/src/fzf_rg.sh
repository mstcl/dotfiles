#!/usr/bin/env bash

rg --line-number --no-heading --smart-case --color=never \
	--no-ignore-vcs --ignore-file ~/.config/fd/ignore "${*:-}" |
	fzf --preview-window=nohidden \
		--border-label="Found matches in the following files" \
		--border=top --preview-window=nohidden:up \
		--delimiter : \
		--preview-window 'up,60%,+{2}+3/3,~3' \
		--preview "bat --style=numbers,header --color=always {1} --highlight-line {2} \
	2> /dev/null" \
		--bind 'enter:become(nvim {1} +{2})'
