#! /usr/bin/bash

# Simple System Information Script:
# Create a script that displays basic system information, such as:
# Hostname
# Current date and time
# Uptime
# Disk space usage
# Memory usage
# This reinforces using date, uptime, df, free, and basic output formatting.

echo "------------------- System Information -------------------"
echo "--------- System hostname ------------"
hostname

echo "--------- System current Date and Time ------------"
date

echo "--------- System Uptime ------------"
uptime

echo "--------- System Disk Space Usage ------------"
df -h

echo "--------- System Memory Usage ------------"
free -h