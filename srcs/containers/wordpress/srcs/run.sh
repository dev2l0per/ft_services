#!bin/sh

/usr/sbin/php-fpm7 -D

nginx -g 'daemon off;'
