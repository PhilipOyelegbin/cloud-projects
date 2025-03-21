#! /bin/bash

# Log File Analyzer:
# Create a script that reads a log file and performs simple analysis:
# Counts the number of lines.
# Finds and displays lines containing a specific keyword.
# Extracts specific data from the log file.


# ------------------------ Check if the log file exists --------------------------------
echo "Searching for log file..."
if [ ! -f $1 ]; then
    echo "Log file not found!"
    exit 1
fi


# ---------------------- Count the number of lines in the log file -----------------------------------
line_count=$(wc -l $1 | awk '{print $1}')
echo "Number of lines in the log file: $line_count"


# ----------------- Find and display lines containing a specific keyword ------------------------------
read -p "Enter a keyword to search for in the log file: " KEYWORD
grep -i $KEYWORD $1
echo ""
echo "Lines containing the keyword: $KEYWORD"
echo ""


