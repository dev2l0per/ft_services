# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juyang <juyang@42student.co.kr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/28 17:48:19 by juyang            #+#    #+#              #
#    Updated: 2021/01/29 17:47:40 by juyang           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN	apk update && \
	apk add nginx openssh openssl

RUN	mkdir /www
RUN	mkdir /run/nginx

RUN	openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/localhost.dev.key -out /etc/ssl/certs/localhost.dev.crt

RUN	sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config
RUN	ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN	ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

COPY	./srcs/index.html /var/www/html/
COPY	./srcs/nginx.conf /etc/nginx/
COPY	./srcs/run.sh	./

RUN	chmod +x ./run.sh

EXPOSE	22
EXPOSE	80
EXPOSE	443

CMD	./run.sh
