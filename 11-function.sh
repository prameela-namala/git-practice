#!/bin/bash
#!/bin/bash

VALIDATE()
{

if [ $1 -ne 0 ]
then
echo "$2 is not installed ,we are going to install"
else
echo  "$2 already installed,nothing to do"
fi
}
USERID=$(id -u)
echo "userid is :$USERID"

if [ $USERID -ne 0 ]
then 
echo "please run this script with root prevelages"
fi


dnf list installed git
VALIDATE $?
#dnf install git -y


dnf list installed mysql
VALIDATE $?
#dnf install mysql -y
