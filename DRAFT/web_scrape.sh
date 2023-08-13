#!/bin/bash
#CREATED BY: Christopher Chong
#DATE CREATED: 13AUG2023
#DATE LAST MODIFIED: 13AUG2023


#ASSIGN VARIABLES
#Curl command
CURL=$(which curl)

#Downloaded data
DATA="output.txt"

#URL to use
URL="https://www.webberinsurance.com.au/data-breaches-list"



#Dump webpage to output.txt
#Using "&>/dev/null" to remove webpage download progress data
function dump_webpage() {
    $CURL -o $DATA $URL &>/dev/null
}


#Clean the webpage by removing unwanted code
function strip_html() {
    grep "<h3>.*8211" $DATA | sed -e 's/<h3>//g' -e 's/<\/h3>//g' -e 's/&#8211//g' > temp.txt && cp temp.txt $DATA && rm temp.txt

}




#CODE EXECUTION
dump_webpage
strip_html