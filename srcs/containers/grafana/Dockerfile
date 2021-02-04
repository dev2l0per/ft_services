FROM	alpine

RUN	apk update && apk upgrade
RUN	apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY	./srcs/run.sh ./run.sh

RUN	chmod +x ./run.sh

EXPOSE	3000

CMD	./run.sh
