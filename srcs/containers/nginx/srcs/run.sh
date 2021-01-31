# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juyang <juyang@42student.co.kr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/28 17:48:45 by juyang            #+#    #+#              #
#    Updated: 2021/01/28 17:48:46 by juyang           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

adduser -D "juyang"
echo "juyang:juyang" | chpasswd
chown -R juyang:juyang /home/juyang

/usr/sbin/sshd
/usr/sbin/nginx -g 'daemon off;'
