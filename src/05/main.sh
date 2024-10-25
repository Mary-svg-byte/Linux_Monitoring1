#!/bin/bash

source ./info/get_simple.sh
source ./info/get_top.sh

start=$( date +%s )

if [ $# -eq 1 -a -d $1 ]; then
    dir=$1
    if [ "${dir:(-1)}" == "/" ]; then
        get_all_folders $dir
        get_top_five_folders $dir
        get_total_number_files $dir
        echo "Number of:"
        get_number_conf_files $dir
        get_number_text_files $dir
        get_number_exe_files $dir
        get_number_log_files $dir
        get_number_archive_files $dir
        get_number_symb_link $dir
        get_top_ten_max_size_files $dir
        get_top_ten_exe_files $dir
        echo "Script execution time (in seconds) =" $(( $( date +%s ) - $start ))
    else
        echo "Параметр должен заканчиваться \"/\""
        exit 1
    fi
else
    echo "Параметром должен быть относительный или абослютный путь до директории."
    exit 1
fi