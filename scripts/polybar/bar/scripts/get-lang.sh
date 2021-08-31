#!/bin/bash
KM=$(ibus engine)

if [ "$KM" = "Unikey" ]
then
    echo "vn"
else
    if [ "$KM" = "xkb:us::eng" ]
    then
        echo "en"
    fi
fi
