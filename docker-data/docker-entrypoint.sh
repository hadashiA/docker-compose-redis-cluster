#!/bin/bash
set -em

cluster_announce_ip=$(ifconfig eth0 | awk '$1 == "inet" {print $2}')

bash /generate-supervisor-conf.sh $cluster_announce_ip 7002 > /etc/supervisor/supervisord.conf

#supervisorctl stop all
supervisord -c /etc/supervisor/supervisord.conf &

#yes 'yes' | redis-cli --cluster create 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002

fg %1

