#!/bin/bash

set -eEuo pipefail
rbw unlocked &>/dev/null || rbw unlock

source ~/.local/bin/fzf_defaults

name=$(rbw ls --fields name,folder,user |
	sort |
	fzf -d '\t' --with-nth 1 \
		--header=$'\e[1;34m<left>\e[0m copy pass \e[1;34m<right>\e[0m copy totp\n\e[1;34m<enter>\e[0m copy pass & quit\n\n' \
		--border-label='Get password' \
		--bind 'left:execute(clipcatctl disable-watcher; rbw get {1} | nohup xclip -loops 0 -r -sel c >/dev/null 2>&1; clipcatctl enable-watcher)' \
		--bind 'right:execute(clipcatctl disable-watcher; rbw code {1} | nohup xclip -loops 0 -r -sel c >/dev/null 2>&1; clipcatctl enable-watcher)' \
		--bind 'enter:become(echo {1})' \
		--preview="echo 'Folder: {2}\nUser: {3}\n'")

if [[ $name == "" ]]; then
	exit
fi

clipcatctl disable-watcher >/dev/null
rbw get $name | nohup xclip -loops 0 -r -sel c >/dev/null 2>&1
clipcatctl enable-watcher >/dev/null
