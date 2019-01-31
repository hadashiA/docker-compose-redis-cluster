FROM redis:latest

RUN apt-get update && \
    apt-get install -y iproute2 curl net-tools supervisor

RUN mkdir /redis-conf
RUN mkdir -p /redis-data/1 /redis-data/2 /redis-data/3 /redis-data/4 /redis-data/5 /redis-data/6

COPY ./docker-data/redis.conf /
COPY ./docker-data/generate-supervisor-conf.sh /
COPY ./docker-data/docker-entrypoint.sh /usr/local/bin/

EXPOSE 7000 7001 7002
