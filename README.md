# [Scripting Languages - CYB6004.1] Assessment 4: Software-Based Solution (Christopher Chong)
---

 ## Description of Software

- Task
  - Analyse a cybersecurity website and then extract and process useful data using Bash.
    
- Chosen website
  - https://www.webberinsurance.com.au/data-breaches-list

- Purpose of the software?
  - The purpose of the software is to provide a friendly Command Line Interface to Webber Insurance's "data breach list" that provides links toarticles on various external websites.

- Target audience?
  - The target audience is anyone in need of tracking major cyber security breaches.  


---

 ## Link to Source Control Repository

Github:

https://github.com/chrismyhub/assessment4

---

## Features/Functionality
This software will have the following features/functionalities:

1. Display top 10 latest articles.
   - This feature will allow the user to quickly see what the latest articles are without having to search the website for dates.

2. Display all articles.
   - This feature will allow those who want to see the full list of articles at the press of a button.

3. Search articles by year.
   - This feature will allow the user to search articles by year and get the relevant years displayed quickly.

4. Search articles by business name.
   - This feature will allow the user to search articles by business name and get it listed.

5. Search articles by keyword.
   - This feature will aloow the user to search articles by keyword and get all results listed.


---
## How to use the Software
1. Run ./menu.sh

2. It will prompt you to enter a password.  Type the number 12345 and then press ENTER.

3. If the password is entered correctly, you will see the main menu.  If not,it will exit the script and you will have to repeat step 1 again.

4. On the main menu you will see options 1-6.  Please type in an option number and press ENTER.
  -(NOTE: Options 1-2 will automatically run without further input)

5. If you select Options 3, 4 or 5 you will be prompted to type in a search criteria (for example, option 3 will prompt you to type in a YEAR to search ...e.g. 2023)

6. Once your search has been filtered and listed, at the bottom of the table there will be a prompt for you to "Enter Article No.: ".  Please type the number that is attahed to the article you are interested in and then press ENTER.  This number can be found on the same line as the article on the very far left column.

7. An external website link will then be shown to you and you can either copy and paste that into your preferred browser or if your CLI allows for direct link clicking press the relevant keyboard shortcut key and select the link (for Windows, it is normally the CTRL key to enable this).

8. From here you will be prompted to "Press any enter to continue...", doing so will bring you back to the main menu.

9. You will have options 1-6 to choose from again, alternatively you can either select option 6 to EXIT or type the word exit to quit the software.
 
---
 ## <u>REFERENCED SOURCES</u>
<br>
<font size="1">
1.  GitHub. 2023. GitHub: Where the world builds software. [online] Available at: < https://github.com/ > [Accessed 20 August 2023].
<br>
<br>
2.  Webber Insurance. 2023. Webber Insurance Services. [online] Available at: < https://www.webberinsurance.com.au/ > [Accessed 20 August 2023].
<br>
<br>
