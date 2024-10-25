#!/bin/bash

save_to_file() {
    echo -n "Записать данные в файл? [Y/n] "
    read answer

    if [ $answer == 'y' -o $answer == 'Y' ]; then
        file_name=$( date +"%d_%m_%Y_%H_%M_%S" )
        $( output_all > $file_name.status )
    fi  
}