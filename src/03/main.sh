#!/bin/bash

source ./get_info/get_simple_info.sh
source ./get_info/get_net.sh
source ./get_info/get_ram.sh
source ./get_info/get_root_space.sh
source ./set_color.sh

source ./output.sh

if [ $# -eq 4 ]; then
    if [ "$1" -ne "$2" ] && [ "$3" -ne "$4" ]; then
        output_all "$1" "$2" "$3" "$4"
    else
        echo "Цвет шрифта и фона одного столбца не должны совпадать. Попробуйте снова."
    fi        
elif [ $# -gt 4 ]; then
    echo "Too many arguments"
else     
    echo "$((4 - $#)) arguments are missing"
fi
