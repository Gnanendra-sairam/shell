#!/bin/bash
###########################################################################################
# This script analyzes log files and extract useful information like error, fatal, cretical
# author : @sairam
# date   : 2026-04
# version: v1
# usage  : ./analyze_logs.sh /path/to/log/files
###########################################################################################

# Check if the log directory is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/log/files"
    exit 1
fi
LOG_DIR="$1"
# Check if the provided argument is a valid directory
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: $LOG_DIR is not a valid directory."
    exit 1
fi

# Analyze log files and extract useful information
error_patterns=("error" "fatal" "critical")
modified_files=(find "$LOG_DIR" -type f -name "*.log" -mmin -60)
for file in $modified_files
echo "Analyzing $file..."
do
    for pattern in "${error_patterns[@]}"
    echo "Searching for '$pattern' in $file..."
    do
        echo "Count of '$pattern' in $file: "
        grep -c "$pattern" "$file"

        echo "Lines containing '$pattern' in $file: "
        grep "$pattern" "$file"
    done
done