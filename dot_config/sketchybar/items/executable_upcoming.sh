TEMPIFS="$IFS"
IFS=$'\n'
meeting_now_args=($(explode_args "item.upcoming.args.meeting_now"))
next_meeting_args=($(explode_args "item.upcoming.args.next_meeting"))
bracket_args=($(explode_args "item.upcoming.args.bracket"))
IFS="$TEMPIFS"

eval sketchybar -m                                                              \
    --add item upcoming_meeting_now "$(yaml ".item.upcoming.position")"         \
        --set upcoming_meeting_now                                              \
            script="$HOME/.config/sketchybar/plugins/upcoming/meeting_now.sh"   \
            "${meeting_now_args[@]}"                                            \
                                                                                \
    --add item upcoming_next_meeting "$(yaml ".item.upcoming.position")"        \
        --set upcoming_next_meeting                                             \
            script="$HOME/.config/sketchybar/plugins/upcoming/next_meeting.sh"  \
            "${next_meeting_args[@]}"                                           \
                                                                                \
    --add  bracket upcoming_bracket  '/upcoming_.*/'                            \
        --set upcoming_bracket                                                  \
            "${bracket_args[@]}"
