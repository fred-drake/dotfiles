TEMPIFS="$IFS"
IFS=$'\n'
uptime_kuma_args=($(explode_args "item.uptime_kuma.args.uptime_kuma"))
bracket_args=($(explode_args "item.uptime_kuma.args.bracket"))
IFS="$TEMPIFS"

eval sketchybar -m                                                                \
    --add item uptime_kuma "$(yaml ".item.uptime_kuma.position")"                 \
        --set uptime_kuma                                                         \
            script="$HOME/.config/sketchybar/plugins/uptime_kuma/uptime_kuma.sh"  \
            "${uptime_kuma_args[@]}"                                              \
    --add bracket uptime_kuma_bracket '/uptime_kuma/'                             \
        --set uptime_kuma_bracket                                                 \
            "${bracket_args[@]}"
