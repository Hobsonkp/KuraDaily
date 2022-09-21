#!/bin/bash
# Write a script to print chess board
# Prerequisites:
#   Knowledge about printing colors using echo
#   Use of nested loops.
# Objective:
#   Print colors using echo command.
# Requirements:
#   To print a black box echo -e -n “\\\\e[40m” ” “
#   To print a white box echo -e -n “\\\\e[47m” ” “
#   Call the commands in a loop.
#   After 8 columns make to normal color.
#   To make it normal echo -e -n “\\\\e[0m” ” “
#


#print header
    echo -e -n "\e[1;41m   "
    echo -e -n "\e[1;41m A "
    echo -e -n "\e[1;41m B "
    echo -e -n "\e[1;41m C "
    echo -e -n "\e[1;41m D "
    echo -e -n "\e[1;41m E "
    echo -e -n "\e[1;41m F "
    echo -e -n "\e[1;41m G "
    echo -e -n "\e[1;41m H "
    echo -e -n "\e[1;41m   "
    echo -e -n "\e[0m\n"
#print a rows
for ((j=1; j<=8; j++)) 
do
    echo -e -n "\e[1;41m $((9-$j)) " #number start of row
    #print pairs of columns
    for ((i=1; i<=4; i++)) 
    do
        if [ $((j%2)) -eq 0 ] # alternate pattern for even an odd rows
        then
            a=40m
            b=47m
        else
            a=47m
            b=40m
        fi

    echo -e -n "\e[1;$a   "
    echo -e -n "\e[1;$b   "  
    done
    echo -e -n "\e[1;41m $((9-$j)) \e[0m\n" #number end of row
done
#print footer
    echo -e -n "\e[1;41m   "
    echo -e -n "\e[1;41m A "
    echo -e -n "\e[1;41m B "
    echo -e -n "\e[1;41m C "
    echo -e -n "\e[1;41m D "
    echo -e -n "\e[1;41m E "
    echo -e -n "\e[1;41m F "
    echo -e -n "\e[1;41m G "
    echo -e -n "\e[1;41m H "
    echo -e -n "\e[1;41m   "
    echo -e -n "\e[0m\n"

exit 0