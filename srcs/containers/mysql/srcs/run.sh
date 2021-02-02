# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juyang <juyang@42student.co.kr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/28 19:01:08 by juyang            #+#    #+#              #
#    Updated: 2021/01/29 16:33:46 by juyang           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/mysql_install_db --user=root --datadir="/var/lib/mysql"
/usr/bin/mysqld --user=root --datadir="/var/lib/mysql" & sleep 5

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'juyang'@'%' IDENTIFIED BY 'juyang';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'juyang'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "ALTER USER 'juyang'@'%' IDENTIFIED BY 'juyang';" | mysql -u root --skip-password
echo "DROP DATABASE test" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mysql < /wordpress.sql

sleep infinite
