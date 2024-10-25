#!/bin/bash

get_hostname() {
    output_style "HOSTNAME" "$(hostname)"
}

get_timezone() {
    timezone=$(timedatectl show --value --property=Timezone)
    utc_offset=$(date +"%:::z" | cut -c1,3)
    output_style "TIMEZONE" "$timezone UTC $utc_offset"
}


get_user() {
    output_style "USER" "$(whoami)"
}

get_os() {
    output_style "OS" "$(lsb_release -d | cut -f2)"
}

get_date() {
    output_style "DATE" "$(date +"%d %B %Y %T")"
}

get_uptime() {
    output_style "UPTIME" "$(uptime -p)"
}

get_uptime_sec() {
    output_style "UPTIME_SEC" "$(cut -d ' ' -f1 < /proc/uptime)"
}

