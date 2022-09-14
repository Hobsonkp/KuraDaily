#!/bin/bash
# Write a script for arithmetic calculator using command line arguments
# Prerequisites:
#   How to use command-line arguments in script.
#   How to do arithmetic operations in script.
#   How to use piping in commands.
# Objective:
#   To understand working of command-line arguments
#   To understand working of piping.
#   To learn arithmetic operations in shell script
# Requirements:
#   User must provide two numbers and operator through command-line
#   Based on input do the operation and show the output.
#   Use case to handle multiple operations
#   Use expr or bc commands.
#
stat=0
numberSum="0"
firstNumber=$1
operatorSign=$2
secondNumber=$3

if [[ $firstNumber =~ ^[+-]?[.]?[0-9]+\.?[0-9]*$ ]] && ! [[ ($operatorSign = "x") || ($operatorSign = "-") || ($operatorSign = "+") || ($operatorSign = "/") ]] && [[ $secondNumber =~ ^[+-]?[.]?[0-9]+\.?[0-9]*$ ]]; then
echo -e "\tAcceptable operators are :\n\t\"+\" for addition\t\"-\" for subtraction\t\"x\" for multiplication\t\"/\" for division\n"
exit 1
fi

if [[ $firstNumber =~ ^[+-]?[.]?[0-9]+\.?[0-9]*$ ]] && [[ ($operatorSign = "x") || ($operatorSign = "-") || ($operatorSign = "+") || ($operatorSign = "/") ]] && [[ $secondNumber =~ ^[+-]?[.]?[0-9]+\.?[0-9]*$ ]]; then
    if [[ $firstNumber =~ ^[0-9]*$ ]] &&  [[ $secondNumber =~ ^[0-9]*$ ]] ; then
        case $operatorSign in
        -) numberSum=$(expr $firstNumber - $secondNumber);echo -e "The expr answer is : $numberSum";;
        +) numberSum=$(expr $firstNumber + $secondNumber);echo -e "The expr answer is : $numberSum";;
        x) numberSum=$(expr $firstNumber \* $secondNumber);echo -e "The expr answer is : $numberSum";;
        /) numberSum=$(expr $firstNumber / $secondNumber);echo -e "The expr answer is : $numberSum";;
        esac
    else
        case $operatorSign in
        -) echo "The answer is :" $(echo $firstNumber-$secondNumber | bc);;
        +) echo "The answer is :" $(echo $firstNumber+$secondNumber | bc);;
        x) echo "The answer is :" $(echo "scale=2; $firstNumber*$secondNumber" | bc);;
        /) echo "The answer is :" $(echo "scale=2; $firstNumber/$secondNumber" | bc);;
        esac
    fi
    exit 0
else
echo -e "\tUse command line arguments to enter the numbers and operator for the arithmetic calculation"
echo -e "\tEnter as follows: ./Day6.sh number operator number\t \"i.e\" ./Day6.sh 6 - 2"
echo -e "\tAcceptable operators are :\n\t\"+\" for addition\t\"-\" for subtraction\t\"x\" for multiplication\t\"/\" for division\n"
echo -e "\tEXAMPLES:"
echo -e "\t\"SUBTRACTION\"\t\tInput\t: ./Day6.sh 6 - 2 \tOutput\t: The answer is : 4"
echo -e "\t\"ADDITION\"\t\tInput\t: ./Day6.sh 6 + 2 \tOutput\t: The answer is : 8"
echo -e "\t\"MULTIPLICATION\"\tInput\t: ./Day6.sh 6 x 2 \tOutput\t: The answer is : 12"
echo -e "\t\"DIVISION\"\t\tInput\t: ./Day6.sh 6 / 2 \tOutput\t: The answer is : 3"
exit 1
fi
