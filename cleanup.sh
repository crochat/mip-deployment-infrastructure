#!/bin/bash

# remove mesos on the target machine
sudo apt remove mesos
# remove zookper on the target machine
sudo apt-get remove --auto-remove zookeeper
sudo apt-get purge --auto-remove zookeeper
# update the debian repository
sudo apt update
# stop all the container
sudo docker container stop $(docker container ls -aq)
# remove all the container
docker container rm $(docker container ls -aq)clear
# remove all images
sudo docker image rm $(docker image  ls -aq)clear
# remove all docker network
sudo docker network rm $(docker network ls -q)clear
# remove docker volumes
sudo docker volume  rm $(docker volume ls -q)clear
# cleanup the docker registry
sudo docker prune


