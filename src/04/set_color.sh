#!/bin/bash


# Declare defaults as a global array
# declare -a defaults=(0 0 0 0)

convert_input_color() {
  colors=(1 4 1 7)
  defaults=(0 0 0 0)
  j=0
  l=0

  for color in "$@"; do
    if [ "$color" -lt 7 ]; then
      if [ "$color" -eq 1 ]; then #white
        colors[j]=7
        defaults[j]=1
      elif [ "$color" -eq 2 ]; then #red
        colors[j]=1
        defaults[j]=1
      elif [ "$color" -eq 3 ]; then #green
        colors[j]=2
        defaults[j]=1
      elif [ "$color" -eq 4 ]; then #blue
        colors[j]=4
        defaults[j]=1
      elif [ "$color" -eq 5 ]; then #purple
        colors[j]=5
        defaults[j]=1
      elif [ "$color" -eq 6 ]; then #black
        colors[j]=0
        defaults[j]=1
      else
        break
      fi
    else
      defaults[j]=0
    fi
    ((j+=1))
  done

  if [[ ${colors[0]} == ${colors[1]} || ${colors[2]} == ${colors[3]} ]]; then
    colors=(1 4 1 7)
    defaults=(0 0 0 0)
  fi

  # echo "Defaults colors in convert: ${colors[@]}"
  # echo "Defaults values in convert: ${defaults[@]}"
}


definition_n_color() {
    case $1 in
        7) echo "white";;
        1) echo "red";;
        2) echo "green";;
        4) echo "blue";;
        5) echo "purple";;
        0) echo "black";;
    esac;
}

definition_w_color() {
    case $1 in
        7) echo "1";;
        1) echo "2";;
        2) echo "3";;
        4) echo "4";;
        5) echo "5";;
        0) echo "6";;        
        404) echo "default";;    
    esac;
}


echo_color_table() {
    echo ""
    for ((k= 0; k<4; k++)); do
        if [ ${defaults[k]} -eq 0 ]; then
            output[k]=404
        else
            output[k]=${colors[k]}
        fi
    done

    echo "Column 1 background =" "$( definition_w_color ${output[0]} )" "($( definition_n_color ${colors[0]} ))"
    echo "Column 1 font color =" "$( definition_w_color ${output[1]} )" "($( definition_n_color ${colors[1]} ))"
    echo "Column 2 background =" "$( definition_w_color ${output[2]} )" "($( definition_n_color ${colors[2]} ))"
    echo "Column 2 font color =" "$( definition_w_color ${output[3]} )" "($( definition_n_color ${colors[3]} ))"
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