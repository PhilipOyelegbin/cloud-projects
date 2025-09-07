#!/bin/bash

# Define some variables
USERNAME="johndoe"
PASSWORD="{RNyC.tQ:Ii82ult"
PACKAGE="nginx"

# Creating the new user with password
echo "Creating a new user: $USERNAME"

sudo useradd $USERNAME

sudo passwd $USERNAME << EOF
$PASSWORD
$PASSWORD
EOF

# Installing the package
echo "Installing the package: $PACKAGE"

sudo apt-get update
sudo apt-get install -y $PACKAGE

# Checking the status of the package
echo "Checking the status of the package: $PACKAGE"

sudo systemctl enable $PACKAGE
sudo systemctl start $PACKAGE

# Checking the status of the package
echo "Checking the status of the package: $PACKAGE"

sudo systemctl status $PACKAGE

# Success message
echo "User and package installation is completed!"