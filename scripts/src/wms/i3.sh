#! /bin/sh

/usr/bin/lxqt-policykit-agent &

setxkbmap -option compose:menu &
xrdb -load $HOME/.config/X11/Xresources &
xmodmap $HOME/.config/X11/Xmodmap &
xscreensaver --no-splash &
xbanish &
xss-lock --ignore-sleep -- xscreensaver-command -lock &
sxhkd &
dunst &
fcitx5 &

exec i3
