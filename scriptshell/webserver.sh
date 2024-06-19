#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <httpd|nginx>"
    exit 1
fi
WEBSVC=$1

HTTPD() {
    systemctl disable --now nginx >/dev/null 2>&1
    /root/script/httpd.sh
}

NGINX() {
    systemctl disable --now httpd >/dev/null 2>&1
    /root/script/nginx.sh
}

case $WEBSVC in
    'httpd') HTTPD ;;
    'nginx') NGINX ;;
    *) echo "[ FAIL ] 다시 실행하세유~~"
esac
