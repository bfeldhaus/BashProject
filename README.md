# BashProject
IT3038C Bash Project

File Organizer Script

Description: 
    This Script helps clean up cluttered folders by scanning the contents and sorting files based on their extensions into subfolders. 

How to use:
Organize current directory -->
./File_Organizer.sh

Organize a specific directory --> 
./File_Organizer.sh -d ~/Downloads 

Help menu -->
./File_Organizer.sh -h

Why its useful:
    Folders can become cluttered over time since organization isn't everyone’s top priority. Instead of manually going through the folders contents which can be time consuming and difficult. I have developed a script that automatically scans the contents and sorts them based on their file extensions. This makes it easier to locate documents, photos, images, and other file types.

Example:

Your Downloads folder includes --> 

photo.jpg
palmtree.png
sample.txt
report.pdf

After executing the script --> 

JPGFiles/photo.jpg
PNGFiles/palmtree.png
PDFFiles/report.pdf
TXTFiles/sample.txt

Your files have now been neatly organized into folders based on file extensions. 
