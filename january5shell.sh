#!/bin/bash
SOURCE=$1
DEST=$2
DAYS=${3:-14}
LOG_FILE="/var/log/shellscriptlogs"
LOG_FOLDER=$(echo $0 | cut -d "." -f1)
echo "display $LOG_FOLDER"
TIMESTAMP=$(date +Y-%m-%d-%H-%M-%S)
LOGS=$LOG_FILE/$LOG_FOLDER-$TIMESTAMP.log
echo "$LOGS"
Files=$(find $SOURCE -name "*.log" -mtime +$DAYS)
USAGE()
{
    echo -e "January5shell.sh <SOURCE_DIR> <DES_DIR> <DAYS>"
    exit 1
}
mkdir -p /home/ec2-user/shellscriptlogs
if [ $# -lt 2 ]
then
echo USAGE
fi
if [ ! -d "$SOURCE" ] 
    then
    echo "Source files doesn't exit"
    exit 1
fi
if [ ! -d "$DEST" ]
    then
    echo "Dest files doesn't exist"
fi
if [ -n "$Files" ]
    then
    ZIP=$DEST/app-log-$TIMESTAMP.log
    find $SOURCE -name "*.log" -mtime +$DAYS | zip -@ "$Zip"
    if [ -f "$ZIP" ]
    then
    echo -e "please zip the file other than $DAYS"
    while read -r filepath
    do 
    echo "Deleting the file $filepath"
    rm -rf $filepath
    echo "deleted $filepath" 
    done <<<$FILES
    else
    echo "File to create zip files "
    exit 1
    fi
    else
    echo "No files found older than "
fi


