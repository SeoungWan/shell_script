#!/bin/bash

PowerOFF() {
    sleep 2; echo "root"
    sleep 0.5; echo "soldesk1."
    sleep 0.5; echo "poweroff"
    sleep 0.5; echo "exit"
}

NET="192.168.10"
SERVERLIST="$NET.201 $NET.202"
for i in $SERVERLIST
do
    PowerOFF | telnet "$i"
done

echo "Pleas wait mins..."
sleep 15
poweroff
