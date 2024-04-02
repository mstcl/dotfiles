#!/bin/bash

nvidia-settings --assign CurrentMetaMode="DP-2: 1920x1080_144 +1080+411 {ForceCompositionPipeline=Off, ForceFullCompositionPipeline=Off,AllowGSYNCCompatible=On}, DP-4: 1920x1080_75 +0+0 {rotation=left, ForceCompositionPipeline=Off, ForceFullCompositionPipeline=Off}"
xrandr --output DP-4 --mode 1920x1080 --rate 74.97
