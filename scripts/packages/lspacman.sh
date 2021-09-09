#!/bin/bash

db="/tmp/pkg_db"
xorg="/tmp/pkg_xorg"
base="/tmp/pkg_base"
basedevel="/tmp/pkg_base-devel"
tmp="/tmp/pkg_temp"

pacman -Qqet           | sort -u > $db
pacman -Qqg xorg       | sort -u > $xorg
pacman -Qqg base       | sort -u > $base
pacman -Qqg base-devel | sort -u > $basedevel

comm -23 $db $xorg > $tmp
cat $tmp > $db
comm -23 $db $base > $tmp
cat $tmp > $db
comm -23 $db $basedevel
