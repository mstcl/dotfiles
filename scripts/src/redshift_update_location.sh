#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

lat=$(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | awk 'OFS=":" {print $3,$5}' | tr -d ',}' | cut -d: -f1)
lon=$(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | awk 'OFS=":" {print $3,$5}' | tr -d ',}' | cut -d: -f2)
sed -i '15d' "$HOME"/.config/redshift/redshift.conf
sed -i '14d' "$HOME"/.config/redshift/redshift.conf
echo 'lat='$lat >>"$HOME"/.config/redshift/redshift.conf
echo 'lon='$lon >>"$HOME"/.config/redshift/redshift.conf
