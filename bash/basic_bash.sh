#! /usr/bin/bash

# This is a basic bash script


# ------------------------------------------------------------------------------------------------------
# # authentication
# read -p "Email: " EMAIL
# read -p "Password: " PASSWORD

# if [ -z "$EMAIL" ] && [ -z "$PASSWORD" ]; then
#     echo "Error: Values cannot be empty"
# elif [[ $EMAIL != *@* ]]; then
#     echo "Error: Not a valid email format"
# elif [ "$EMAIL" = "jd@gmail.com" ]  && [ "$PASSWORD" = "1234567" ]; then
#     echo "Welcome Philip Oyelegbin"
# else
#     echo "Error: Invalid Email or Password!"
# fi


# ------------------------------------------------------------------------------------------------------
# # arithmetic operations
# read -p "Enter first value: " VALUE1
# read -p "Enter second value: " VALUE2

# function add() {
#     echo "Addition: $(( $1 + $2 ))"
# }

# function subtract() {
#     echo "Subtraction: $(( $1 - $2 ))"
# }

# function multiply() {
#     echo "Multiplication: $(( $1 * $2 ))"
# }

# function divide() {
#     if [ $2 -eq 0 ] || [ $2 -lt 0 ] || [ $1 -lt $2 ]; then
#         echo "Error: Division operation can not be performed"
#     else
#         echo "Division: $(( $1 / $2 ))"
#     fi
# }

# add $VALUE1 $VALUE2
# subtract $VALUE1 $VALUE2
# multiply $VALUE1 $VALUE2
# divide $VALUE1 $VALUE2


# ------------------------------------------------------------------------------------------------------
# # loop operation
# NAME_ARRAY="John James Maxwell Gina Jane Linda"

# for ITEM in $NAME_ARRAY;
# do
#     echo "$ITEM"
# done


# ------------------------------------------------------------------------------------------------------
# # file operation
# read -p "Enter the file path: " FILE_PATH
# LINE=1

# while read -r CURRENT_LINE;
# do
#     echo "$LINE: $CURRENT_LINE"
#     ((LINE++))
# done < $FILE_PATH
