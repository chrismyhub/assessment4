#!/bin/bash
#CREATED BY: Christopher Chong
#DATE CREATED: 12AUG2023
#DATE LAST MODIFIED: 19AUG2023

#This is the beginning of the awk script.
#It includes the File Separator.
#Set each column heading as a variable and call on it, to be able to add buffer to the column.   
#Filter for only "/bin/bash" usinf IF Statement. 

#Filter for top 10 latest Articles
# Use this to search for containing string:
    #if ($2 ~ /2023/)

awk 'BEGIN { 
    FS="|";
    BUSINESS_MONTH_YEAR="Business / Month / Year";
    LINK="Link";
    LINK_TITLE="Title";
    NUM="No."; 
    printf "Enter Year to search: "
    getline foo < "/dev/stdin"

        print "_______________________________________________________________________________________________________________";
        printf("| \033[34m%-5s\033[0m | \033[34m%-40s\033[0m | \033[34m%-40s\033[0m | \033[34m%-7s\033[0m  |\n", NUM, BUSINESS_MONTH_YEAR, LINK_TITLE, LINK);
        printf("| \033[34m%-5s\033[0m | \033[34m%-40s\033[0m | \033[34m%-40s\033[0m | \033[34m%-7s\033[0m  |\n", "", "", "", "", "");  
} 
      
{ 
    
    if ($2 ~ foo)
        printf("| \033[33m%-5s\033[0m | \033[33m%-40s\033[0m | \033[35m%-40s\033[0m |\n", $1, $2, $3); 
} 
     
END { 
      
    print("_______________________________________________________________________________________________________________"); 
    
      
}' output_final.txt


#Filtered for User input
awk 'BEGIN { 
    FS="|";
    BUSINESS_MONTH_YEAR="Business / Month / Year";
    LINK="Link";
    LINK_TITLE="Title";
    NUM="No."; 
    printf "Enter Article No.: "
    getline lineLink < "/dev/stdin"


    if (lineLink == "")  
        print "_______________________________________________________________________________________________________________"; 
    if (lineLink == "") 
        printf("| \033[34m%-5s\033[0m | \033[34m%-40s\033[0m | \033[34m%-40s\033[0m | \033[34m%-7s\033[0m  |\n", NUM, BUSINESS_MONTH_YEAR, LINK_TITLE, LINK);
    if (lineLink == "")  
        printf("| \033[34m%-5s\033[0m | \033[34m%-40s\033[0m | \033[34m%-40s\033[0m | \033[34m%-7s\033[0m  |\n", "", "", "", "", "");  
    if (lineLink != "")
        print "The link to the article: "; 
} 
      
{ 

    if (lineLink != "")
        if ($1 ==lineLink)
            printf("| \033[33m%-5s\033[0m \n", $4);

    if (lineLink == "") 
        printf("| \033[33m%-5s\033[0m | \033[33m%-40s\033[0m | \033[35m%-40s\033[0m |\n", $1, $2, $3); 
} 
     
END { 
      
    print("_______________________________________________________________________________________________________________"); 
    
      
}' output_final.txt