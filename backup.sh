#!/bin/bash
R="e\[31m"
G="e\[32m"
Y="e\[33m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
LOG_FOLER_NAME="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut "." -f1)
TIMESTAMP=$(date +%y -%m -%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log

USAGE()
{
echo  "$R USAGE $N sh backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>" 
exit 1
}
mkdir -p home/ec2-user/shellscript-logs"
if [ $# -lt 2 ]
then
USAGE
fi
if [ ! -d $"SOURCE_DIR" ]
then
echo "$SOURCE_DIR  does not exist"
fi
if [ ! -d $"DEST_DIR" ]
then
echo "$DEST_DIR  does not exist"
fi
Files=$(find $SOURCE_DIR -name "*.log"-mtime +$DAYS)
echo "Files are $File"
if [ -n "$FILES" ]
then
echo "Files are $Files"
ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
find $SOURCE_DIR -name "*.log"-mtime +$DAYS | zip -@ "$ZIP_FILE"
if [ -f "$ZIP_FILE" ]
then 
echo "Zip fils are there $ZIP_FILE"
else
echo "Zip fils are not there"
fi
echo "No Files "
fi

