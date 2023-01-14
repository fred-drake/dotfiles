#!/bin/bash

CURRENT_OUTPUT=$(SwitchAudioSource -t output -c)

if [[ "$CURRENT_OUTPUT" = "External Headphones" ]]; then
  SwitchAudioSource -t output -s "PRO X Wireless Gaming Headset"
  SwitchAudioSource -t input -s "PRO X Wireless Gaming Headset"
else
  SwitchAudioSource -t output -s "External Headphones"
  SwitchAudioSource -t input -s "NexiGo N60 FHD Webcam"
fi

sketchybar --trigger audio_update
