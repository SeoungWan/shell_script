#!/bin/bash
# copy.sh send|recv FILE DIR

Usage() {
    echo "Usage: copy.sh <send|recv> <src_file> <dest_dir>"
    echo "Example: copy.sh send file.txt /tmp"
}

if [ $# -ne 3 ]; then
    Usage
    exit 1
fi
ACTION=$1
SRC_FILE=$2
DST_DIR=$3

SendFile() {
    for i in $(seq 200 202)
    do
        ping -c 1 -W 1 $NET.$i >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "------ [  OK  ] $NET.$i ------"
            # scp file1 192.168.10.202:/tmp
            scp "$SRC_FILE" "${NET}.${i}:${DST_DIR}"
            echo
        else
            echo "------ [ FAIL ] $NET.$i ------"
            echo
        fi
    done
}

RecvFile() {
    for i in $(seq 200 202)
    do
        ping -c 1 -W 1 $NET.$i >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "------ [  OK  ] $NET.$i ------"
            HNAME=$(ssh $NET.$i hostname)
            # scp 192.168.10.202:/tmp/file1 /tmp/file1.linux200
            DST_FILE=$(basename $SRC_FILE)
            scp "${NET}.${i}:$SRC_FILE" "${DST_DIR}/$DST_FILE.$HNAME"
            echo
        else
            echo "------ [ FAIL ] $NET.$i ------"
            echo
        fi
    done
}

NET=192.168.10
case $ACTION in
    'send') SendFile ;;
    'recv') RecvFile ;;
    *) Usage ; exit 2 ;;
esac
