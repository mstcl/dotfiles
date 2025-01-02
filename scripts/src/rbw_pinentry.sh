#!/usr/bin/env sh

# Pinentry depending on session

if [ -z ${SSH_TTY} ]; then
	pinentry-gnome3
else
	pinentry-curses
fi
