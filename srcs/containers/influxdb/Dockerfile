FROM	alpine

RUN	apk update && apk upgrade
RUN	apk add influxdb

RUN	mkdir -p /etc/influxdb
RUN	mkdir -p /var/lib/influxdb

COPY	./srcs/influxdb.conf /etc/influxdb/
COPY	./srcs/run.sh ./

RUN	chmod +x ./run.sh

EXPOSE	8086

CMD	./run.sh
