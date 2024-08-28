#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER



USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root priveleges" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}
echo "Script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

# sh 15-loops.sh git mysql postfix nginx
for package in $@ # $@ refers to all arguments passed to it
do
    dnf list installed $package &>>$LOG_FILE

    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.."&>>$LOG_FILE 
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo -e " $package $Y is already installed..nothing to do $N " | tee -a $LOG_FILE
    fi
done