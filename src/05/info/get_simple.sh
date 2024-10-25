#!/bin/bash

get_all_folders() {
    echo "Total number of folders (including all nested ones) =" $( du "$1" 2>/dev/null | wc -l )
}

get_total_number_files() {
    echo -n "Total number of files = "
    echo $( find $1 -type f 2>/dev/null | wc -l )
}

get_number_files() {
    echo $( find $1 -type f $2 2>/dev/null | wc -l )
}

get_number_conf_files() {
    echo -n "  Configuration files (with the .conf extension) = "
    get_number_files $1 "-name *.conf"
}

get_number_text_files() {
    echo -n "  Text files = "
    get_number_files $1 "-name *.txt"
}

get_number_exe_files() {
    echo -n "  Executable files = "
    get_number_files $1 "-executable"
}

get_number_log_files() {
    echo -n "  Log files (with the extension .log) = "
    get_number_files $1 "-name *.log"
}

get_number_archive_files() {
    echo -n "  Archive files = "
    get_number_files $1 "-name *.bz2 -or -name *.gz -or -name *.tar -or -name *.tbz -or -name *.tgz -or -name *.zip"
}

get_number_symb_link() {
    echo -n "  Symbolic links = "
    echo $( find $1 -type l 2>/dev/null | wc -l )
}