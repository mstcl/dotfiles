#! /bin/sh

xrdb -load $HOME/.config/X11/Xresources &
xmodmap $HOME/.config/X11/Xmodmap &
xss-lock --transfer-sleep-lock -- sh $HOME/scripts/bin/lockscreen &
xset s off &
xset -dpms &
sxhkd &

exec i3
