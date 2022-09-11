#!/bin/bash
# Read ‘n’ and generate a pattern given below
# Pattern
#   1
#   2 3
#   4 5 6
#   7 8 9 10
# -Assuming n=4 in the example pattern above
# Prerequisites:
#   How to run a loops in shell scripts.
#   How to execute a bash script.
#   How to change execute permission of a file.
# Objective:
#   To understand the working of loops in a script.
# Requirements:
#   Read a value from user
#   Create a pattern as mentioned above.
#   Be sure to save a copy to compare with the response on the next screen.

patternN = ""
lineInc = 0
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
patternN=""
    for ((j=1; j<=$i; j++))
    do
    lineInc=$(($lineInc+1))
    patternN+=" $lineInc"

    done

echo -e "Pattern: $patternN"
done

exit 0
fi

if [ "$intN" -lt 0 ]
then
for ((i=-1; i>=$intN; i--))
do
patternN=""
    for ((j=-1; j>=$i; j--))
    do
    lineInc=$(($lineInc-1))
    patternN+=" $lineInc"

    done

echo -e "Pattern: $patternN"
done

fi