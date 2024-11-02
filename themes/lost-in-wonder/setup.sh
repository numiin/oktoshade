#!/bin/bash

theme_name=lost-in-wonder
theme_octets=4

theme_background_color=2c3027
theme_foreground_color=ba9f45

fore=$theme_foreground_color

#   dark    red     green   yellow  blue    magenta cyan    bright
f=( 000000  c76b6d  8f9c44  a49a6a  978ea9  c47e94  669980  $fore  )
b=( 1c201a  3d2e24  2a3621  383829  343045  3d2e3b  283635  31342d )

f_d=${f[0]}  f_r=${f[1]}  f_g=${f[2]}  f_y=${f[3]}  f_b=${f[4]}  f_m=${f[5]}  f_c=${f[6]}  f_w=${f[7]}
b_d=${b[0]}  b_r=${b[1]}  b_g=${b[2]}  b_y=${b[3]}  b_b=${b[4]}  b_m=${b[5]}  b_c=${b[6]}  b_w=${b[7]}


# rrggbb  +H   +S   +L        rrggbb  +H   +S   +L        rrggbb  +H   +S   +L        rrggbb  +H   +S   +L
theme_octet_1=(
  $f_d     0    0    0        $f_r     0    0    0        $f_g     0    0    0        $f_y     0    0    1
  $f_b     0    0    0        $f_m     0    0    0        $f_c     0    0    0        $f_w     0    0    0
)

theme_octet_2=(
  958f7e   0    0    0        ff5910   0    0    0        $f_g     0   18    3        $f_y     0   32    3
  $f_b     0   38   16        $f_m    18   38   14        $f_c     0   18    6        $f_w     0    0   10
)

theme_octet_3=(
  $b_d     0    0    4        $b_r     0    0    0        $b_g     0    0    0        $b_y     0    0    0
  $b_b     0    0    0        $b_m     0    0    0        $b_c     0    0    0        $b_w     0    0    1
)

theme_octet_4=(
  $b_w   -15    2    8        $f_r     5   -5   -4        $f_g     0    0   -6        $f_y    -2   14   -9
  $f_b     0    5   -8        $f_m     0  -16  -11        $f_c    10   -5   -6        $b_w   -38    5   24
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
  preview_octet rel 16 rel 24
  preview_octet rel 16 abs 31
  preview_gap 35
  preview_octet rel 24 abs 0
  preview_octet rel 24 abs 15
}
