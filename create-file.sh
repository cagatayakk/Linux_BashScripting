#Create a script. Ask user to enter a file name to create.
#If there is a file with the same name, print the message "The file already exists."
#If not, create the file and print the message "The file is created."


#!/bin/bash
read -p "Enter a file name: " file_name

if [[ -z "$(ls | grep $file_name)" ]]; then
        touch $file_name        
        echo "The file is created."
else    
        echo "The file already exists."
fi



# read -p "Enter a file name: " file_name

# if [[ "$(ls | grep $file_name)" = "$file_name" ]]; then
#         echo "The file already exists."
# else
#         touch $file_name
#         echo "The file is created."
# fi



# read -p "Enter a file name: " name

# if [[ -e $name ]]; then
#         echo "The file already exists."
# else
#         touch $name
#         echo "The file is created."
# fi



