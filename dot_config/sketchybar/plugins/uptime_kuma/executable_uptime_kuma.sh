#!/bin/bash

source "$HOME/.config/sketchybar/functions.sh"

TEMPIFS="$IFS"
IFS=$'\n'
up_args=($(explode_args "item.uptime_kuma.args.uptime_kuma_up"))
down_args=($(explode_args "item.uptime_kuma.args.uptime_kuma_down"))
IFS="$TEMPIFS"

URL=$(yaml ".item.uptime_kuma.metrics_url")
UP=$(curl -s "$URL" | grep -c "^monitor_status{.*1$")
DOWN=$(curl -s "$URL" | grep -c "^monitor_status{.*0$")
TOTAL=$[$UP + $DOWN]

LABEL="$(printf "Uptime Kuma: ${UP} / ${TOTAL}")"
if [[ $DOWN == 0 ]]; then
  up_args+=("label=\"$LABEL\"")
  eval sketchybar -m --set $NAME ${up_args[@]}
else
  down_args+=("label=\"$LABEL\"")
  eval sketchybar -m --set $NAME label="$LABEL" ${down_args[@]}
fi
