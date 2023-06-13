#!/bin/bash

# Disable composition pipeline and enable G-sync/Freesync
nvidia-settings --assign CurrentMetaMode="DP-2: 1920x1080_144 +1080+430 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On,AllowGSYNCCompatible=On}, DP-4: 1920x1080_75 +0+0 {rotation=left, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"

#Disable 2º screen
xrandr --output DP-4 --mode 1920x1080 --rate 74.97

feh --no-fehbg --bg-scale --no-xinerama .cache/superpaper/temp/bim-a.png &
