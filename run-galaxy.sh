#!/usr/bin/env bash
# run galaxy
sudo docker run -d -e EXAREME_IP=155.105.223.25 -e EXAREME_PORT=9090 -p 8090:80 hbpmip/galaxy:v1.2.2 /bin/bash -c "htpasswd -bc /etc/apache2/htpasswd admin Mip-2019 && ./createExaremeVariables.sh && /etc/init.d/apache2 restart && ./run.sh"
