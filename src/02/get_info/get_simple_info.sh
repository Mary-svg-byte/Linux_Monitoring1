#!/bin/bash

get_hostname() {
    echo -e "HOSTNAME =" `hostname`
}

get_timezone() {
    TIMEZONE=$( timedatectl show --value --property=Timezone )
    DATE=$( date +%:::z )
    echo "TIMEZONE = $TIMEZONE UTC $DATE"
}

get_user() {
    echo -e "USER =" `whoami`
}

get_os() {
    echo -e "OS =" `lsb_release -d | cut -f2`
}

get_date() {
    echo -e "DATE =" `date +"%d %B %Y %T"`
}

get_uptime() {
    echo -e "UPTIME =" `uptime -p`
}

get_uptime_sec() {
    echo -e "UPTIME_SEC =" `cat /proc/uptime | cut -d ' ' -f1`
}

