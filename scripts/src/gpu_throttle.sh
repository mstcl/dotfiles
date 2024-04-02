#!/usr/bin/env bash

# Run as root!

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'
PLIM=125
LO_C=0
HI_C=1900
OFFSET=200


echo -e "THE FOLLOWING SETTINGS WILL BE MADE:\n"
echo -e "- ${GREEN}Persistence mode ${BLUE}ON${NC}"
echo -e "\n\t${RED}\$ nvidia-smi -pm 1${NC}\n"
echo -e "- ${GREEN}Power limit ⇒ ${BLUE}${PLIM}${NC}"
echo -e "\n\t${RED}\$ nvidia-smi -i 0 -pl ${PLIM}${NC}\n"
echo -e "- ${GREEN}Clock ranges ∈ ${BLUE}[${LO_C}, ${HI_C}]${NC}"
echo -e "\n\t${RED}\$ nvidia-smi -lgc ${LO_C},${HI_C}${NC}\n"
echo -e "- ${GREEN}Clock offset ⇒ ${BLUE}+${OFFSET}${NC}"
echo -e "\n\t${RED}\$ nvidia-settings -a GPUGraphicsClockOffsetAllPerformanceLevels=${OFFSET}${NC}\n"

read -r -p "CONTINUE [y/n]? " choice
case "$choice" in 
  y|Y )
        nvidia-smi -pm 1;
        nvidia-smi -i 0 -pl "$PLIM";
        nvidia-smi -lgc "$LO_C","$HI_C";
        nvidia-settings -a GPUGraphicsClockOffsetAllPerformanceLevels="$OFFSET";
        echo "All done."
      ;;
  n|N ) ;;
  * ) echo "Invalid";;
esac
