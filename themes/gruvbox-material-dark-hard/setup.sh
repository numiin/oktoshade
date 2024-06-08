#!/bin/bash

theme_name='Gruvbox Material Dark, Hard'

theme_background_color=1d2021
theme_foreground_color=a89984

theme_octets=6

#     dark    red     green   yellow  blue    magenta cyan    white
fg1=( 000000  ea6962  a9b665  d8a657  7daea3  d3869b  89b482  $theme_foreground_color )
bg1=( 141617  3c1f1e  32361a  473c29  0d3138  4a263c  0d3138  32302f )
bg5=504945
grey0=7c6f6f
orange=e78a4e

fg1_d=${fg1[0]}  fg1_r=${fg1[1]}  fg1_g=${fg1[2]}  fg1_y=${fg1[3]}  fg1_b=${fg1[4]}  fg1_m=${fg1[5]}  fg1_c=${fg1[6]}  fg1_w=${fg1[7]}
bg1_d=${bg1[0]}  bg1_r=${bg1[1]}  bg1_g=${bg1[2]}  bg1_y=${bg1[3]}  bg1_b=${bg1[4]}  bg1_m=${bg1[5]}  bg1_c=${bg1[6]}  bg1_w=${bg1[7]}


theme_octet_1=(
  $fg1_d  0    0    0    $fg1_r  0   0     0    $fg1_g  0    0    0    $fg1_y  0    0    0
  $fg1_b  0    0    0    $fg1_m  0   0     0    $fg1_c  0    0    0    $fg1_w  0    0    0
)

theme_octet_2=(
  $grey0  0    0    0    $fg1_r -5   50   10    $fg1_g  0   20    0    $fg1_y  0   20   10
  $fg1_b  0   25    0    $fg1_m -6   35   10    $fg1_c 28   20    0    $fg1_w  0    0    5
)

theme_octet_3=(
  $bg1_d  0    0    0    $bg1_r  0    0    0    $bg1_g  0    0    0    $bg1_y  0    0    0
  $bg1_b  0    0    0    $bg1_m  0    0    0    $bg1_c  0    0    0    $bg1_w  0    0    2
)

theme_octet_4=(
  $bg5    0  -25   -7    $fg1_r  0  -32  -18    $fg1_g  0    0  -21    $fg1_y  0   -8  -21
  $fg1_b  0    0  -20    $fg1_m  0   -5  -18    $fg1_c 18    0  -25    $fg1_w  0  -24  -31
)

theme_octet_5=(
  $fg1_d  0    0    0    $orange 0    0    0    $fg1_g  0    0    0    $fg1_y  0    0   -2
  $fg1_b  0    0    0    $fg1_m  0    0    0    $fg1_c  0    0    0    $fg1_w  0    0    0
)

theme_octet_6=(
  $grey0  0   -5    0    $orange -5  50   10    $fg1_g  0   20    0    $fg1_y  0   23    0
  $fg1_b  0   25    0    $fg1_m  -6  35   10    $fg1_c  0   20    0    $fg1_w  0    0    5
)


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

