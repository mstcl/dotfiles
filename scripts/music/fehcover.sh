#!/usr/bin/env bash
pid=$(<"$HOME"/.cache/fetchcover-pid.tmp)
kill $pid
bash ~/scripts/music/fetchcover.sh &
feh --class cover --image-bg "#181818" --geometry 200x200 --scale-down --reload 1 /tmp/cover_popup.png
