#!/bin/bash

theme_name=lost-in-wonder
theme_octets=4

theme_background_color=282c23
theme_foreground_color=b09245

fore=$theme_foreground_color

#   dark    red     green   yellow  blue    magenta cyan    bright
f=( 000000  c76b6d  689c6c  9b935f  9f899b  c7758f  659f92  $fore  )
b=( 1a1e1b  542a26  243829  3c3725  332f46  3c2a3b  253637  31322f )

f_d=${f[0]}  f_r=${f[1]}  f_g=${f[2]}  f_y=${f[3]}  f_b=${f[4]}  f_m=${f[5]}  f_c=${f[6]}  f_w=${f[7]}
b_d=${b[0]}  b_r=${b[1]}  b_g=${b[2]}  b_y=${b[3]}  b_b=${b[4]}  b_m=${b[5]}  b_c=${b[6]}  b_w=${b[7]}


# rrggbb  +H   +S   +L        rrggbb  +H   +S   +L        rrggbb  +H   +S   +L        rrggbb  +H   +S   +L
theme_octet_1=(
  $f_d     0    0    0        $f_r     0    0    0        $f_g     0   -2    0        $f_y     0   -2    1
  $f_b     0    0    0        $f_m     0    0    0        $f_c     0   -5   -0        $f_w     0    0    0
)

theme_octet_2=(
  989180   0    0    0        ff5910   0    0    0        $f_g    -8   20    0        $f_y     0   30    3
  $f_b     0   38   16        $f_m    18   38   16        $f_c     0   18    6        $f_w     0    0   12
)

theme_octet_3=(
  $b_d     0    0    3        $b_r     0    0    0        $b_g     0    0    0        $b_y     0    0    0
  $b_b     0    0    0        $b_m     0    0    0        $b_c     0    0    0        $b_w     0    0    0
)

theme_octet_4=(
  $b_w     0    0    3        $f_r     0  -10  -12        $f_g   -20    0  -13        $f_y   -15    5   -8
  $f_b   -55    4  -10        $f_m     0  -25  -15        $f_c     0    0  -15        $b_w   -38    5   21
)


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
