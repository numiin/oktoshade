#!/bin/bash

declare -i index

source "./themes/$1/setup.sh"

index=16
./render "$1" | tail -n +17 |
  while read -r hex
  do
    case $index in
      16)
        echo '[colors]'
        echo 'indexed_colors = ['
        echo "  { index = $index, color = \"$hex\" },"
        ;;
      47)
        echo "  { index = $index, color = \"$hex\" }"
        ;;
      * )
        echo "  { index = $index, color = \"$hex\" },"
        ;;
    esac

    index+=1
  done
echo ']'
echo

index=0
./render "$1" | head -n 16 |
  while read -r hex
  do
    case $index in
      0 )
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
    esac

    index+=1
  done
echo

echo '[colors.primary]'
echo "background = \"#$theme_background_color\""
echo "foreground = \"#$theme_foreground_color\""
echo
