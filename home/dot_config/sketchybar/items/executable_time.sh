TEMPIFS="$IFS"
IFS=$'\n'
time_args=($(explode_args "item.time.args.time"))
bracket_args=($(explode_args "item.time.args.bracket"))
IFS="$TEMPIFS"

eval sketchybar -m                                          \
    --add item time "$(yaml ".item.time.position")"         \
        --set time                                          \
            script="~/.config/sketchybar/plugins/time/time.sh"   \
            "${time_args[@]}"                               \
    --add bracket time_bracket '/time/'                     \
        --set time_bracket "${bracket_args[@]}"
