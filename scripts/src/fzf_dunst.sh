source ~/.local/bin/,fzf_defaults

dunstctl history | jq -r \
	'.data[0][] | "\(.id.data)\t\u001b[1;33m\(.summary.data)\u001b[0m\t\(.appname.data)"' |
	fzf --ansi -d '\t' --with-nth '2,3' \
		--preview-window 6:down:border-sharp:nohidden \
		--preview "dunstctl history | jq -c '.data[0][] | select(.id.data == {1})' | jq -r '.body.data'" \
		--header=$'\e[1;34m<ctrl-x>\e[0m exit & clear history\n\n' \
		--border-label='Saved notifications' \
		--bind 'ctrl-x:execute(dunstctl history-clear)+abort'
