#!/bin/bash

theme_name=solarized-dark

#     dark    red     green   yellow  blue    magenta cyan    white
fg1=( 000000  dc322f  859900  b58900  268bd2  d33682  2aa198  839496 )
fg2=( 000000  dc322f  859900  cb4b16  268bd2  6c71c4  2aa198  839496 )
bg1=( 00252e  492727  3a3e1e  413a25  1d3f58  432332  1f3d3a  2c373a )

fg1_d=${fg1[0]}  fg1_r=${fg1[1]}  fg1_g=${fg1[2]}  fg1_y=${fg1[3]}  fg1_b=${fg1[4]}  fg1_m=${fg1[5]}  fg1_c=${fg1[6]}  fg1_w=${fg1[7]}
fg2_d=${fg2[0]}  fg2_r=${fg2[1]}  fg2_g=${fg2[2]}  fg2_y=${fg2[3]}  fg2_b=${fg2[4]}  fg2_m=${fg2[5]}  fg2_c=${fg2[6]}  fg2_w=${fg2[7]}
bg1_d=${bg1[0]}  bg1_r=${bg1[1]}  bg1_g=${bg1[2]}  bg1_y=${bg1[3]}  bg1_b=${bg1[4]}  bg1_m=${bg1[5]}  bg1_c=${bg1[6]}  bg1_w=${bg1[7]}


theme_octets=6

theme_octet_1=(
  $fg1_d  0    0    0    $fg1_r  0    0    0    $fg1_g  0    0    0    $fg1_y  0    0    0
  $fg1_b  0    0    0    $fg1_m  0    0    0    $fg1_c  0    0   -5    $fg1_w  0    0    0
)

theme_octet_2=(
  $fg1_w  0    0  -20    $fg1_r -6   15   10    $fg1_g  0   10    3    $fg1_y  0   10    8
  $fg1_b  0   10   10    $fg1_m  0   10    7    $fg1_c  0   10    5    $fg1_w  0    0   16
)

theme_octet_3=(
  $bg1_d  0    0    0    $bg1_r  0    0    0    $bg1_g  0    0    0    $bg1_y  0    0     0
  $bg1_b  0    0    0    $bg1_m  0    0    0    $bg1_c  0    0    0    $bg1_w  0    0     0
)

theme_octet_4=(
  $fg1_w  0    0  -28    $fg1_r  0  -15  -10    $fg1_g  0   -5   -8    $fg1_y  0    0   -10
  $fg1_b  0    0  -10    $fg1_m  0   -5  -10    $fg1_c  0    0   -9    $fg1_w  0    0    -9
)

theme_octet_5=(
  $fg2_d  0    0    0    $fg2_r  0    0    0    $fg2_g  0    0    0    $fg2_y  0    0     0
  $fg2_b  0    0    0    $fg2_m  0    0    0    $fg2_c  0    0    0    $fg2_w  0    0     0
)

theme_octet_6=(
  $fg1_w  0    0  -20    $fg2_r -6  15    10    $fg2_g  0   10    3    $fg2_y  6   10    10
  $fg2_b  0   10   10    $fg2_m  0  10     7    $fg2_c  0   10    5    $fg2_w  0    0    16
)

theme_background_color=002b36
theme_foreground_color=839496

theme_preview() {
  preview_octet abs "$theme_background_color" rel  0
  preview_octet abs "$theme_background_color" rel  8
  preview_octet abs "$theme_background_color" rel 16
  preview_octet abs "$theme_background_color" rel 24
  preview_gap 20
  preview_octet abs "$theme_background_color" rel 32
  preview_octet abs "$theme_background_color" rel 40
  preview_gap 50
  preview_octet rel 16 rel 0
  preview_octet rel 16 rel 8
  preview_gap 10
  preview_octet rel 16 rel 32
  preview_octet rel 16 rel 40
  preview_gap 35
  preview_octet rel 24 abs 0
  preview_octet rel 24 abs 15
}
