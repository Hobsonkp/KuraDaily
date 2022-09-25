#!/bin/bash
# Read ‘n’ and print the greatest Fibonacci number less than or equal to n
# Prerequisites:
#   Knowledge about Fibonacci series.
# Objective:
#   Learn to implement existing algorithms using loops
# Requirements:
#   Remember n is not nth number of series.
#   Its the greatest element to print.



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
    echo -e "\t Maximum Finonacci number :\t$fibSeq"    
else


while [[ "$maxFibn" -lt "$intN" ]] ; do
    maxFibn=$(expr $maxFibnone + $maxFibntwo);
    
    maxFibntwo=$maxFibnone
    maxFibnone=$maxFibn
    if [ "$maxFibn" -le $intN ]
    then
    fibSeq=$maxFibn
   
    fi
    done
 echo -e "\t Maximum Finonacci number :\t$fibSeq"
 fi
exit 0