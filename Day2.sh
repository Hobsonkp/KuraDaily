#!/bin/bash
# Read ‘n’ and generate a pattern given below
# Pattern
#   1
#   1 2
#   1 2 3
#   1 2 3 4
# Prerequisites:
#   How to run a loops in shell scripts.
#   How to execute a bash script.
#   How to change execute permission of a file.
# Objective:
#   To understand the working of loops in a script.
# Requirements:
#   Read a value from user
#   Create a pattern as mentioned above.
#
patternN = ""
echo -e "Welcome to loops. \n Yor interger \"n\" will generate a loop that prints the pattern \"1 . . . . n\" \n"
echo -e "Please enter an integer to loop:"; read intN;

if ! [ "$intN" -eq "$intN" ] 2> /dev/null
        then
            echo "Sorry integers only"
            exit 1
fi

if [ "$intN" -ge 0 ]
then
for ((i=1; i<=$intN; i++))
do
patternN+=" $i"
done
echo -e "Pattern: $patternN"
exit 0
fi

if [ "$intN" -lt 0 ]
then
for ((i=1; i>=$intN; i--))
do
patternN+=" $i"
done
echo -e "Pattern: $patternN"
fi