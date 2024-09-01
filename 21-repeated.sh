#!/bin/bash
FILE_NAME=$1
if [ $FILE_NAME ]
then
cat $FILE_NAME
echo "unique -c $FILE_NAME" 
fi