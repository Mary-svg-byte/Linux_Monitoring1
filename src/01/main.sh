#!/bin/bash

if [[ $1 =~ ^[0-9]+$ ]] || [[ $# -ne 1 ]];
then
    echo "incorrect input"
else
    echo "$1"
fi

