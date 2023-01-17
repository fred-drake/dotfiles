#!/bin/bash

output_heic() {
  heic_file="$1"
  uuid_file="/tmp/$(uuidgen).jpg"
  magick convert "$1" "$uuid_file"
  catimg -r 2 -w 220 "$uuid_file"
  rm -f "$uuid_file"
}

case "$1" in
  *.png|*.jpg|*.jpeg|*.gif|*.PNG|*.JPG) catimg -r 2 -w 220 "$1";;
  *.heic|*.HEIC) output_heic "$1";;
  *.tar*) tar tf "$1";;
  *.zip) unzip -l "$1";;
  *.rar) unrar l "$1";;
  *.7z) 7z l "$1";;
  *.pdf) pdftotext "$1" -;;
  *) highlight -O ansi "$1" || cat "$1";;
esac

