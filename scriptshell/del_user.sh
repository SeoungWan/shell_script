#!/bin/bash

USERLIST=/root/script/user.list
cat $USERLIST | while read UNAME UPASS
do
    userdel -r $UNAME
    [ $? -eq 0 ] && echo "[  OK  ] $UNAME deleted."
done

