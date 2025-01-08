#!/bin/bash
LOG_FILE="/var/log/shellscriptlogs"
LOG_FOLDER=$(echo $0 | cut -d "." -f1)
echo "display $LOG_FOLDER"
TIMESTAMP=$(date +Y -%d -%m -%s -%H)
LOGS=$LOG_FILE/$LOG_FOLDER-$TIMESTAMP.log
echo "$LOGS"
