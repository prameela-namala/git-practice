#!/bin/bash
FILE_NAME=$1
 
 if [ $FILE_NAME ]
 then 
   echo "content in the file before replace :: cat $FILE_NAME"
   echo "content in the file after replace : : cat $FILE_NAME | sed "s/find/replace/g"
fi


