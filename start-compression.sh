#!/bin/bash

# Start deploy
clear

printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 

echo "Please enter zip file name"
read name

sh ./export-db.sh "$name"

printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 
printf "\n#### Move $name.sql to Files $name  \n" 
printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 

if [[ -e "$name" ]]; then
    rm -r $name
fi
mkdir "$name"
mv "$name.sql" "$name" 

echo "Please enter application path"
read app_path

directory_path="D:/dev/$app_path"
winrar_path="C:/Program Files/WinRAR/WinRAR.exe"
archive="C:/users/desca/desktop/$name.zip"

printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 
printf "\n#### Start compression files  \n" 
printf "\n#### Winrar path : "$winrar_path"  \n" 
printf "\n#### Directory path : "$directory_path"  \n" 
printf "\n#### Archive path : "$archive"  \n" 
printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 

printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 
printf "\n#### Delete file $archive  \n" 

if [ -e "$archive" ]; then
    rm -r $archive
fi

printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 

echo "Would you add exclude files ? no/yes "
read if_exclude_file

if [[ $if_exclude_file == "yes" ]]; then
    echo "Enter list files :"
    read -a list

    for f in "${list[@]}"; do
        exclude_file="$exclude_file -x$f"
    done
fi

cd "$directory_path"
if [[ $exclude_file ]]; then
    "$winrar_path" a -r "$archive" "." $exclude_file
else
    "$winrar_path" a -r "$archive" "." -xvendor/ -xresources/ -xtests/
fi

printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 
printf "\n#### End compression files  \n" 
printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 

printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 