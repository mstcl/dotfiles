#!/usr/bin/env sh

# Pinentry depending on session

if [ -z ${SSH_TTY} ]; then
	pinentry-qt
else
	pinentry-curses
fi
