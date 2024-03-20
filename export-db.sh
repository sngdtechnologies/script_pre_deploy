#!/bin/bash

# Param
if [[ $1 ]]; then
    name="$1"
else
    echo "Please enter file name"
    read name
fi

mysqlDir="C:/Program Files/MySQL/MySQL Server 8.0/bin"
mysql="$mysqlDir/mysql.exe"
mysqldump="$mysqlDir/mysqldump.exe"
user="admin"
password="aj%dfn$&ldcv21JK"
port="3301"
exportPath="$name.sql"

# export the database
if [[ -e "$exportPath" ]]; then
    rm -r $exportPath
fi

"$mysqldump" -u$user -P$port -p$password testlang --no-tablespaces --single-transaction  --no-data  | sed 's/ AUTO_INCREMENT=[0-9]*\b//g' > $exportPath

printf "\n#### Export completed to the path: $exportPath  \n" 