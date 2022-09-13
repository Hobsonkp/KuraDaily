#!/bin/bash
# Write a script for addition of two numbers for real numbers also
# Prerequisites:
#   How to add real numbers in script.
#   How to use piping in commands.
# Objective:
#   To understand working of piping.
#   To learn arithmetic operations in shell script
# Requirements:
#   Ask user to enter two numbers
#   User can enter real numbers also
#   Use bc command and piping to do.
#
stat=1
numberSum="0"

echo -e "Please enter the real numbers that you want to add separated by a <<space>> : "; read numberStream;
numberStream=($numberStream)

for i in "${numberStream[@]}"
do
    numberSum+="+$i"
    if ! [[ $i =~ ^[+-]?[.]?[0-9]+\.?[0-9]*$ ]]  2> /dev/null; then
                numberSum="0"
                stat=0
                break;
    fi
done
while [[ $stat -eq 0 ]] ; do      
    numberSum="0"  
    echo -e "Please enter valid real numbers that you want to add separated by a <<space>> : "; read numberStream;
    numberStream=($numberStream)
    for i in "${numberStream[@]}"
    do
        numberSum+="+$i"
        echo $i
            if ! [[ $i =~ ^[+-]?[.]?[0-9]+\.?[0-9]*$ ]] 2> /dev/null; then
                numberSum="0"
                stat=0
                break;
            fi
    done
done

echo "The answer is :" $(echo $numberSum | bc)