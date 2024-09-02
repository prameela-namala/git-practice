#!/bin/bash
FILE_NAME=$1
 
 if [ $FILE_NAME ]
 then 
    cat $FILE_NAME | sed "s/find/replace/g" 
fi


