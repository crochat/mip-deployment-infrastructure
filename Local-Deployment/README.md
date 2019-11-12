# Local Exareme Deployment Guide

Here you will find all the information needed in order to deploy Exareme in your environment via docker compose and and hell scripts.

# Requirement

1) Create the data_path for host machine?
# Exemple:
sudo mkdir -p /data/exareme/data 

## Data Structure
In every node the DATA should follow a specific structure. We will refer to the path of the DATA folder as ```data_path```. The ```data_path``` can be different across the nodes.

The data folder should contain one folder for each pathology that it has datasets for. Inside that folder there should be:
1) the datasets.csv file with all the datasets combined and
2) the CDEsMetadata.json file for that specific pathology.
3) for use Test data you can copy the dementia and Tbi folder in the data_path folder 
# exemple
sudo cp -r dementia/ /data/exareme/data/.
sudo cp -r tbi/ /data/exareme/data/.

## deploy Exareme Stack
In the ```Local-Deployment/``` folder, run the ```deployLocal.sh``` to start the deployment.
You will be prompted to provide any information needed.
# Exemple

# What is the data_path for host machine?
/data/exareme/data 

# Type your EXAREME image name
hbpmip/exareme

# Type your EXAREME image tag:
v21.2.0
# Do you wish to run Portainer service? [ y/n ]
n

## [Optional] Data path location

In the ```Local-Deployment/``` folder create an ```dataPath.txt``` file.

The file should contain the following line, modify it according to the place where your data are.

```
LOCAL_DATA_FOLDER=/data/exareme/data/

```
# Troubleshooting

While ```sudo docker service ls```, if the services are Replicated 0/1:

1) Check that you have enough space in your machine.

2) If there is an ERROR, try ```sudo docker service ps --no-trunc NAME_or_ID_of_service``` to see the whole message.
3) send the émail to  the Switzerland team
