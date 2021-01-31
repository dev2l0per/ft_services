FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc mariadb mariadb-common mariadb-client
RUN openrc default
RUN touch /run/openrc/softlevel

COPY ./srcs/run.sh . 

EXPOSE 3306

RUN chmod 777 ./run.sh

CMD ./run.sh
