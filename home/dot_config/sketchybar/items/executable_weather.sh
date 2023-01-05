TEMPIFS="$IFS"
IFS=$'\n'
weather_args=($(explode_args "item.weather.args.weather"))
bracket_args=($(explode_args "item.weather.args.bracket"))
IFS="$TEMPIFS"

eval sketchybar -m                                                        \
    --add item weather "$(yaml ".item.weather.position")"                 \
        --set weather                                                     \
            script="$PLUGIN_DIR/weather/weather.sh"                               \
            "${weather_args[@]}"                                          \
    --add bracket weather_bracket '/weather/'                             \
        --set weather_bracket "${bracket_args[@]}"

