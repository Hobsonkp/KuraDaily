#!/bin/bash
# Write a script to print a given number in reverse order
# Prerequisites:
#       How to use command-line arguments in script.
#       How to do use modules operators in script.
#       How to use loops in scripts.
# Objective:
#       To understand working of command-line arguments
#       To learn arithmetic operations in shell script
# Requirements:
#       Read an multi-digit number from user and reverse the number.
#       Its not just printing in reverse order
#       You have to extract each digit and convert to reverse.
#       When ‘0’ comes as last digit, discard while reversing.
#
if [[ $# -eq 0 ]]; then
echo -e "\t!!!ERROR!!!: No arguments passed."
exit 1
fi

numberMax=$1
if ! [ "$numberMax" -eq "$numberMax" ] 2> /dev/null
        then
            echo "Sorry integers only"
            exit 1
fi
numLength=$(expr length $1)

if [[ $numLength -eq 1 ]]; then
echo -e "\t!!!ERROR!!!: pass a multi-digit number."
exit 1
fi
reverseNumber=0
if [[ $numLength -gt 1 ]]; then
  for ((i=0; i<$(($numLength)); i++)) 
  do
        j=$(($i+1))
        place=$(echo "10^$i" | bc)
        value=$(echo $numberMax | cut -c$j)
        placeValue=$(expr $place \* $value)
        reverseNumber=$(expr $reverseNumber + $placeValue)
  done
  echo -e "\t Reverse number - $reverseNumber"
fi

exit 0