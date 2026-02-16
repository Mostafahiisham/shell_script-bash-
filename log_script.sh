#!/bin/bash

LOG_FILE="/var/log/syslog"  #Select the path
SEARCH_PATTERN=""
OUTPUT_FILE="/home/mostafa/hourly_log_count.txt"   #Select the path

while true
do
    
    PREV_HOUR=$(date -d "1 hour ago"  '+%F %H')

    # Count the log during the previous hour.
    COUNT=$(grep -c "[ERROR] $PREV_HOUR.*$SEARCH_PATTERN" "$LOG_FILE")

    #Testing point.
    echo "[ERROR] $PREV_HOUR $SEARCH_PATTERN"

    # Save result with timestamp
    echo "$(date '+%Y-%m-%d %H:%M:%S') | Hour: ${PREV_HOUR}:00 | Count: ${COUNT}" >> "$OUTPUT_FILE"

    # Wait one hour : 60 min * 60 second (so that the code inspect the logs every one hour)
    sleep 3600
done
