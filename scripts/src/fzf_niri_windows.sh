#!/usr/bin/env bash

set -eEuo pipefail

source ~/.local/bin/,fzf_defaults

niri msg -j windows |
	jq -r '.[] | "\(.id)\t\(.title // "") (\(.app_id))"' |
	sort -n |
	sed 's/ — Mozilla Firefox//g' |
	fzf --delimiter "\t" --with-nth 1..2 \
		--preview 'echo {2}' \
		--preview-window 6:down:border-sharp |
	cut -f 1 |
	xargs -I {} niri msg action focus-window --id {}
