#!/bin/bash
#CREATED BY: Christopher Chong
#DATE CREATED: 12AUG2023
#DATE LAST MODIFIED: 15AUG2023

#This is the beginning of the awk script.
#It includes the File Separator.
#Set each column heading as a variable and call on it, to be able to add buffer to the column.   
#Filter for only "/bin/bash" usinf IF Statement. 
awk 'BEGIN { 
      
    FS="|";
    BUSINESS_MONTH_YEAR="Business / Month / Year";
    LINK="Link";
    LINK_TITLE="Title";
    NUM="No.";
      
    print "_______________________________________________________________________________________________________________"; 
      
    printf("| \033[34m%-5s\033[0m | \033[34m%-40s\033[0m | \033[34m%-40s\033[0m | \033[34m%-7s\033[0m  |\n", NUM, BUSINESS_MONTH_YEAR, LINK_TITLE, LINK); 
    printf("| \033[34m%-5s\033[0m | \033[34m%-40s\033[0m | \033[34m%-40s\033[0m | \033[34m%-7s\033[0m  |\n", "", "", "", "", "");  
} 
      
{ 

    printf("| \033[33m%-5s\033[0m | \033[33m%-40s\033[0m | \033[35m%-40s\033[0m |\n", $1, $2, $3); 
    
} 
     
END { 
      
    print("_______________________________________________________________________________________________________________"); 
      
}' output_final.txt