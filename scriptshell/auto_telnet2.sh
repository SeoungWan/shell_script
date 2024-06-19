#!/bin/bash

cat /root/script/server.list | while read IP UNAME UPASS
do
	Cmd() {
		sleep 2 ; echo "$UNAME"
		sleep 0.5 ; echo "$UPASS"
		sleep 0.5 ; echo 'hostname'
		sleep 0.5 ; echo 'ls -l'
		sleep 0.5 ; echo 'exit'
	}
	Cmd | telnet "$IP"
done
