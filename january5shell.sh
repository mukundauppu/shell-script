#!/bin/bash
LOG_FILE="/var/log/shellscriptlogs"
LOG_FOLDER=$(echo $0 | cut -d "." -F1)
echo "display $LOG_FOLDER"