#!/bin/bash

output_all() {
    get_hostname
    get_timezone
    get_user
    get_os
    get_date
    get_uptime
    get_uptime_sec
    get_ip_address
    get_and_calculate_subnet_mask    
    get_default_gateway
    get_ram_total
    get_ram_used
    get_ram_free
    get_space_root_total
    get_space_root_used
    get_space_root_free
}