#!/bin/bash
#CREATED BY: Christopher Chong
#DATE CREATED: 20JUL2023
#DATE LAST MODIFIED: 19AUG2023

#Color code variables
red_color='\033[31m'
green_color='\033[32m'
yellow_color='\033[33m'
NC='\033[0m'

#Text formatting
bold=$(tput bold)

#Colored outputs
ENTERPASS=$(printf "${yellow_color}${bold}Enter Password: ${NC}")
GRANTED=$(printf "${green_color}Access Granted${NC}")
DENIED=$(printf "${red_color}Access Denied${NC}")

#Prompt user to type a secret password (hide that input) and save as a variable.
read -rsp "$ENTERPASS" secretPassword
# printf "${red_color}Enter Password: ${NC}\n"

#Add space for resulting message to user
echo

#Check the user’s password against the hash stored in 'secret.txt'and if the user’s password is correct, print “Access Granted” and quit with the exit code 0.
#Used "&>/dev/null" to suppress sha256sum warnings
if [[ $(echo -n "$secretPassword" | sha256sum -c ./secret.txt) = "-: OK" ]] &>/dev/null
then

    #Display Access Granted to user
    echo "$GRANTED"

    #Exit code 
    exit 0

#Check the user’s password against the hash stored in 'secret.txt' and if the user’s password is incorrect print “Access Denied” and quit with the exit code 1.
else 

    #Display Access Denied to user
    echo "$DENIED"
    
    #Exit code
    exit 1
fi 