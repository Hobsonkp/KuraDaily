#!/bin/bash
# Write a script to delete empty lines from a file
# Prerequisites:
#   Knowledge about sed.
#   Knowledge about regular-exp.
# Objective:
#   To learn sed command-line
#   To learn about regular-exp
# Requirements:
#   Pass a filename through command-line.
#   Delete all the empty lines from that file and save it back.
#
if [[ $# -eq 0 ]]; then
echo -e "\t!!!ERROR!!!: No arguments passed."
echo -e "\tUse command line arguments to enter the numbers separated by spaces to be compared. $i"
echo -e "\tEnter as follows: ./Day09.sh <<filename>>"
exit 1
fi

sed '/^[[:space:]]*$/d' $1 > Day9del.txt
rm $1
mv Day9del.txt $1

exit 0