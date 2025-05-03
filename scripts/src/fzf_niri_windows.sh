#!/usr/bin/env bash

niri msg -j windows |
  jq -r '.[] | "\(.id)\t\(.title // "") (\(.app_id))"' |
  sort -n |
  sed 's/ — Mozilla Firefox//g' |
  fzf --delimiter "\t" --with-nth 1..2 |
  cut -f 1 |
  xargs -I {} niri msg action focus-window --id {}
