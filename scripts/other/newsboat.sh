#!/usr/bin/env bash

kitty @ --to unix:/tmp/mykitty launch --type=tab --tab-title "newsboat" newsboat
sleep 0.1
kitty @ --to unix:/tmp/mykitty set-spacing --match title:newsboat padding=0
