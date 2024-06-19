#!/bin/bash

# 원격 접속 & 백업 수행(tar CMD)
SERVER=192.168.10.201
UNAME=root
UPASS=soldesk1.

Cmd() {
    sleep 2; echo "$UNAME"
    sleep 0.5; echo "$UPASS"
    sleep 0.5; echo 'mkdir -p /backup'
    sleep 0.5; echo 'tar cf /backup/home.tar.gz /home'
    sleep 0.5; echo 'exit'
}
Cmd | telnet $SERVER 23

# 파일 전송
ftp -n $SERVER 21 << EOF
user root soldesk1.
cd /backup
lcd /tmp
bin
hash
prompt
mget home.tar.gz 
bye
EOF

ls -lh /tmp/home.*
