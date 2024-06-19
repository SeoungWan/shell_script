#!/bin/bash

cat << EOF
    ############
    # 1) who
    # 2) date
    # 3) pwd
    ############    
EOF
echo -n "Enter you choice?(1/2/3) : "
read CHOICE
# echo $CHOICE

case $CHOICE in
    1) who | boxes -d boy ;;
    2) date | boxes -d boy ;;
    3) pwd | boxes -d boy ;;
esac

