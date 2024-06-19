#!/bin/bash

echo -n "Enter your choice? (yes/no) : "
read CHOICE

case $CHOICE in
    y|Y|yes|YES|Yes) echo "YES" | boxes -d boy ;;
    n|N|no|NO|No   ) echo "NO"  | boxes -d boy ;;
    *) echo "ERROR" | boxes -d boy ;;
esac
    