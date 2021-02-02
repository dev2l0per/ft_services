# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juyang <juyang@42student.co.kr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/28 17:48:55 by juyang            #+#    #+#              #
#    Updated: 2021/01/29 16:52:03 by juyang           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN	apk update && apk upgrade
RUN	apk add nginx
RUN	apk add php7 php-fpm php7-mbstring php7-session php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

COPY	./srcs/nginx.conf /etc/nginx/nginx.conf

RUN	mkdir -p /run/nginx

RUN	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN	tar -xvf /phpMyAdmin-5.0.4-all-languages.tar.gz
RUN	rm -f /phpMyAdmin-5.0.4-all-languages.tar.gz
RUN	mv /phpMyAdmin-5.0.4-all-languages /etc/phpmyadmin

COPY	./srcs/config.inc.php /etc/phpmyadmin/
COPY	./srcs/run.sh ./

RUN	chmod +x ./run.sh

EXPOSE	5000

CMD	./run.sh
