#!/bin/bash

declare -i index=0

source "./themes/$1/setup.sh"

echo '[colors.primary]'
echo "background = \"#$theme_background_color\""
echo "foreground = \"#$theme_foreground_color\""
echo

./render "$1" |
  while read -r hex
  do
    case $index in
      0 )
        echo
        echo '[colors.normal]'
        echo   "black   = \"$hex\""
        ;;
      1 ) echo "red     = \"$hex\""  ;;
      2 ) echo "green   = \"$hex\""  ;;
      3 ) echo "yellow  = \"$hex\""  ;;
      4 ) echo "blue    = \"$hex\""  ;;
      5 ) echo "magenta = \"$hex\""  ;;
      6 ) echo "cyan    = \"$hex\""  ;;
      7 ) echo "white   = \"$hex\""  ;;
      8 )
        echo
        echo '[colors.bright]'
        echo   "black   = \"$hex\""
        ;;
      9 ) echo "red     = \"$hex\""  ;;
      10) echo "green   = \"$hex\""  ;;
      11) echo "yellow  = \"$hex\""  ;;
      12) echo "blue    = \"$hex\""  ;;
      13) echo "magenta = \"$hex\""  ;;
      14) echo "cyan    = \"$hex\""  ;;
      15) echo "white   = \"$hex\""  ;;

      16)
        echo
        echo '[colors]'
        echo 'indexed_colors = ['
        echo "  { index = $index, color = \"$hex\" },"
        ;;
      47)
        echo "  { index = $index, color = \"$hex\" }"
        echo ']'
        ;;
      * )
        echo "  { index = $index, color = \"$hex\" },"
        ;;
    esac

    index+=1
  done
