#!/bin/bash
# Read ‘n’ and generate Fibonacci numbers less than or equal to n
# Prerequisites:
#       Knowledge about Fibonacci series.
# Objective:
#       Learn to implement existing algorithms using loops
# Requirements:
#       Remember n is not number of elements to print
#       Its the boundary of elements to print.
# Fibonacci Sequence: 
#   Xn = Xn-1 + Xn-2
#   Xn is term number "n"
#   Xn−1 is the previous term (n−1)
#   Xn−2 is the term before that (n−2)
#       n   =	0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	...
#       Xn  =	0	1	1	2	3	5	8	13	21	34	55	89	144	233	377	...

# Get user input 'n' limit to the Fibonacci Sequence


echo -e "Please enter an integer limit to the Fibonacci Sequence:\t"; read intN;

if ! [ "$intN" -eq "$intN" ] 2> /dev/null || [ $(($intN)) -lt 0 ]
        then
            echo "Sorry positive integers only"
            exit 1
fi

fibSeq="0"
maxFibn=0   #   Xn is term number "n"
maxFibnone=1  #   Xn−1 is the previous term (n−1)
maxFibntwo=0  #   Xn−2 is the term before that (n−2)

if [ "$intN" -eq 0 ]
    then
    echo -e "\tFinonacci Sequence :\n\t\t$fibSeq"    
else


while [[ "$maxFibn" -lt "$intN" ]] ; do
    maxFibn=$(expr $maxFibnone + $maxFibntwo);
    
    maxFibntwo=$maxFibnone
    maxFibnone=$maxFibn
    if [ "$maxFibn" -le $intN ]
    then
    fibSeq=$fibSeq", "$maxFibn
   
    fi
    done
 echo -e "\t Finonacci Sequence :\n\t\t$fibSeq"
 fi
exit 0