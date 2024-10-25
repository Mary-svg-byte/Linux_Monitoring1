#!/bin/bash

get_ip_address() {
    ip_info=$(ip -o -4 a | awk '$2 !~ /lo/ {print $4; exit}')
    echo -e "IP = $(echo "$ip_info" | cut -d '/' -f 1)"
}

get_and_calculate_subnet_mask() {
    prefix_mask=$(echo "$ip_info" | cut -d '/' -f 2)
    full_bytes_count=$((prefix_mask / 8))
    bits_rest=$((prefix_mask - 8 * full_bytes_count))
    mask=(0 0 0 0)
    for ((i = 0; i < 4; i++)); do
        if [ $full_bytes_count -gt 0 ]; then
            mask[$i]=255
            full_bytes_count=$((full_bytes_count - 1))
        else
            if [ $bits_rest -gt 0 ]; then
                for ((j = 7; j >= $((8 - bits_rest)); j--)); do
                    mask[$i]=$((${mask[i]} + 2**j))
                done
                bits_rest=0  
            fi
        fi 
    done
    echo -e "MASK = ${mask[0]}.${mask[1]}.${mask[2]}.${mask[3]}"
}

get_default_gateway() {
    echo -e "GATEWAY = $(ip r | grep -w "default" | awk '{print $3}')"
}
