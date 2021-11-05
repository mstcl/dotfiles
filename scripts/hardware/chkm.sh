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

xmodmap $HOME/.config/X11/Xmodmap
