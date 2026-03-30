#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./log_analyzer.sh /var/log/syslog error

LOGFILE=${1:-"/var/log/syslog"} # Defaults to syslog if no argument is passed
KEYWORD=${2:-"error"}
COUNT=0

# Do-while style retry if the file is missing or empty
while [ ! -s "$LOGFILE" ]; do
    echo "Error: File $LOGFILE not found or is empty."
    read -p "Enter a valid log file path to analyze: " LOGFILE
done

# Read loop
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "----------------------"
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "----------------------"
echo "Last 5 matching lines:"
# Print the last 5 matching lines using tail and grep
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
