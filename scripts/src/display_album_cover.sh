#!/bin/bash
kitty +kitten icat --align right --silent --place 20x20@0x0 $(playerctl metadata mpris:artUrl) 2>/dev/null

while true
do
  COVER=$(playerctl metadata mpris:artUrl) 2>/dev/null
  wait
  sleep 1
  if [ $(playerctl metadata mpris:artUrl) == "$COVER" ]
  then
    :
  else
    ACOVER=$(playerctl metadata mpris:artUrl) 2>/dev/null
    clear
    wait
    kitty +kitten icat --silent --align right --place 20x20@0x0 "$ACOVER" 2>/dev/null
  fi
done
