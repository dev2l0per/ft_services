FROM alpine

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-common mariadb-client

RUN mkdir -p /run/mysqld

COPY ./srcs/wordpress.sql ./
COPY ./srcs/run.sh . 

EXPOSE 3306

RUN chmod 777 ./wordpress.sql
RUN chmod 777 ./run.sh

CMD ./run.sh
