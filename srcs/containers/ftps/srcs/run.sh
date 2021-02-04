#!/bin/sh

mkdir -p /ftps/juyang
adduser --home=/ftps/juyang -D juyang

echo "juyang:juyang" | chpasswd

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
