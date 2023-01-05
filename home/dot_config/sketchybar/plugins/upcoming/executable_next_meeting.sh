#!/bin/bash

source "$HOME/.config/sketchybar/functions.sh"
source "$HOME/.config/sketchybar/plugins/upcoming/functions.sh"

CURDT=$(date +"%s")
EVENT=$($HOME/.config/sketchybar/plugins/upcoming/ical-buddy-json.sh                                    \
            -c Home,Work -u |                                                                       \
            jq -c "sort_by(.start_secs) | .[] | select(.start_at) | select(.start_secs > $CURDT)" | \
            head -1)

if [ "$EVENT" = "" ]; then
  TEMPIFS="$IFS"
  IFS=$'\n'
  meeting_args=($(explode_args "item.upcoming.args.meeting_type.upcoming.none"))
  IFS="$TEMPIFS"

  eval sketchybar --set $NAME   \
      "${meeting_args[@]}"
else
  title=$(jq -r ".title" <<< "$EVENT")
  start_secs=$(jq -r ".start_secs" <<< "$EVENT")
  date_label=$(human_time_diff "$start_secs" $(yaml '.item.upcoming.time_style'))
  meeting_type=$(meeting_type_by_url $(jq -r ".urls | .[]" <<< "$EVENT" | head -1))

  label_text="Next: $title (in $date_label)" 
  if [[ "$meeting_type" == "teams" ]]; then
    TEMPIFS="$IFS"
    IFS=$'\n'
    meeting_args=($(explode_args "item.upcoming.args.meeting_type.upcoming.teams"))
    IFS="$TEMPIFS"
  elif [[ "$meeting_type" == "webex" ]]; then
    TEMPIFS="$IFS"
    IFS=$'\n'
    meeting_args=($(explode_args "item.upcoming.args.meeting_type.upcoming.webex"))
    IFS="$TEMPIFS"
  elif [[ "$meeting_type" == "meet" ]]; then
    TEMPIFS="$IFS"
    IFS=$'\n'
    meeting_args=($(explode_args "item.upcoming.args.meeting_type.upcoming.meet"))
    IFS="$TEMPIFS"
  else
    TEMPIFS="$IFS"
    IFS=$'\n'
    meeting_args=($(explode_args "item.upcoming.args.meeting_type.upcoming.default"))
    IFS="$TEMPIFS"
  fi

  meeting_args+=( "label=\"$label_text\"" )
  eval sketchybar --set $NAME   \
      "${meeting_args[@]}"
fi
