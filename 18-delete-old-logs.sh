#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
if [ -d $SOURCE_DIR ]
then 
    echo -e "$SOURCE_DIR $G exists $N"
else
    echo -e " $SOURCE_DIR $R does not exist $N"
    exit 1
fi

FILES=$( find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files:: $FILES"

#dont use line word, it is a reserved word
while IFS= read -r file # IFS - internal field seperator, if it is empty it will ignore white spaces. -r is for not to ignore special chareters like /$ etc..
do
    echo "Deleting file : $file"
    rm -rf $file
done <<< $FILES