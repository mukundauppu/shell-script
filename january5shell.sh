#!/bin/bash
SOURCE=$1
DEST=$2
DAYS={3:-14}
LOG_FILE="/var/log/shellscriptlogs"
LOG_FOLDER=$(echo $0 | cut -d "." -f1)
echo "display $LOG_FOLDER"
TIMESTAMP=$(date +Y-%m-%d-%H-%M-%S)
LOGS=$LOG_FILE/$LOG_FOLDER-$TIMESTAMP.log
echo "$LOGS"
Files=$(find . -name "*.log" -mtime +14)
USAGE()
{
    echo -e "January5shell.sh <SOURCE_DIR> <DES_DIR> <DAYS>"
    exit 1
}
mkdir -p /home/ec2-user/shellscriptlogs
if [ $# - lt 2 ]
then
echo USAGE
fi