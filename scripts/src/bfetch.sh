#!/usr/bin/env bash

# sysinfo: A sort of custom script
# Thanks to u/x_ero for his sysinfo script
# Also thanks to mysterious person for their fetch script; allowing for center
# padding
# Author: mstcl

# color escapes
BLK="\e[30m"
RED="\e[31m"
GRN="\e[32m"
YLW="\e[33m"
BLU="\e[34m"
PUR="\e[35m"
CYN="\e[36m"
WHT="\e[37m"
GRY="\e[90;1m"
RST="\e[0m"
BLD="\033[1m"

PBLK=$(printf "%b" "\x1b[38;2;58;58;58m")
PRED=$(printf "%b" "\e[31m")
PGRN=$(printf "%b" "\e[32m")
PYLW=$(printf "%b" "\e[33m")
PBLU=$(printf "%b" "\e[34m")
PPUR=$(printf "%b" "\e[35m")
PCYN=$(printf "%b" "\e[36m")
PWHT=$(printf "%b" "\e[37m")
PGRY=$(printf "%b" "\e[90;1m")
PRST=$(printf "%b" "\e[0m")
PBLD=$(printf "%b" "\033[1m")

# vars
# FULL=▓
# EMPTY=░
FULL=━
EMPTY=━
# FULL=─
# FULL=┅
# EMPTY=┄

name=$USER
host=$(uname -n)
battery=/sys/class/power_supply/BAT1
distro=$(lsb_release -ds | tr -d '"' | cut -d " " -f1 )
kernel=$(echo -e $(uname -r | cut -d "." -f 1,2))
patch=$(echo -e $(uname -r | cut -d "-" -f 3,4))
pkgs=$(paru -Qqs | wc -l)
wm=$XDG_CURRENT_DESKTOP
shell=$(basename $(printenv SHELL))
term=$(echo -e $TERM | cut -d "-" -f2)
uptm=$(uptime -p | sed -e 's/hour/hr/' -e 's/hours/hrs/' -e 's/minutes/mins/' -e 's/minute/min/' -e 's/up //')

#Cleanup first
clear

# find the center of the screen
COL=$(tput cols)
ROW=$(tput lines)
((PADY = ROW / 2 - 10 - 22 / 2))
((PADX = COL / 2 - 34 / 2))

for ((i = 0; i < PADX; ++i)); do
    PADC="$PADC "
done

for ((i = 0; i < PADY; ++i)); do
    PADR="$PADR\n"
done

# vertical padding
printf "%b" "$PADR"
printf "\n"

PADXX=$((PADX - 3))
for ((i = 0; i < PADXX; ++i)); do
    PADCC="$PADCC "
done

# # Ascii art arms
# cat <<EOF
# $PADCC$PBLD$PYLW                           |^^^|
# $PADCC                            $PGRY}_{
# $PADCC                            }_{$PYLW
# $PADCC                        /|_/$PGRN---$PYLW\\_|\\
# $PADCC                        I _|$PGRN\\_/$PYLW|_ I
# $PADCC                        \\| $PGRY| | | $PYLW|/
# $PADCC       $PGRY|\\ ${PRED}_..--.._ $PGRY/|      | | |
# $PADCC       $PRED|############|$PGRY      | | |
# $PADCC        $PRED)##########($PGRY       | | |
# $PADCC     ._$PRED/##$PGRY.'$PGRY//\\\\$PGRY'.$PRED##\\${PGRY}_.    | | |
# $PADCC      .__$PRED)#$PGRY((()))$PRED#(${PGRY}__.     | | |
# $PADCC       $PRED\\##$PGRY'.\\\\//$PGRY.'$PRED##/$PGRY      | | |
# $PADCC        $PRED\\####$PGRY\\/$PRED####/$PGRY       | | |
# $PADCC        /,.$PRED######$PGRY.,\\       | | |
# $PADCC       (  $PRED\\##${PGRY}__$PRED##/$PGRY  )      | | |
# $PADCC           $PRED"($PGRY\\/$PRED)"$PGRY          | | |
# $PADCC             )(            | | |
# $PADCC                           | | |
# $PADCC                           | | |
# $PADCC                           \\   /
# $PADCC                            \\ /
# $PADCC                             Y
# EOF
cat <<EOF




EOF

# BAR="█▓▒░"
# OUTT="$GRY$BAR$RED$BAR$GRN$BAR$YLW$BAR$BLU$BAR$PUR$BAR$CYN$BAR$WHT$BAR$RST"
# printf "%s%b" "$PADC" "$OUTT"
# printf "\n\n"

i=0
printf "%s%b" "$PADC"
while [ $i -le 6 ]
do
    printf "\e[$((i+41))m\e[$((i+30))m█▓▒░"
    i=$(($i+1))
done
printf "\e[37m█\e[0m▒░\n\n"

# greetings
printf "%s%b" "$PADC" "        Hello $RED$BLD$name$RST\n"
printf "%s%b" "$PADC" "      Welcome to $GRN$BLD$host$RST\n\n"
#printf "%s%b" "$PADC" "i've been awake for $CYN$BLD$uptm$RST\n\n"

# environment
printf "%s%b" "$PADC" "$YLW        Distro $GRY⏹ $RST$distro\n"
printf "%s%b" "$PADC" "$YLW        Kernel $GRY⏹ $RST$kernel\n"
printf "%s%b" "$PADC" "$YLW         Patch $GRY⏹ $RST$patch\n"
printf "%s%b" "$PADC" "$YLW      Packages $GRY⏹ $RST$pkgs\n"
printf "%s%b" "$PADC" "$YLW         Shell $GRY⏹ $RST$shell\n"
printf "%s%b" "$PADC" "$YLW          Term $GRY⏹ $RST$term\n"
printf "%s%b" "$PADC" "$YLW            WM $GRY⏹ $RST$wm\n"
# printf "%s%b" "$PADC" "$YLW        colors $GRY⏹ $RST$colors\n"
printf " $RST\n"

# progress bar
draw() {
    perc=$1
    size=$2
    inc=$((perc * size / 100))
    out=
    color="$3"
    for v in $(seq 0 $((size - 1))); do
        test "$v" -le "$inc" &&
            out="${out}\e[1;${color}m${FULL}" ||
            out="${out}\e[0;90m${EMPTY}"
        done
        printf $out
    }

# cpu
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
c_lvl=$(printf "%.0f" $cpu)
printf "%b" "$PADC"
printf "   $PUR%-4s $WHT%-5s %-25s \n" " CPU" "$c_lvl%" $(draw $c_lvl 15 35)

# ram
ram=$(free | awk '/Mem:/ {print int($3/$2 * 100.0)}')
printf "%b" "$RST$PADC"
printf "   $PUR%-4s $WHT%-5s %-25s \n" " RAM" "$ram%" $(draw $ram 15 35)

# temperature
# temp=$(sensors | awk '/AUXTIN0/ {gsub(/\+/,"",$2); gsub(/\..+/,"",$2)    ; print $2}')
# printf "%b" "$RST$PADC"
# printf "   $PUR%-4s $WHT%-5s %-25s \n\n" " TMP" "$temp°c " $(draw $temp 15 35)

# hide the cursor and wait for user input
tput civis
read -n 1

# give the cursor back
tput cnorm
