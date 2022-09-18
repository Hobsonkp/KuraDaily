#!/bin/bash
# Write a script to compare larger integer values from a ‘n’ number of arguments using command line arguments
# Prerequisites:
#   How to run a loops in shell scripts.
#   How to execute a bash script.
#   How to change execute permission of a file..
# Objective:
#   To understand working of command-line arguments
#   To understand working of integer comparison in script.
# Requirements:
#   Using command-line pass n arguments.
#   Compare all these arguments and print the largest value
#   Print error in-case no arguments.
#   Number of arguments can vary every time.
#
stat=0
allInpt=$@
numberMax=$1

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