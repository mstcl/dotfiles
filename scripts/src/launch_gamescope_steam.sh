#!/bin/sh

PROTON_ENABLE_WAYLAND=1
PROTON_USE_NTSYNC=1

gamescope \
	-r 165 \
	-W 3440 \
	-H 1440 \
	-w 3440 \
	-h 1440 \
	--force-windows-fullscreen \
	--hdr-enabled \
	--rt \
	--adaptive-sync \
	--backend=wayland \
	--mangoapp \
	--force-grab-cursor \
	--fullscreen \
	-- steam
