TEMPIFS="$IFS"
IFS=$'\n'
cpu_label_args=($(explode_args "item.stats.args.cpu_label"))
cpu_percent_args=($(explode_args "item.stats.args.cpu_percent"))
mem_label_args=($(explode_args "item.stats.args.mem_label"))
mem_percent_args=($(explode_args "item.stats.args.mem_percent"))
bracket_args=($(explode_args "item.stats.args.bracket"))
IFS="$TEMPIFS"

eval sketchybar -m                                                  \
    --add item stats_cpu_label "$(yaml ".item.stats.position")"     \
        --set stats_cpu_label                                       \
            "${cpu_label_args[@]}"                                  \
                                                                    \
    --add item stats_cpu_percent "$(yaml ".item.stats.position")"   \
        --set stats_cpu_percent                                     \
            "${cpu_percent_args[@]}"                                \
            script="$PLUGIN_DIR/stats/cpu.sh"                       \
                                                                    \
    --add item stats_mem_label "$(yaml ".item.stats.position")"     \
        --set stats_mem_label                                       \
            "${mem_label_args[@]}"                                  \
                                                                    \
    --add item stats_mem_percent "$(yaml ".item.stats.position")"   \
        --set stats_mem_percent                                     \
            "${mem_percent_args[@]}"                                \
            script="$PLUGIN_DIR/stats/memory.sh"                    \
    --add bracket stats_bracket  '/stats_.*/'                       \
        --set stats_bracket                                         \
            "${bracket_args[@]}"
