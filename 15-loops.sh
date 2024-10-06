#!/bin/bash


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root priveleges"
        exit 1
    fi
}


VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is....$R FAILED $N"
        exit 1
    else 
        echo "$2 is ....$G SUCCESS $N"
    fi

}

CHECK_ROOT

# sh 15-loops.sh git mysql nginx
for package in $@   #$@ refers to all arguments passed to it
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo "git is not installed, going to intsall now"
        dnf install git -y
        VALIDATE $? "Listing git"
    else    
        echo "git is already installed, nothing to do"
    fi 

done
# if [ $USERID -ne 0 ]
# then 
#     echo " please run this script with root preveleges"
#     exit 1
# fi

# dnf list installed git


# if [ $? -ne 0 ]
# then 
#     echo "git is not installed, going to intsall now"
#     dnf install git -y
#     VALIDATE $? "Listing git"
# else    
#     echo "git is already installed, nothing to do"
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "mysql is not installed, going to install now"
#     dnf install mysql -y
#     VALIDATE $? "Listing mysql"
# else
#     echo "mysql is already intalled, nothing to do"
# fi