#!/bin/bash

theme_name=tokyonight-night

theme_octets=4

#     dark    red     green   yellow  blue    magenta cyan    white
fg1=( 000000  f7768e  9ece6a  e0af68  7aa2f7  bb9af7  7dcfff  c0caf5 )
mid=414868

fg1_d=${fg1[0]}  fg1_r=${fg1[1]}  fg1_g=${fg1[2]}  fg1_y=${fg1[3]}  fg1_b=${fg1[4]}  fg1_m=${fg1[5]}  fg1_c=${fg1[6]}  fg1_w=${fg1[7]}


theme_octet_1=(
  $fg1_d  0    0    0    $fg1_r  0   0     0    $fg1_g  0    0    0    $fg1_y  0    0    0
  $fg1_b  0    0    0    $fg1_m  0   0     0    $fg1_c  0    0   -5    $fg1_w  0    0    0
)

theme_octet_2=(
  $mid    0    0   10    $fg1_r  0   50   10    $fg1_g  0   20    5    $fg1_y  0   20    5
  $fg1_b  0   20   10    $fg1_m  0   20   10    $fg1_c  0   20    5    $fg1_w  0    0   10
)

theme_octet_3=(
  $mid    0    0  -24    $fg1_r  0  -20  -46    $fg1_g  0  -10  -43    $fg1_y  0  -5   -46
  $fg1_b  0  -10  -44    $fg1_m  0  -18  -45    $fg1_c  0  -10  -52    $fg1_w  0  -40  -48
)

theme_octet_4=(
  $mid    0    0   -5    $fg1_r  0  -24  -23    $fg1_g  0   -10 -25    $fg1_y  0   -8  -26
  $fg1_b  0  -26  -18    $fg1_m  0  -20  -20    $fg1_c  0    0  -37    $fg1_w  0  -35  -32
)

theme_background_color=1a1b26
theme_foreground_color="$fg1_w"

theme_preview() {
  preview_octet abs "$theme_background_color" rel  0
  preview_octet abs "$theme_background_color" rel  8
  preview_octet abs "$theme_background_color" rel 16
  preview_octet abs "$theme_background_color" rel 24
  preview_gap 50
  preview_octet rel 16 rel 0
  preview_octet rel 16 rel 8
  preview_gap 35
  preview_octet rel 24 abs 0
  preview_octet rel 24 abs 15
}
