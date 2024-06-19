#!/bin/bash

echo -n "Enter your filename? : "
read FILE1

# echo $FILE1
if [ -f $FILE1 ]; then
    echo "[  OK  ] $FILE1 is a regular file."
elif [ -d $FILE1 ]; then
    echo "[  OK  ] $FILE1 is a directory file."
else
    echo "[ WARN ] $FILE1 is the others."
fi

