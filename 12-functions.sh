#!/bin/bash

#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is.... failed"
        exit 1
    else 
        echo "$2 is ....success"
    fi

}

if [ $USERID -ne 0 ]
then 
    echo " please run this script with root preveleges"
    exit 1
fi

dnf list installed git


if [ $? -ne 0 ]
then 
    echo "git is not installed, going to intsall now"
    dnf install git -y
    VALIDATE $? "Listing git"
else    
    echo "git is already installed, nothing to do"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install now"
    dnf install mysql -y
    VALIDATE $? "Listing mysql"
else
    echo "mysql is already intalled, nothing to do"
fi