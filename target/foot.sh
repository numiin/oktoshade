#!/bin/bash

source "./themes/$1/setup.sh"

echo '[colors]'
echo "background = $theme_background_color"
echo "foreground = $theme_foreground_color"
echo

IFS=$'\n' read -r -d '' -a hex_colors < <( ./render "$1" && printf '\0' )

# regular
for index in {0..7}
do
  hex="${hex_colors[$index]}"
  rgb="${hex:1}"
  echo "regular$index = $rgb"
done
echo

# bright
for index in {8..15}
do
  hex="${hex_colors[$index]}"
  rgb="${hex:1}"
  echo "bright$(( $index - 8 )) = $rgb"
done
echo

# dim
for index in {24..31}
do
  hex="${hex_colors[$index]}"
  rgb="${hex:1}"
  echo "dim$(( $index - 24 )) = $rgb"
done
echo

for index in `seq 16 $(( $theme_octets * 8 - 1 ))`
do
  hex="${hex_colors[$index]}"
  rgb="${hex:1}"
  echo "$index = $rgb"
  case $index in
    23 | 31 | 47) echo ;;
    *) ;;
  esac
done
