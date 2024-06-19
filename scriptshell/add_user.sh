#!/bin/bash

USERLIST=/root/script/user.list

cat $USERLIST | while read UNAME UPASS
do
    useradd $UNAME >/dev/null 2>&1
    [ $? -eq 0 ] && echo "[  OK  ] $UNAME added."
    echo $UPASS | passwd --stdin $UNAME >/dev/null 2>&1
    [ $? -eq 0 ] && echo "[  OK  ] $UNAME's password changed."
done

