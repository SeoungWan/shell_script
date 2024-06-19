#!/bin/bash
echo
echo "[ENV2.sh] 편리한 기능 설정"

. ./functions.sh

# 편리한 기능
# * 바탕화면 아이콘 생성
# * 방화벽 OFF
# * SELINUX OFF
echo "[1. (기본) 편리한 기능 설정]"

# 1) 바탕화면 아이콘 생성
for i in $(gnome-extensions list)
do
    gnome-extensions enable $i
done
RET=$? && TrueFalse "$RET" "바탕화면 아이콘 생성"
cp /usr/share/applications/org.gnome.{Terminal.desktop,gedit.desktop} $HOME/바탕화면

# 2) 방화벽 OFF
SrvStart stop firewalld.service
RET=$? && TrueFalse "$RET" "방화벽 내리기"

# 3) SELinux OFF
sed -i 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
RebootYes
