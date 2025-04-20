#! /bin/bash

# User Input Script:
# Develop a script that prompts the user for input and performs actions based on that input:
# Ask for a filename and display its contents.
# Ask for a directory and list its files.
# Create a simple menu with options.


# --------------------- Ask for a filename and display its contents --------------------------------
read -p "Enter file name you want to view its contents: " FILENAME
if [ -f $FILENAME ]; then
    cat $FILENAME
else
    echo "___File does not exist___"
fi


# ------------------------- Ask for a directory and list its files -----------------------------------
read -p "Enter directory name you want to list its files: " DIRNAME
if [ -d $DIRNAME ]; then
    ls -lhart $DIRNAME
else
    echo "___Directory does not exist___"
fi


# ---------------------------- Create a simple menu with options -----------------------------------------
echo "----------Select an option from the menu below!-------------"
echo "1. Display date"
echo "2. Display my IP address"
echo "3. Display current directory"
echo "4. Exit"
read -p "Enter your choice: " CHOICE
case $CHOICE in
    1) date;;
    2) hostname -I;;
    3) pwd;;
    4) exit;;
    *) echo "Error: Invalid choice";;
esac
