#!/bin/bash

set -eEuo pipefail
rbw unlocked &>/dev/null || rbw unlock

source ~/.local/bin/fzf_defaults

name=$(rbw ls --fields name,folder,user |
	sort |
	fzf -d '\t' --with-nth 1 \
		--header=$'\e[1;31m<left>\e[0m copy pass \e[1;31m<right>\e[0m copy totp\n\e[1;31m<enter>\e[0m copy pass & quit\n\n' \
		--preview-window 3:down \
		--bind 'left:execute(rbw get {1} | nohup wl-copy -n >/dev/null 2>&1)' \
		--bind 'right:execute(rbw code {1} | nohup wl-copy -n >/dev/null 2>&1)' \
		--bind 'enter:become(echo {1})' \
		--preview="echo 'Folder: {2}\nUser: {3}\n'")

if [[ $name == "" ]]; then
	exit
fi

rbw get "$name" | nohup wl-copy -n >/dev/null 2>&1
