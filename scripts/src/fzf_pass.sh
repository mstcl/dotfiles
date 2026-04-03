#!/bin/bash

set -eEuo pipefail
rbw unlocked &>/dev/null || rbw unlock

source ~/.local/bin/,fzf_defaults

name=$(
	rbw ls --fields name | tr "\t" "," |
		sort |
		fzf -d ',' \
			--footer="rbw vault" \
			--header-label="commands" \
			--header=$'\e[1;31m<left>\e[0m copy pass \e[1;31m<right>\e[0m copy totp\n\e[1;31m<enter>\e[0m copy pass & quit\n' \
			--preview-window hidden \
			--bind '?:unbind(?)' \
			--bind 'left:execute(rbw get {1} | nohup wl-copy -n >/dev/null 2>&1)' \
			--bind 'right:execute(rbw code {1} | nohup wl-copy -n >/dev/null 2>&1)' \
			--bind 'enter:become(echo {1})'
)

if [[ $name == "" ]]; then
	exit
fi

rbw get "$name" | nohup wl-copy -n >/dev/null 2>&1
