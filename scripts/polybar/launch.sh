#!/usr/bin/env bash

dir="$HOME/scripts/polybar"
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -q main -c "$dir/bar/config.ini" &
sleep 1
i3-msg restart
