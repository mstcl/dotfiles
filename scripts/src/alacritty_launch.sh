#!/bin/sh
alacritty msg create-window --class="launcher" --title="launcher" \
	--command $1 || alacritty --class="launcher" --title="launcher" --command $1
