#!/bin/bash

IPS="192.168.10.200 192.168.10.201 192.168.10.202"
for i in $IPS
do
	# echo $i
	ping -c 1 $i >/dev/null 2>&1
	if [ $? -eq 0 ] ; then
		echo "[  OK  ] $i"
	else
		echo "[ FAIL ] $i"
	fi
done


