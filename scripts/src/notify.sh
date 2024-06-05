#!/bin/sh

notify-send -e -t 3000 "$(date +%T)" "$(dunstctl count history) notification(s)"
