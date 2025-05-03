#!/usr/bin/env bash

niri msg -j workspaces |
	jq --arg OUTPUT "$(niri msg -j focused-output | jq -r '.name')" -r '.[] | select( .output==$OUTPUT ) | "\(.idx)\t\(.name // "")"' |
	sort -n |
	fzf --with-nth 1..2 --delimiter "\t" |
	cut -f 1 |
	xargs -I {} niri msg action focus-workspace {}
