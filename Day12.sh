#!/bin/bash
# Write a script to print the length of each and every string using arrays
# Prerequisites:
#   Knowledge about arrays.
#   How to find length of string.
#   How to access command-line arguments.
# Objective:
#   To learn more string manipulation in scripts.
# Requirements:
#   Pass some names or strings from command-line.
#   Print all the string lengths one-by-one.
#   Number of argument may vary.
#

for i in $@
do
    echo -e "\tLength of string ($i)  \t\t - " $(expr length $i)
done

exit 0