FROM    alpine:latest

RUN     apk update && apk upgrade
RUN     apk add nginx
RUN     apk add php7 php-fpm php7-mbstring php7-session php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

COPY    ./srcs/nginx.conf /etc/nginx/nginx.conf

RUN     mkdir -p /run/nginx

RUN	wget https://wordpress.org/latest.tar.gz
RUN	tar -xvf latest.tar.gz
RUN	rm -f latest.tar.gz
RUN	mv wordpress /etc/

COPY    ./srcs/run.sh ./
COPY	./srcs/wp-config.php /etc/wordpress/

RUN     chmod +x ./run.sh

EXPOSE  5050

CMD     ./run.sh

