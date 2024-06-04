#!/bin/bash

declare -i index=0

source "./themes/$1/setup.sh"

ansi_n_color() {
  local hex="$2"
  local r="$(( 16#${hex:1:2} ))"
  local g="$(( 16#${hex:3:2} ))"
  local b="$(( 16#${hex:5:2} ))"
  local r_real="$(echo "$r" | awk '{printf "%f", $1 / 255}')"
  local g_real="$(echo "$g" | awk '{printf "%f", $1 / 255}')"
  local b_real="$(echo "$b" | awk '{printf "%f", $1 / 255}')"

  echo "  <key>$1</key>"
  echo '  <dict>'
  echo '    <key>Color Space</key>'
  echo "    <string>sRGB</string>"
  echo '    <key>Alpha Component</key>'
  echo "    <real>1</real>"
  echo '    <key>Red Component</key>'
  echo "    <real>$r_real</real>"
  echo '    <key>Green Component</key>'
  echo "    <real>$g_real</real>"
  echo '    <key>Blue Component</key>'
  echo "    <real>$b_real</real>"
  echo '  </dict>'
}

echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
echo '<plist version="1.0">'
echo '<dict>'

ansi_n_color "Background Color" "#$theme_background_color"
ansi_n_color "Foreground Color" "#$theme_foreground_color"

./render "$1" |
  while read -r hex
  do
    case "$index" in
      0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15)
        ansi_n_color "Ansi $index Color" "$hex"
        ;;
      *) >&2 echo "iTerm2 does not support color index [$index]"
        ;;
    esac
    index+=1
  done

echo '</dict>'
echo '</plist>'
