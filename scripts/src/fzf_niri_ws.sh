#!/usr/bin/env bash

set -eEuo pipefail

source ~/.local/bin/,fzf_defaults

niri msg -j workspaces |
	jq --arg OUTPUT "$(niri msg -j focused-output | jq -r '.name')" -r '.[] | select( .output==$OUTPUT ) | "\(.idx)\t\(.name // "")"' |
	sort -n |
	fzf --with-nth 1..2 --delimiter "\t" --bind '?:unbind(?)' |
	cut -f 1 |
	xargs -I {} niri msg action focus-workspace {}
