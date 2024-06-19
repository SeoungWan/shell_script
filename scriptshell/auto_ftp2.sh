#!/bin/bash

SERVERLIST=/root/script/server.txt

for i in $(cat $SERVERLIST)
do
    ftp -n "$i" 21 << EOF
    user root soldesk1.
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mput testfile.txt
    quit
EOF
done
