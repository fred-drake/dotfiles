TEMPIFS="$IFS"
IFS=$'\n'
wifi_args=($(explode_args "item.wifi.args.wifi"))
bracket_args=($(explode_args "item.wifi.args.bracket"))
IFS="$TEMPIFS"

eval sketchybar -m                                              \
    --add item wifi "$(yaml ".item.wifi.position")"             \
        --set wifi                                              \
            script="$HOME/.config/sketchybar/plugins/wifi/wifi.sh"   \
            "${wifi_args[@]}"                                   \
    --add bracket wifi_bracket '/wifi/'                        \
        --set wifi_bracket "${bracket_args[@]}"
