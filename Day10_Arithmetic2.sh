#!/bin/bash -f
# Write a script to perform arithmetic operation on digits of a given number depending upon the operator
# Prerequisites:
#   Knowledge about arrays in script.
#   Use of loops.
#   How to access elements of a string.
# Objective:
#   To learn more string manipulation in scripts.
# Requirements:
#   Read a string from user, must end with a operator symbol.
#   Number can be any length but must end with an operator character
#   Always do left to right operations.
#   If 8312 – passed do 8-3-1-2 = 2
#
set -f
numberOperator=$1
numLength=$(expr length $1)
decimalplaces=$(expr $numLength \* 2)

if [[ $numberOperator =~ ^[0-9]*[+-\/\*]$ ]]; then  

NUMBER=$(echo $numberOperator | sed 's/[^0-9]*//g')
operatorSign=$(echo $numberOperator | cut -c$numLength)

operatedNumber=$(echo $NUMBER | cut -c1)
operationString=$(echo $NUMBER | cut -c1)

    if [[ $numLength -gt 1 ]]; then
    for ((i=2; i<$(($numLength)); i++)) 
    do
        thisDigit=$(echo $NUMBER | cut -c$i)
        if [[ $operatorSign = '*' ]]; then  
         operatedNumber=$(expr $operatedNumber \* $thisDigit)
         operationString=$operationString"*"$thisDigit
        fi
        if [[ $operatorSign = "-" ]]; then  
         operatedNumber=$(expr $operatedNumber - $thisDigit)
         operationString=$operationString"-"$thisDigit
        fi
        if [[ $operatorSign = "+" ]]; then  
         operatedNumber=$(expr $operatedNumber + $thisDigit)
         operationString=$operationString"+"$thisDigit
        fi
        if [[ $operatorSign = "/" ]]; then  
            if [[ $thisDigit -eq 0 ]]; then
            echo -e "\tZeros will be eliminated from the string to avoid divide by zero error"
            else
            operatedNumber=$(echo "scale=$decimalplaces; $operatedNumber/$thisDigit" | bc)
            operationString=$operationString"/"$thisDigit
            fi
        fi
    done
    fi
echo -e "\tOperation $operationSign : $operationString = $operatedNumber "
exit 1
fi

if [[ $# -eq 0 ]]; then
echo -e "\t!!!ERROR!!!: No arguments passed."
echo -e "\tUse command line arguments to enter the number and operator."
echo -e "\tEnter as follows: ./Day10.sh 8312- "
exit 1
fi

if ! [[ $# -eq 2 ]]; then
echo -e "\t!!!ERROR!!!: "
echo -e "\tUse command line arguments to enter the number and operator."
echo -e "\tEnter as follows: set -f ./Day10.sh 8312- "
exit 1
fi

echo "set"
set +f
exit 0