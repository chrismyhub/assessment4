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
#This will remove all "<h3>" tags: 's/<h3>//g'
#This will remove all "</h3>" tags: 's/<\/h3>//g'
#This will remove all "&#8211": 's/&#8211//g'
#This will remove all spaces at the beginning of each line: s/^[ \t]*//'
#This will remove all "<strong>": 's/<strong>//g'
#This will remove all "</strong>": 's/<\/strong>//g'
function strip_html() {
    grep "<h3>.*8211" $DATA | sed -e 's/<h3>//g' -e 's/<\/h3>//g' -e 's/&#8211//g' -e 's/^[ \t]*//' -e 's/<strong>//g' -e 's/<\/strong>//g' > temp.txt && cp temp.txt $DATA && rm temp.txt

}




#CODE EXECUTION
dump_webpage
strip_html