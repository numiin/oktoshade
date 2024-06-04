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
    case $index in
      0 ) echo "regular0 = $rgb"  ;;
      1 ) echo "regular1 = $rgb"  ;;
      2 ) echo "regular2 = $rgb"  ;;
      3 ) echo "regular3 = $rgb"  ;;
      4 ) echo "regular4 = $rgb"  ;;
      5 ) echo "regular5 = $rgb"  ;;
      6 ) echo "regular6 = $rgb"  ;;
      7 ) echo "regular7 = $rgb"; echo  ;;
      8 ) echo "bright0  = $rgb"  ;;
      9 ) echo "bright1  = $rgb"  ;;
      10) echo "bright2  = $rgb"  ;;
      11) echo "bright3  = $rgb"  ;;
      12) echo "bright4  = $rgb"  ;;
      13) echo "bright5  = $rgb"  ;;
      14) echo "bright6  = $rgb"  ;;
      15) echo "bright7  = $rgb"; echo  ;;
      *) echo "$index = $rgb"  ;;
    esac

    index+=1
  done
