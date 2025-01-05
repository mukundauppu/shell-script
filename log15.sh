#!/bin/bash
USERID=$(id -u)
R="e\31[m"
G="e\32[m"
Y="e\33[m
LOG_FOLDER="/var/log/shellscripts"
LOG_FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y -%d -%m -%H -%M -%S)
LOG_FOLDER_FILE=$LOG_FOLDER\$LOG_FILE_NAME-$TIMESTAMP.log
VALIDATE()
{
if[ $1 -ne 0]
then
echo "install mysql :Failure"
else
echo "install mysql :Success"
fi
 }
if [ $USERID -ne 0 ]
then
echo "Display root : Failure"
else
echo "Display root : Success"
fi

dnf install mysql-server -y
VALIDATE $? "Install mysql server"
systemctl enable mysqld
VALIDATE $? "enable mysql server
systemctl start  mysqld
VALIDATE $? "Start mysql server"


