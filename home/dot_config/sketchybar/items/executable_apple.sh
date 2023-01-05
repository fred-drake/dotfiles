TEMPIFS="$IFS"
IFS=$'\n'
apple_args=($(explode_args "item.apple.args.apple"))
bracket_args=($(explode_args "item.apple.args.bracket"))
IFS="$TEMPIFS"
eval sketchybar -m                                            \
    --add item apple_apple "$(yaml ".item.apple.position")"   \
        --set apple_apple "${apple_args[@]}"                  \
                                                              \
    --add  bracket apple_bracket  '/apple_.*/'                \
        --set  apple_bracket "${bracket_args[@]}"
