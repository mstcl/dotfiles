#!/usr/bin/env bash

status=$(dunstctl is-paused)
if [ "$status" == 'false' ]
then
    echo " "
else
    echo " "
fi
