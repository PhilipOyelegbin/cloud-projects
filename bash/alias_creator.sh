# this is an alais creation autmation script
# run the command "source alais.sh" to implement the alias on terminal

#! /usr/bin/bash

alias cls=clear
alias lss='ls -lhart $*'
alias dfh='df -h'
alias aptu='sudo apt-get update && sudo apt-get upgrade -y'
alias apti='sudo apt-get install -y $*'
alias aptr='sudo apt autoremove'

echo "Alias script ran successfully..."
