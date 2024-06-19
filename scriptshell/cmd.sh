#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <CMD>"
    exit 1
fi
CMD="$*"

NET=192.168.10
for i in $(seq 200 202)
do
    ping -c 1 -W 1 $NET.$i >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "------ [  OK  ] $NET.$i ------"
        ssh "$NET.$i" "$CMD"
        echo
    else
        echo "------ [ FAIL ] $NET.$i ------"
        echo
    fi
done
