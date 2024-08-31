#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3: -14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
USAGE(){
    echo "USAGE::sh 19.backup.sh <sourcefile> <destination> <days(optional)>
}
if [$# -lt 2 ]
then  
  USAGE
  exit 1
fi

if [! -d $SOURCE_DIR ]
then 
echo "$SOURCE_DIR does not exist...please check"
fi
if [ ! -d $DEST_DIR ]
then 
 echo "$DEST_DIR does not exist...please check"
fi
FILES=$(find ${SOURCE_DIR} -NAME "*.log" -mtime +14)
if [ -z $FILES ]
then
 echo "files are found "
 ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
 find ${SOURCE_DIR} -name "*.log" -mtime +14 |zip "$ZIP_FILE" -@

   if [ -f $ZIP_FILE ]
      then
        echo "successfully zipped files older than $DAYS"
        while IFS= read -r
     do
   echo "deleting file:$file"
   rm -rf $file
   done <<< $FILES
   else 
     echo "zipping the file is failed"
    exit 1
    fi  
else
echo "nofiles older than $DAYS"
fi