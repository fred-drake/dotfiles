#!/bin/bash

VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/' | awk -v d=" / " '{s=(NR==1?s:s d)$0}END{print s}')

if [[ $VPN != "" ]]; then
  sketchybar -m --set $NAME label="$VPN" label.drawing="on" icon.drawing="on"
else
  sketchybar -m --set $NAME label.drawing="off" icon.drawing="off"
fi

