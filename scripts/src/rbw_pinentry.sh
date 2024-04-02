#!/usr/bin/env sh

# Pinentry depending on session

if [ -z ${XDG_CURRENT_DESKTOP+x} ]; then
	pinentry-curses
else
	pinentry-qt
fi
