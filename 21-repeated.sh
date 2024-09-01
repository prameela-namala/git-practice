#!/bin/bash
FILE_NAME=$1
if [ $FILE_NAME ]
then
cat $FILE_NAME
echo " print frequently occured words "uniq -c" $FILE_NAME" 
fi