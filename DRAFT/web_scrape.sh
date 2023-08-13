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
#This will remove all "&amp;" and replace it with "and": 's/&amp;/and/g'
#This will remove all "&#8217;" and replace it with "'": "s/&#8217;/'/g"
#This will remove all "</ul>": "s/<\/ul>//g"
#This will remove everything in between "<h1 " and "</h1>": '/^<h1 /,/^\<\/h1>/{/^<h1 /!{/^\<\/h1>/!d}}'
#This will remove all "</div>": "s/<\/div>//g"

function strip_html() {
    grep -A 20 "<h3>.*8211" $DATA | sed -e 's/<h3>//g' -e 's/<\/h3>//g' -e 's/&#8211//g' -e 's/^[ \t]*//' -e 's/<strong>//g' -e 's/<\/strong>//g' -e 's/&amp;/and/g' -e "s/&#8217;/'/g" -e "s/<\/ul>//g" -e "s/<ul>//g" -e '/^<h1 /,/^\<\/h1>/{/^<h1 /!{/^\<\/h1>/!d}}' -e "s/<\/div>//g" > temp.txt && cp temp.txt $DATA && rm temp.txt

}




#CODE EXECUTION
dump_webpage
strip_html