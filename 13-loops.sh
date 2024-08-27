#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m
Y="\e[33m"
N="\e[0m"


CHECK-ROOT()
{
if [ $USERID -ne 0 ]
echo  "please run with root prveliages"
exit 1
fi
}

VALIDATE()
{
 if [ $1 -ne 0 ]
 then 
   echo "$2 is ...$R failed $N "
   exit 1
   else
   echo "$2 is....$G success $N "
   fi

}

CHECK_ROOT

for  package in $@
do
   dnf list installed $package

   if [$? -ne 0]
   then
   echo "$package is not installed,going to install it.."


dnf install $package -y
VALIDATE $? "installing package"
else
  echo "$package already installed"
  fi

  done