#!/bin/bash

calc_ram() {
    ram_kb=$( free -k | awk '/Mem/ {print $'$1'}' )
    ram_gb=$( awk 'BEGIN {printf "%.3f", '${ram_kb}' / 1024 / 1024 }' )
    echo $ram_gb
}

get_ram_total() {
    echo -e "RAM_TOTAL = $(calc_ram 2) GB"
}

get_ram_used() {
    echo -e "RAM_USED = $(calc_ram 3) GB"
}

get_ram_free() {
    echo -e "RAM_FREE = $(calc_ram 4) GB"
}
