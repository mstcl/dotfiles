#!/usr/bin/env bash
CURRENTDIR=$PWD
if [ "$#" -ne 0 ]; then
    kitty @ --to unix:/tmp/mykitty launch --type=tab --tab-title "nvim" nvim "$PWD"/$1
    sleep 0.1
    kitty @ --to unix:/tmp/mykitty set-spacing --match title:nvim padding=0
else
    if [ "$#" -eq 0 ]; then
        kitty @ --to unix:/tmp/mykitty launch --type=tab --tab-title "nvim" --cwd "$PWD" nvim
        sleep 0.1
        kitty @ --to unix:/tmp/mykitty set-spacing --match title:nvim padding=0
    fi
fi
