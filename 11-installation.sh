#!/bin/bash

USERID=$(id -u)

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
else    
    echo "git is already installed, nothing to do"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install now"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql intallation not success "
    else
        echo "mysql installation success"
    fi 
else
    echo "mysql is already intalled, nothing to do"
fi