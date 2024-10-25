#!/bin/bash

convert_input_color() {
  colors=()
  i=0
  for color in "$@"; do
    if [ "$color" -lt 7 ]; then 
        if [ "$color" -eq 1 ]; then #white
            colors[i]=7
        elif [ "$color" -eq 2 ]; then #red
            colors[i]=1
        elif [ "$color" -eq 3 ]; then #green
            colors[i]=2
        elif [ "$color" -eq 4 ]; then #blue
            colors[i]=4
        elif [ "$color" -eq 5 ]; then #purple
            colors[i]=5
        elif [ "$color" -eq 6 ]; then #black
            colors[i]=0
        else 
            break
        fi  
        ((i+=1))
    fi
  done
  echo ${colors[@]}
}

title_color() {
    echo -e -n "\e[3$2;4$1m"
}

value_color() {
    echo -e -n "\e[3$2;4$1m" 
}

reset_color() {
    echo -e "\e[0;0m"
}

output_style() {
    title_color ${colors[0]} ${colors[1]}
    echo -n "$1 ="
    value_color ${colors[2]} ${colors[3]}
    echo -n " $2 "
    reset_color
}