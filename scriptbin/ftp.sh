#!/bin/bash

yum -y install vsftpd ftp

sed -i 's/^root/#root/' /etc/vsftpd/ftpusers
sed -i 's/^root/#root/' /etc/vsftpd/user_list

systemctl enable --now vsftpd


