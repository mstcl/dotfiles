#!/usr/bin/env sh

nvidia-settings --assign CurrentMetaMode="DP-2: 1920x1080_144 +0+0 {ForceCompositionPipeline=Off, ForceFullCompositionPipeline=Off,AllowGSYNCCompatible=On}"
xrandr --output DP-4 --off
