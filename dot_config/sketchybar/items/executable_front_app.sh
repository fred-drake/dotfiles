TEMPIFS="$IFS"
IFS=$'\n'
front_app_args=($(explode_args "item.front_app.args.front_app"))
bracket_args=($(explode_args "item.front_app.args.bracket"))
IFS="$TEMPIFS"

eval sketchybar -m                                                          \
    --add item front_app_front_app  "$(yaml ".item.front_app.position")"    \
        --set front_app_front_app                                           \
            script="$HOME/.config/sketchybar/plugins/front_app/front_app.sh"          \
            "${front_app_args[@]}"                                          \
        --subscribe front_app_front_app                                     \
            front_app_switched                                              \
    --add bracket front_app_bracket '/front_app_.*/'                        \
        --set front_app_bracket                                             \
            "${bracket_args[@]}"
