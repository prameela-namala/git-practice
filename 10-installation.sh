#!/bin/bash


USERID=$(id -u)
echo "userid is :$USERID"

if [ $USERID -ne 0 ]
then 
echo "please run this script with root prevelages"
fi
dnf install git -y
dnf list installed git
if [ $? -ne 0 ]
then
echo "git is not installed ,we are going to install"
else
dnf install git -y
echo  "git is already installed,nothing to do"
fi