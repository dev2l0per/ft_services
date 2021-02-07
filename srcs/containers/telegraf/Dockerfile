FROM	alpine

RUN	apk update && apk upgrade
RUN	apk add telegraf

COPY	./srcs/telegraf.conf /etc/telegraf/

COPY	./srcs/run.sh ./

RUN	chmod +x ./run.sh

EXPOSE	35000

CMD	./run.sh
