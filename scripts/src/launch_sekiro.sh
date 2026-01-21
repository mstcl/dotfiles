#!/bin/bash

~/.local/bin/sekirofpsunlock 30 set-resolution 3440 3440 1440 set-fps 165 &

export PROTON_ENABLE_HDR=0
export PROTON_ENABLE_WAYLAND=0
export PROTON_NO_WM_DECORATION=0
export WINEDLLOVERRIDES="dinput8.dll=n,b"

exec game-performance mangohud "$@"
