#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi
FILE1=$1

FILESIZE=$(wc -c < $FILE1)
if [ $FILESIZE -ge 5120 ]; then
    echo "[  OK  ] $FILE1($FILESIZE) is big file."
else
    echo "[  OK  ] $FILE1($FILESIZE) is small file."
fi
