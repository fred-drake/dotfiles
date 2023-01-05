TEMPIFS="$IFS"
IFS=$'\n'
sketchyargs=($(explode_args "item.battery.args"))
IFS="$TEMPIFS"
if [[ $(profile_contains "battery") == true ]]; then
  eval sketchybar -m                                                \
      --add item battery "$(yaml ".item.battery.position")"         \
          --set battery                                             \
              script="$HOME/.config/sketchybar/plugins/battery/battery.sh"  \
              "${sketchyargs[@]}"
fi
