#!/bin/bash

theme_name=lost-in-wonder

theme_background_color=202428
theme_foreground_color=918a86

theme_octets=6

black=000000
white=$theme_foreground_color

#     dark    red     green   yellow  blue    magenta cyan    white
fg1=( $black  bb6870  768e57  ab8a5f  9a79a6  b76c9a  51879a  $white )
fg2=( $black  c28166  8c9325  a29053  5c66d6  b472b6  558b77  $white )
bg1=( 1b1e23  3a2522  1c3123  372f15  35264a  3e233e  193048  2f343c )
mid=64686e

fg1_d=${fg1[0]}  fg1_r=${fg1[1]}  fg1_g=${fg1[2]}  fg1_y=${fg1[3]}  fg1_b=${fg1[4]}  fg1_m=${fg1[5]}  fg1_c=${fg1[6]}  fg1_w=${fg1[7]}
fg2_d=${fg2[0]}  fg2_r=${fg2[1]}  fg2_g=${fg2[2]}  fg2_y=${fg2[3]}  fg2_b=${fg2[4]}  fg2_m=${fg2[5]}  fg2_c=${fg2[6]}  fg2_w=${fg2[7]}
bg1_d=${bg1[0]}  bg1_r=${bg1[1]}  bg1_g=${bg1[2]}  bg1_y=${bg1[3]}  bg1_b=${bg1[4]}  bg1_m=${bg1[5]}  bg1_c=${bg1[6]}  bg1_w=${bg1[7]}

patch_l() {
  local l_add="${EXTRA_LIGHTNESS:-0}"
  local s_add="${EXTRA_SATURATION:-0}"
  for i in {1..32}
  do
    case $i in
      3|7|11|15|19|23|27|31)
        echo "$(( ${!i} + $s_add ))"
        ;;
      4|8|12|16|20|24|28|32)
        echo "$(( ${!i} + $l_add ))"
        ;;
      *)
        echo "${!i}"
        ;;
    esac
  done
}


# Each color octet is organized in 8 blocks of 4 components: <Hex color> <+H> <+S> <+L>
# +H +S +L components will be added to colors's respective HSL component values

theme_octet_1=(
  $fg1_d  0    0    0    $fg1_r  0    0    0    $fg1_g  0    0    0    $fg1_y  0    0    0
  $fg1_b  0    0    0    $fg1_m  0    0    0    $fg1_c  0    0    0    $fg1_w  0    0    0
)
theme_octet_1=( $(patch_l "${theme_octet_1[@]}") )

theme_octet_2=(
  $mid    0    0    5    $fg1_r  2   35   10    $fg1_g -8   20    2    $fg1_y  0   27    8
  $fg1_b  0   34   12    $fg1_m 18   34   10    $fg1_c  0   28   12    $fg1_w  0    0   16
)

theme_octet_2=( $(patch_l "${theme_octet_2[@]}") )

theme_octet_3=(
  $bg1_d  0    0    0    $bg1_r  0    0    0    $bg1_g  0    0    0    $bg1_y  0    0    0
  $bg1_b -30  15    5    $bg1_m  0    0    0    $bg1_c  0    0    0    $bg1_w  0    0    0
)

theme_octet_4=(
  $mid    0    4  -15    $fg1_r   5   2  -10    $fg1_g  0    2  -14    $fg1_y  5    8  -18
  37598b  0    0    0    $fg1_m  -8   0  -15    116468  0    0    0    $mid    0    2   -4
)

theme_octet_5=(
  $fg2_d  0    0    0    $fg2_r  0    0    0    $fg2_g  0    0    0    $fg2_y  0    0    0
  $fg2_b  0    0    0    $fg2_m  0    0    0    $fg2_c  0    0    0    $fg2_w  0    0    0
)
theme_octet_5=( $(patch_l "${theme_octet_5[@]}") )

theme_octet_6=(
  $mid    0    0    0    $fg2_r  0   25    8    $fg2_g  0   20    0    $fg2_y  0   23    0
  $fg2_b -5   38   15    $fg2_m  0   28   10    $fg2_c  0   20    0    $fg2_w  0    0   16
)
theme_octet_6=( $(patch_l "${theme_octet_6[@]}") )


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
