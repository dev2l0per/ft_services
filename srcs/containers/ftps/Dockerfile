FROM	alpine

RUN	apk add openssl vsftpd

COPY	./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY	./srcs/run.sh ./

RUN	openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

RUN	chmod +x ./run.sh

EXPOSE	20 21 30000-30004

CMD	./run.sh
