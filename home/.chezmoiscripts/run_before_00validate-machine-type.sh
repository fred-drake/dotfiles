#!/bin/bash

FILE="$HOME/machine_id"
if [[ ! -f "$FILE" ]]; then
  echo "$FILE required to apply dotfiles"
fi
