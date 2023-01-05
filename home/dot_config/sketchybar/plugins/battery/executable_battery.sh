#!/bin/bash

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

TRUE_PCT=$(echo "scale=2 ; $BATT_PERCENT / 100" | bc)
GREEN_DEC=$(echo "$TRUE_PCT * 255 / 1" | bc)
RED_DEC=$[ 255 - $GREEN_DEC ]
COLOR="0xff$(printf '%02x\n' $RED_DEC)$(printf '%02x\n' $GREEN_DEC)33"

if [[ $CHARGING != "" ]]; then
  sketchybar -m --set battery \
    icon.color=$COLOR \
    icon= \
    label=$(printf "${BATT_PERCENT}%%")
  exit 0
fi

case ${BATT_PERCENT} in
   100) ICON="" ;;
    9[0-9]) ICON="" ;;
    8[0-9]) ICON="" ;;
    7[0-9]) ICON="" ;;
    6[0-9]) ICON="" ;;
    5[0-9]) ICON="" ;;
    4[0-9]) ICON="" ;;
    3[0-9]) ICON="" ;;
    2[0-9]) ICON="" ;;
    1[0-9]) ICON="" ;;
    *) ICON=""
esac

sketchybar -m --set battery\
  icon.color=$COLOR \
  icon=$ICON \
  label=$(printf "${BATT_PERCENT}%%")
