#!/bin/bash

echo -n "Input A: "
read A

echo -n "Input B: "
read B

cat << EOF
==============================================
 (1). +    (2). -    (3). *    (4). /
==============================================
EOF
echo -n "Enter your OP: "
read OP

case $OP in
    1) echo "$A + $B = $(expr $A + $B)"  ;;
    2) echo "$A - $B = $(expr $A - $B)"  ;;
    3) echo "$A x $B = $(expr $A \* $B)" ;;
    4) echo "$A / $B = $(expr $A / $B)"  ;;
    *) echo "[ FAIL ] Operation failed." 
       exit 1 ;;
esac


