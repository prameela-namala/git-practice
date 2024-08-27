#!/bin/bash


USERID=$(id -u)
echo "userid is :$USERID"

if [ $USERID -ne 0 ]
then 
echo "please run this script with root prevelages"
 exit 1
fi
dnf list installed git
if [ $? -ne 0 ]
then
echo "git is not installed ,we are going to install"
dnf install -y
else
echo  "git is already installed,nothing to do"
fi