#!/bin/bash
SOURCE=$1
DEST=$2
DAYS=${3:-14}
LOG_FILE="/var/log/shellscriptlogs"
LOG_FOLDER=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1)
TIMESTAMP=$(date +Y-%m-%d-%H-%M-%S)
LOGS=$LOG_FILE/$LOG_FOLDER-$TIMESTAMP.log
Files=$(find $SOURCE -name "*.log" -mtime +$DAYS)
USAGE()
{
    echo -e "January5shell.sh <SOURCE_DIR> <DES_DIR> <DAYS>(optional)"
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
    ZIP="$DEST/app-log-$TIMESTAMP.zip"
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
    echo "=============== Failed to create zip file "
    exit 1
    fi
    else
    echo "No files found older than "
fi


