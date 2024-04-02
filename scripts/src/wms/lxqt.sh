#! /bin/sh

xrdb -load $HOME/.config/X11/Xresources &
xmodmap $HOME/.config/X11/Xmodmap &
export XDG_CURRENT_DESKTOP=LXQt
export XDG_SESSION_DESKTOP=LXQt
sxhkd &

exec startlxqt
