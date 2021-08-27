#!/bin/bash
CURRENT_ENGINE=$(ibus engine)

if [ "$CURRENT_ENGINE" = "xkb:us::eng" ]
then
    ibus engine Unikey
else
    if [ "$CURRENT_ENGINE" = "Unikey" ]
    then
        ibus engine xkb:us::eng
    fi
fi
killall -q xcape
xmodmap $HOME/.config/X11/Xmodmap
xcape -e 'Mode_switch=Escape'
