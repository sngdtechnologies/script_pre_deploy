#!/bin/bash

# Param
printf "\n-------------------------------------------------------------------------------------------------------------------------------- \n" 

echo "Please enter application path"
read app_path

navigator_path="C:/Program Files/Mozilla Firefox/firefox.exe"
projet_path="D:/dev/$app_path"

"$navigator_path"
wt

cd "$projet_path"
code .

printf "\n####  \n" 