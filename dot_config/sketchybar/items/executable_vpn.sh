TEMPIFS="$IFS"
IFS=$'\n'
vpn_args=($(explode_args "item.vpn.args.vpn"))
bracket_args=($(explode_args "item.vpn.args.bracket"))
IFS="$TEMPIFS"

eval sketchybar -m                                        \
    --add item vpn "$(yaml ".item.vpn.position")"         \
        --set vpn                                         \
            script="~/.config/sketchybar/plugins/vpn/vpn.sh"  \
            "${vpn_args[@]}"
