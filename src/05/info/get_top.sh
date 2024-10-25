#!/bin/bash

get_top_five_folders() {
    echo "TOP 5 folders of maximum size arranged in descending order (path and size): "
    echo "$( du -h $1 2>/dev/null | sort -hr | head -5 | awk '{ printf "  %d - %s, %s\n", NR, $2, $1 }')"
}

get_top_ten_max_size_files() {
    echo "Top 10 files of maximum size arranged in descending order (path, size and type):"
    i=1
    find $1 -type f -exec du -h {} \; 2>/dev/null | sort -hr | head -10 | while IFS= read -r line; do
        file=$( echo $line | cut -f2- -d ' ' )
        size=$( echo $line | cut -f1 -d ' ' )
        type=$( file -b $file | cut -f1 -d ',' )
        echo "  $i - $file, $size, $type"
        i=$(( $i + 1 ))
    done

}

get_top_ten_exe_files() {
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    i=1
    find $1 -type f -executable -exec du -h {} \; 2>/dev/null | sort -rh | head -10 | while IFS= read -r line; do
        file=$( echo $line | cut -f2- -d ' ' )
        size=$( echo $line | cut -f1 -d ' ' )
        hash=$( md5sum "$file" | cut -f1 -d ' ' )
        echo "  $i - $file, $size, $hash"
        i=$(( $i + 1 ))
    done
}