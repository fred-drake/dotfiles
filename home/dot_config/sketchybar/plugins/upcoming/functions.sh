# From a given event JSON object, pull the meeting type.
# It will check each URL and return default if no URLs
# can infer the type, otherwise will return the inferred
# type of the first URL it can.
meeting_type_by_event() {
  local event=$1
  local urls=$(jq -r ".urls | .[]" <<< "$event")
  local type="default"
  for row in $(jq -r ".urls | .[]" <<< "$event"); do
    if [[ "$type" = "default" ]]; then
      type=$(meeting_type_by_url "$row")
    fi
  done

  echo $type
}


# From a given URL, infer the type of meeting:
#   teams   - Microsoft Teams
#   webex   - Cisco Webex
#   meet    - Google Meet
#   default - Either none, or cannot infer from URL
meeting_type_by_url() {
  local url=$1
  local type="default"
  
  if [[ $url =~ "teams.microsoft." ]]; then
    type="teams"
  fi
  if [[ $url =~ ".webex." ]]; then
    type="webex"
  fi
  if [[ $url =~ "meet.google." ]]; then
    type="meet"
  fi

  echo $type
}

# From a given epoch timestamp set in the future, display
# a human readable time difference between the current time
# and this future time.  An optional second parameter dictates
# the style (default is "short"):
#   long  - "1 day, 12 hours, 13 minutes"
#   short - "1d12h13m"
human_time_diff() {
  local future_seconds=$1
  local type=${2:-short}
  local time_diff=$[$future_seconds-$(date +"%s") + 60]

  if [ $time_diff -lt "1" ]; then
    echo "now"
  else
    local days="$[$time_diff / (60 * 60 * 24)]"
    days=$(echo "$days/1" | bc) 
    time_diff=$[$time_diff - ($days * 60 * 60 * 24)]

    local hours="$[$time_diff / (60 * 60)]"
    hours=$(echo "$hours/1" | bc)
    time_diff=$[$time_diff-($hours * 60 * 60)]

    local minutes="$[$time_diff / 60]"
    minutes=$(echo "$minutes/1" | bc)
    time_diff=$[$time_diff-($minutes * 60)]

    local days_label=""
    if [ $days -gt "0" ]; then
      days_label="$days day"
      if [ $days -ne "1" ]; then
        days_label="${days_label}s"
      fi
      if [ $hours -gt "0" ] || [ $minutes -gt "0" ]; then
        days_label="${days_label}, "
      fi
    fi

    local hours_label=""
    if [ $hours -gt "0" ]; then
      if [[ "$type" == "long" ]]; then
        hours_label="$hours hour"
        if [ $hours -ne "1" ]; then
          hours_label="${hours_label}s"
        fi
        if [ $minutes -gt "0" ]; then
          hours_label="${hours_label}, "
        fi
      else
        hours_label="${hours}h"
      fi
    fi

    local minutes_label=""
    if [ $minutes -gt "0" ]; then
      if [[ "$type" == "long" ]]; then
        minutes_label="$minutes minute"
        if [ $minutes -ne "1" ]; then
          minutes_label="${minutes_label}s"
        fi
      else
        minutes_label="${minutes}m"
      fi
    fi

    echo "${days_label}${hours_label}${minutes_label}"
  fi
}

