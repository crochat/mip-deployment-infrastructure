#!/usr/bin/env bash
# stop all the container
sudo docker container stop $(docker container ls -aq)

