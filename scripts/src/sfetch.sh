#!/bin/bash
# Colors
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
DARKGRAY='\033[1;90m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
LIGHTYELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
GRAY='\033[1;37m'

icon="* "

get_uptime() {
    time=$(( $(date +%s) - $(date -d"$(uptime -s)" +%s) ))
    d="$((time / 60 / 60 / 24)) days"
    h="$((time / 60 / 60 % 24)) hours"
    m="$((time / 60 % 60)) minutes"

    ((${d/ *} == 1)) && d=${d/time}
    ((${h/ *} == 1)) && h=${h/time}
    ((${m/ *} == 1)) && m=${m/time}

    ((${d/ *} == 0)) && unset d
    ((${h/ *} == 0)) && unset h
    ((${m/ *} == 0)) && unset m

    uptime=${d:+$d, }${h:+$h, }$m
    uptime=${uptime%', '}
    uptime=${uptime:-$s seconds}

    uptime=${uptime/ days/d}
    uptime=${uptime/ day/d}
    uptime=${uptime/ hours/h}
    uptime=${uptime/ hour/h}
    uptime=${uptime/ minutes/m}
    uptime=${uptime/ minute/m}
    uptime=${uptime/ seconds/s}
    uptime=${uptime//,}

    echo -e "${DARKGRAY} ${LIGHTRED}$icon${NOCOLOR} up${DARKGRAY} ${GRAY}$uptime${NOCOLOR}  ${DARKGRAY}"
}

get_distro() {
    distro=$(lsb_release -ds | tr -d '"' | awk '{print tolower($0)}' | cut -d " " -f1 )
    echo -e "${DARKGRAY} ${RED}$icon${NOCOLOR} os${DARKGRAY} ${GRAY}$distro${NOCOLOR}    ${DARKGRAY}"
}

get_packages() {
    packages=$(pacman -Q | wc -l)
    echo -e "${DARKGRAY} ${GREEN}$icon${NOCOLOR} pk${DARKGRAY} ${GRAY}$packages${NOCOLOR}    ${DARKGRAY}"
}

get_term() {
    term=$(echo -e $TERM | cut -d "-" -f2)
    echo -e "${DARKGRAY} ${YELLOW}$icon${NOCOLOR} tm${DARKGRAY} ${GRAY}$term${NOCOLOR}   ${DARKGRAY}"
}

get_wm() {
    wm=$XDG_CURRENT_DESKTOP
    echo -e "${DARKGRAY} ${BLUE}$icon${NOCOLOR} wm${DARKGRAY} ${GRAY}$wm"${NOCOLOR} ${DARKGRAY}
}

get_shell() {
    shell=$(echo -e $SHELL | cut -d "/" -f4)
    echo -e "${DARKGRAY} ${PURPLE}$icon${NOCOLOR} sh${DARKGRAY} ${GRAY}$shell${NOCOLOR}     ${DARKGRAY}"
}

get_kernel() {
    kernel=$(echo -e $(uname -r | cut -d "." -f 1,2))
    echo -e "${DARKGRAY} ${CYAN}$icon${NOCOLOR} kr${DARKGRAY} ${GRAY}$kernel${NOCOLOR} ${DARKGRAY}"
}

get_weather() {
    weather=$(curl -s 'wttr.in/Bristol?format=3&M' | cut -d ·  -f2)
    echo -e "${DARKGRAY} ${WHITE}$icon${NOCOLOR} wt${DARKGRAY}${GRAY}$weather${NOCOLOR}${DARKGRAY}"
}
echo -e ""
get_distro
get_kernel
get_packages
get_shell
get_term
get_wm
# get_weather
# get_uptime
echo -e ""
