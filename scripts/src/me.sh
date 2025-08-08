#!/bin/sh
# read system info
read -r host < /proc/sys/kernel/hostname
read -r kernel < /proc/sys/kernel/osrelease
. /etc/os-release

# Get wm from xinitrc
wm=$XDG_CURRENT_DESKTOP

# Colors and palette method stolen from dylanaraps pftech
c0='\033[0m'
c1='\033[31m'
c2='\033[32m'
c3='\033[33m'
c4='\033[34m'
c5='\033[35m'
c6='\033[36m'
c7='\033[37m'
c8='\033[30m'
palette="⬤$c1 ⬤$c2 ⬤$c3 ⬤$c4 ⬤$c5 ⬤$c6 ⬤$c7 ⬤$c8"

# Output
echo -e "
 ${USER}${c0}@${c5}${host}
 ${c6}os${c0}      ${PRETTY_NAME}
 ${ARTR3}${c6}kernel${c0}  ${kernel}
 ${c6}shell${c0}   ${SHELL##*/}
 ${c6}wm${c0}      ${wm}

 ${palette}
" | awk '{print tolower($0)}'
