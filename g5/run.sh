#!/bin/bash

# g5pc = g5 pause container

docker build -t g5pc .

echo -e "\n> REMOVING EXISTING CONTAINERS"

docker container stop g5pc
docker container stop container1
docker container stop container2
docker container rm g5pc
docker container rm container1
docker container rm container2

docker network create devops

docker network list

docker run -d --name g5pc --net=devops g5pc

docker run -d --name container1 --net=devops ubuntu:20.04 tail -f /dev/null
docker exec -it container1 apt-get update
docker exec -it container1 apt-get install -y iputils-ping

docker run -d --name container2 --net=devops ubuntu:20.04 tail -f /dev/null
docker exec -it container2 apt-get update
docker exec -it container2 apt-get install -y iputils-ping

echo -e "\n\n> PING container 1 -> container2\n"
docker exec -it container1 ping -c 4 container2

echo -e "\n\n> PING container 2 -> container1\n"
docker exec -it container2 ping -c 4 container1 