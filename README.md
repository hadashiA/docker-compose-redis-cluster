# docker-compose-redis-cluster

The docker-compose configuration to run redis cluster.

- The configuration creates a cluster with 3 master and 0 replicas.
    - ! The main primary use for this container is to test redis cluster. 
- The redis nodes are started with supervisord in *one* container.
    - This is useful when developing with other containers

### Usage

1. Download the project `$ git clone http://github.com/hadashiA/docker-compose-redis-cluster`
2. `cd docker-compose-redis-cluster`
3. `docker-compose build`
4. `docker-compose up` or `docker-compose up -d`

#### If you need to connect from host machine

`REDIS_CLUSTER_IP=127.0.0.1 docker-compose up`
