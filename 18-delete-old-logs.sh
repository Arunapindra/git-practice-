#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
if [ -d $SOURCE_DIR ]
then 
    echo -e "$G $SOURCE_DIR exixts $N"
else
    echo -e "$R $SOURCE_DIR does not exist $N"
    exit 1
fi
