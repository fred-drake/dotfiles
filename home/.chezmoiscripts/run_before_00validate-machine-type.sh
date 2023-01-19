#!/bin/bash

FILE="$HOME/machine_id"
if [[ ! -f "$FILE" ]]; then
  echo "$FILE required to apply dotfiles"
  exit 1
fi
