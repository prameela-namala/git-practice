#!/bin/bash
FILE_NAME=$!

if [ $FILE_NAME ]

echo " the first line :$FILE_NAME " awk -F " " '{print $1F}' " "
fi