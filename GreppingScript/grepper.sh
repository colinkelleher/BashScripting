#!/bin/bash

# Name: Colin Kelleher
# Number: 117303363
# Assignment: 1

inputArray=()
outputArray=()

# Usage function which will print the format in which the program should be run
# if there # is an input error
usage(){
    echo usage: ${0} [ -integer integer ]+ 1>&2
    exit 1
}

# Internal Field Separator (IFS) that is used for word splitting
grepInput(){
    IFS=,
    counter=0
    while IFS= read -r line; do
        count=0
        while [ $count -lt ${#inputArray[@]} ]; do
            check="${inputArray[count++]}"
            grep -s -q "$check" <<< "$line"
            result=$?
            if [ $result -eq 0 ];
            then
                outputArray[$((counter++))]="${line}"
                break
            fi
        done
    done < /dev/stdin
}

checkInputtedArguments(){
        counter=0
        while [ $# -ne 0 ]; do
            case $1 in
                -integer)
                shift
                ([ "$1" -eq "$1" ] > /dev/null 2>&1)
                is_num=$?
                if [ ${#} -ne 0 ] && [ $is_num -eq 0 ] ; then
                    inputArray[$((counter++))]=${1}
                else
                    usage
                fi;;
                *) usage;;
            esac
            shift
        done
        if [ ${#inputArray[@]} -eq "0" ]; then
            usage
        fi
    }



stdOutput(){
    for item in ${outputArray[@]}; do echo "${item}"
    done | sort -u
    }

# $* STORES ALL THE ARGUMENTS THAT WERE ENTERED ON THE COMMAND LINE
checkInputtedArguments $*
grepInput
stdOutput
