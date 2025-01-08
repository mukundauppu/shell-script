#!/bin/bash
LOG_FILE="/var/log/shellscriptlogs"
LOG_FOLDER=$(echo $0 | cut -d "." -f1)
echo "display $LOG_FOLDER"
# TIMESTAMP=$(date +Y-%m-%d-%H-%M-%S)
# LOGS=$LOG_FILE/$LOG_FOLDER-$TIMESTAMP.log
# echo "$LOGS"
