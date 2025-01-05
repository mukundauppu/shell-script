#!/bin/bash
USERID=$(id -u)
R="e\[31m"
G="e\[32m"
Y="e\[33m"
LOG_FOLER_NAME="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut "." -f1)
TIMESTAMP=$(date +%y -%m -%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE()
{
    if [ $? -ne 0 ]
    then
    dnf install mysql-server -y
    echo "Install mysql :Failure"
    else
    echo "Install mysql :Success"

}

   if [ $USERID -ne 0 ]
   then
   echo "Root id :Failure $R"
   exit 1
   else
   echo "Root id :Success $G"
   fi
    if [ $? -ne 0 ]
    then
    dnf install mysql-server -y
    VALIDATE $? "install mysql"
    else
    echo "Mysql already installed"
    fi
    if [ $? -ne 0 ]
    then 
    dnf install git -y
    VALIDATE $? "install git"
    else
    echo "Git already installed"
    fi
    
