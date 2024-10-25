#!/bin/bash

calc_space_root() {
    root_kb=$(df / | awk 'NR==2{print $'$1'}')
    root_mb=$(awk 'BEGIN {printf "%.2f", '${root_kb}' / 1024}')
    echo $root_mb
}

get_space_root_total() {
    output_style "SPACE_ROOT" "$(calc_space_root 2) MB"
}

get_space_root_used() {
    output_style "SPACE_ROOT_USED" "$(calc_space_root 3) MB"
}

get_space_root_free() {
    output_style "SPACE_ROOT_FREE" "$(calc_space_root 4) MB"
}

