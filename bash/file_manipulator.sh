#! /usr/bin/bash

# File Management Script:
# Write a script that performs common file management tasks:
# Create a directory with a timestamped name.
# Copy files from one directory to another.
# Find and delete files older than a certain date.
# Rename files based on a pattern.

read -p "Enter folder name: " NAME
FOLDERNAME="$NAME$(date +'%s')"
mkdir "$FOLDERNAME"
echo "Folder created successfully"

cp ../linux_task/README.md $FOLDERNAME
echo "File copied from another folder into the created folder"

find test1742492967 -type f -mtime +1 -delete
echo "Files older than 1 day deleted"

for file in $FOLDERNAME/*; do
    mv $file $file"_new"
done
echo "Files renamed successfully"
