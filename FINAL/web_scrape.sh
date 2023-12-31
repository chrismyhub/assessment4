#!/bin/bash
#CREATED BY: Christopher Chong
#DATE CREATED: 13AUG2023
#DATE LAST MODIFIED: 19AUG2023


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
#This will remove all "</div>": "s/<\/div>//g"
#Using "\" after each sed command to shorten the sed command line.
#Using grep -v -w to remove lines containing website's social media.
#This will remove all "<li><a href=" and variations of it and replace it with "; "
    #"| sed -e :a -e '$!N;s/\n<li>,*<a href="/ ; /;ta' -e 'P;D'"
#This will remove all "" target="_blank" rel="noopener">" and replace it with " ; "
    #'s/" target="_blank" rel="noopener">/ ; /g'
#This will remove all "</a></li>": "<\/a><\/li>"
#This will remove all "</li>": "<\/li>"
#This will remove all "</a>": "<\/a>"
#This will remove all "&#8216;": 's/&#8216;//g'
#This will remove all "" target="_blank" rel="noopener noreferrer">" and replace it with " ; "
    #'s/"" target="_blank" rel="noopener noreferrer">/ ; /g'
#This will remove all "&#8230": 's/&#8230//g' 

# TEMP UNUSED: | awk '{printf("%01d %s\n", NR, $0)}' \
# TEMP UNUSED:     | sed -e 's/^/ ; /' \

function strip_html() {
    grep -e "<h3>.*8211" -e "<li>" $DATA \
    | grep -v -w twitter.com/webberinsurance \
    | grep -v -w www.linkedin.com/company/webber-insurance-services \
    | grep -v -w www.instagram.com/webberinsurance \
    | grep -v -w plus.google.com/+WebberinsuranceAu \
    | grep -v -w https://www.facebook.com/webberinsurance \
    | sed -e 's/<h3>//g' \
    -e 's/<\/h3>//g' -e 's/^[ \t]*//' -e 's/">/ ; /' \
    -e 's/<strong>//g' -e 's/<\/strong>//g' -e 's/&amp;/and/g' \
    -e "s/<\/ul>//g" -e "s/<ul>//g" -e "s/<br \/>//g" \
    -e "s/<\/div>//g" -e 's/" target="_blank" rel="noopener">/ ; /g' \
    -e 's/<\/a><\/li>//g' -e 's/<\/li>//g' -e 's/<\/a>//g'\
    -e 's/" target="_blank" rel="noopener noreferrer">/ ; /g' \
    -e 's/" target="_blank" rel="noopener noreferrer ;/ ; /g'  \
    -e 's/" target="_blank" rel="noopener ;/ ; /g'  \
    | sed -e :a -e '$!N;s/\n<li>.*<a href="/ ; /;ta' -e 'P;D' \
    | sed -e 's/|//g' \
    -e 's/&#8217;//g' \
    -e 's/&#8216;//g' \
    -e 's/&#8220;//g' \
    -e 's/&#8221;//g' \
    -e 's/&#8230;//g' \
    -e 's/&#8211;//g' \
    -e 's/amp;//g' \
    | sed -e 's/<[^>]*>//g' \
    > temp.txt && cp temp.txt $DATA && rm temp.txt

}





#CODE EXECUTION
dump_webpage
strip_html