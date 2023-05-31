#!/usr/bin/env bash

notify-send -t 1000 --icon="window" "$1" "$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)"
