#!\bin\bash

USERID=$(id -u)


R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m]]"

CHECK_ROOT(){

if [ $USERID -ne 0 ]
then
  echo "please run the script with root privelages"
  
  exit 1

fi  

}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 is......$R FAILED $N"

       exit 1
    else
      echo -e "$2 is.....$G SUCCESS $N "

    fi

}



CHECK_ROOT

for package in $@
 do
   dnf list installed $package

  if [ $? -ne 0 ]
   then
       echo "$package is not installed. we are going to install now"

     dnf install $package -y
     VALIDATE $? "installing $package"
  else
    echo "$package is already installed.Nothing to do"
 fi

 done      