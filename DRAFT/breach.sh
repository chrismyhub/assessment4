#!/bin/bash
#CREATED BY: Christopher Chong
#DATE CREATED: 12AUG2023
#DATE LAST MODIFIED: 15AUG2023

#This is the beginning of the awk script.
#It includes the File Separator.
#Set each column heading as a variable and call on it, to be able to add buffer to the column.   
#Filter for only "/bin/bash" usinf IF Statement. 
awk 'BEGIN { 
      
    FS=";";
    ENTITY="Entity";
    MONTHYEAR="Month/Year";
    LINK1="Link";
    LINK1TITLE="Title";
      
    print "_______________________________________________________________________________________________________________"; 
      
    printf("| \033[34m%-20s\033[0m | \033[34m%-5s\033[0m | \033[34m%-7s\033[0m  |\n", ENTITY, MONTHYEAR, LINK1TITLE); 
    printf("| \033[34m%-20s\033[0m | \033[34m%-6s\033[0m | \033[34m%-7s\033[0m  | \033[34m%-35s\033[0m  |\n", "", "", "", "", "");  
} 
      
{ 

    printf("| \033[33m%-20s\033[0m | \033[35m%-6s\033[0m | \033[35m%-8s\033[0m |\n", $1, $2, $4); 
      
} 
     
END { 
      
    print("_______________________________________________________________________________________________________________"); 
      
}' output.txt