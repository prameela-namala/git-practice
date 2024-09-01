#!/bin/bash
FILE_NAME=$1
uniq -c=$2
if [ $FILE_NAME ]
then
cat $FILE_NAME | $2 $FILE_NAME
echo " the words and their count i a file: $2"
fi