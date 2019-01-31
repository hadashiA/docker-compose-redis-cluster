#!/bin/bash

cluster_announce_ip="$1"
max_port="$2"

program_entry_template ()
{
  local count=$1
  local port=$2
  local cluster_announce_ip=$3
  echo "

[program:redis$count]
command=redis-server /redis.conf --port $port --dir /redis-data/$count --cluster-announce-ip $cluster_announce_ip
stdout_logfile=/var/log/supervisor/%(program_name)s.log
stderr_logfile=/var/log/supervisor/%(program_name)s.log
autorestart=true
"
}

result_str="
[supervisord]
nodaemon=false
"

count=1
for port in `seq 7000 $max_port`; do
  result_str="$result_str$(program_entry_template $count $port $cluster_announce_ip)"
  count=$((count + 1))
done

echo "$result_str"
