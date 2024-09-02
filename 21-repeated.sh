#!/bin/bash
FILE_NAME=$1
WORD=${uniq -c}
if [ $FILE_NAME ]
then
cat $FILE_NAME 
echo " the words and their count i a file: $WORD"
fi