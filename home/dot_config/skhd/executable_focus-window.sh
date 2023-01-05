#/bin/bash

if ! command -v "jq" &> /dev/null
then
  echo "jq application must be installed"
  exit 1
fi

if ! command -v "yabai" &> /dev/null
then
  echo "yabai application must be installed"
  exit 1
fi

if [ "$#" -ne 2 ]; then
  echo "Sets focus on a window in yabai or opens the app if it isn't already opened"
  echo ""
  echo "Usage: focus-window.sh <App title> <App directory>"
  echo ""
  echo "Example: focus-window.sh \"Google Chrome\" \"/Applications/Google Chrome.app\""
  exit 1
fi

WID=$(yabai -m query --windows | jq ".[] | select(.app==\"$1\") | .id")
if [ -z "$WID" ]; then
  open "$2"
else
  yabai -m window $WID --focus
fi
