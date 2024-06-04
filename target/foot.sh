#!/bin/bash

declare -i index=0

source "./themes/$1/setup.sh"

echo '[colors]'
echo "background = $theme_background_color"
echo "foreground = $theme_foreground_color"
echo

./render "$1" |
  while read -r hex
  do
    rgb="${hex:1}"
    echo "$index = $rgb"
    case $index in
      7 | 15 | 23 | 31 | 47) echo ;;
      *) ;;
    esac
    index+=1
  done
