#!/usr/bin/env bash

# rlaunch --color0 "#c8beb7" --color1 "#e9e5e2" --color2 "#630e49" --color3 "#630e49" --color4 "#630e49" --font "scientifica:pixelsize=22" --height 40
# dmenu_run --nb "#c8beb7" --nf "#630e49" --sb "#630e49" --sf "#e9e5e2" --font "scientifica:pixelsize=22" --render_minheight 40 "$@"
j4-dmenu-desktop --dmenu="dmenu_default -p 'Launch:'" --term="i3-sensible-terminal" --use-xdg-de --no-generic
