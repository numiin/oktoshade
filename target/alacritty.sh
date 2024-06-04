#!/bin/bash

source "./themes/$1/setup.sh"

IFS=$'\n' read -r -d '' -a hex_colors < <( ./render "$1" && printf '\0' )

echo '[colors]'
echo 'indexed_colors = ['
for index in `seq 16 $(( $theme_octets * 8 - 1 ))`
do
  echo "  { index = $index, color = \"${hex_colors[$index]}\" },"
done
echo ']'
echo

echo '[colors.normal]'
echo "black   = \"${hex_colors[0]}\""
echo "red     = \"${hex_colors[1]}\""
echo "green   = \"${hex_colors[2]}\""
echo "yellow  = \"${hex_colors[3]}\""
echo "blue    = \"${hex_colors[4]}\""
echo "magenta = \"${hex_colors[5]}\""
echo "cyan    = \"${hex_colors[6]}\""
echo "white   = \"${hex_colors[7]}\""
echo

echo '[colors.bright]'
echo "black   = \"${hex_colors[8]}\""
echo "red     = \"${hex_colors[9]}\""
echo "green   = \"${hex_colors[10]}\""
echo "yellow  = \"${hex_colors[11]}\""
echo "blue    = \"${hex_colors[12]}\""
echo "magenta = \"${hex_colors[13]}\""
echo "cyan    = \"${hex_colors[14]}\""
echo "white   = \"${hex_colors[15]}\""
echo

echo '[colors.dim]'
echo "black   = \"${hex_colors[24]}\""
echo "red     = \"${hex_colors[25]}\""
echo "green   = \"${hex_colors[26]}\""
echo "yellow  = \"${hex_colors[27]}\""
echo "blue    = \"${hex_colors[28]}\""
echo "magenta = \"${hex_colors[29]}\""
echo "cyan    = \"${hex_colors[30]}\""
echo "white   = \"${hex_colors[31]}\""
echo

echo '[colors.primary]'
echo "background = \"#$theme_background_color\""
echo "foreground = \"#$theme_foreground_color\""
echo
