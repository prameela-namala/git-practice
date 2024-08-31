#!/bin/bash
DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5
while IFS= read -r line
do 
USAGE=$(echo $line  df -hT | grep xfs |awk -F " " '{print $6F}' |cut -d "%" -f1)
    PARTITION=$(echo $line  df -hT | grep xfs |awk -F " " '{print $NF}')
    if [ $USAGE -ge $disk_threshold ]
    then 
      echo "$PARTITION is more than $THRESHOLD:current value is $USAGE"
done <<< $DISK_USAGE   