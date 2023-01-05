#!/bin/bash

source "$HOME/.config/sketchybar/functions.sh"

TEMPIFS="$IFS"
IFS=$'\n'
wifi_up_args=($(explode_args "item.wifi.args.wifi_up"))
wifi_down_args=($(explode_args "item.wifi.args.wifi_down"))
IFS="$TEMPIFS"


CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

if [ "$SSID" = "" ]; then
  eval sketchybar --set "$NAME" "${wifi_down_args[@]}"
else
  eval sketchybar --set $NAME label="$SSID" "${wifi_up_args[@]}"
fi
