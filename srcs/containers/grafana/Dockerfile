FROM	alpine

RUN	apk update && apk upgrade
RUN	apk add grafana --no-cache

COPY	./srcs/run.sh ./run.sh

COPY	./srcs/dashboards /var/lib/grafana/dashboards/
COPY	./srcs/provisioning/dashboards/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY	./srcs/provisioning/datasources/influxdb.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml

RUN	chmod +x ./run.sh

EXPOSE	3000

CMD	./run.sh
