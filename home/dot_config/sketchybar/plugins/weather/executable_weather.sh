#!/bin/bash

source "$HOME/.config/sketchybar/functions.sh"

API_KEY="$(secret .weather.api_key)"
LOCATION="$(secret .weather.location)" 

data=$(curl -s "http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$LOCATION")
condition=$(echo $data | jq -r '.current.condition.code')
if [[ "$(yaml ".item.weather.celsius")" = true ]]; then
  temperature="$(echo $data | jq -r '.current.temp_c')"
else
  temperature="$(echo $data | jq -r '.current.temp_f')"
fi
humidity=$(echo $data | jq -r '.current.humidity')
is_day=$(echo $data | jq -r '.current.is_day')

[ "$is_day" = "1" ] && day_night="day" || day_night="night"

sketchybar -m \
    --set $NAME \
        icon="$(yaml ".item.weather.icon_code.${day_night}.${condition}")" \
        label="${temperature}°"

