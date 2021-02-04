FROM	alpine

RUN	apk update && apk upgrade
RUN	apk add wget tar

RUN	mkdir -p /etc/telegraf
RUN	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz
RUN	tar -zxf telegraf-1.17.2_linux_amd64.tar.gz
RUN	mv telegraf-1.17.2 telegraf
RUN	rm telegraf-1.17.2_linux_amd64.tar.gz

RUN	cp -rf telegraf/etc/* /etc/
RUN	cp -rf telegraf/usr/* /usr/

COPY	./srcs/telegraf.conf /etc/telegraf/

COPY	./srcs/run.sh ./

RUN	chmod +x ./run.sh

EXPOSE	35000

CMD	./run.sh
