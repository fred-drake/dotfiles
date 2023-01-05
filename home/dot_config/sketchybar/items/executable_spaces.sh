TEMPIFS="$IFS"
IFS=$'\n'
space_args=($(explode_args "item.spaces.args.space"))
bracket_args=($(explode_args "item.spaces.args.bracket"))
separator_args=($(explode_args "item.spaces.args.separator"))
IFS="$TEMPIFS"
SPACE_ICONS=($(yaml '.item.spaces.space_icons|join(" ")'))

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"; do
  sid=$(($i+1))
  eval sketchybar                                               \
      --add space space.$sid $(yaml ".item.spaces.position")    \
          --set space.$sid                                      \
              associated_space=$sid                             \
              icon=${SPACE_ICONS[i]}                            \
              ${space_args[@]}                                  \
              script="$HOME/.config/sketchybar/plugins/spaces/spaces.sh"   \
          --subscribe                                           \
              space.$sid mouse.clicked
done

eval sketchybar \
    --add bracket spaces_bracket '/space\..*/'    \
        --set spaces_bracket                      \
            ${bracket_args[0]} 

eval sketchybar                                                                       \
    --add item spaces_separator "$(yaml ".item.spaces.position")"                     \
        --set spaces_separator                                                        \
            ${separator_args[@]}                                                      \
            click_script='yabai -m space --create sketchybar --trigger space_change' 
 
