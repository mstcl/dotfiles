#! /bin/sh

xrdb -load $HOME/.config/X11/Xresources &
xmodmap $HOME/.config/X11/Xmodmap &
xscreensaver --no-splash &
xss-lock --ignore-sleep -- xscreensaver-command -lock &
export XDG_CURRENT_DESKTOP=KDE
export XDG_SESSION_DESKTOP=KDE
sxhkd &
/usr/lib/xdg-desktop-portal-kde &
systemctl --user restart xdg-desktop-portal &

exec i3
