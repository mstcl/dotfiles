#!/bin/bash

export PROTON_ENABLE_HDR=0
export PROTON_ENABLE_WAYLAND=1
export PROTON_NO_WM_DECORATION=1
export PROTON_USE_NTSYNC=1
export PROTON_NO_FSYNC=1
export PROTON_NO_ESYNC=1
export WINEDLLOVERRIDES='dinput8=n,b'

exec game-performance mangohud "$@" -fullscreen -screen-width 3440 -screen-height 1440
