#!/bin/bash
# Write a script to sort a given number in ascending or descending order
# Prerequisites:
#   Knowledge about arrays.
#   Bubble sort.
# Objective:
#   Learn about sorting mechanisms.
#   Better array manipulations.
# Requirements:
#   Pass numbers through command-line arguments.
#   Provide a menu for user to choose ascending or descending.
#   Show sorted array according to user choice.
allInpt=$@
numberOfArgs=$#

if [$# -ne 1]; 
    then echo "illegal number of parameters"
fi

if ! [[ $1 = "" ]]; then
   
        stat=1
        numberStream=($allInpt)
        for i in "${numberStream[@]}"
        do
            if ! [[ $i =~ ^[+-]?[.]?[0-9]+\.?[0-9]*$ ]] 2> /dev/null; then
                   
                    echo -e "\tUse command line arguments to enter the numbers separated by spaces to be compared. $i"
                    echo -e "\tEnter real numbers or integers only."
                    echo -e "\tEnter as follows: ./Day7.sh number number number etc\t \"i.e\" ./Day6.sh 6 2 7 11"
                    exit 1
            elif (( $(echo "$i > $numberMax" | bc -l)  )); then
                    numberMax=$i
            fi
        done
   
echo "The largest value is : $numberMax"
else
echo -e "\tUse command line arguments to enter the numbers separated by spaces to be compared."
echo -e "\tEnter as follows: ./Day7.sh number number number etc\t \"i.e\" ./Day6.sh 6 2 7 11"
fi


exit 0