# MIP-LOCAL- Deployment Guide

## Introduction

The main objective of this project is to provide you with the information and guidance needed to successfully install the M
IP Version 5.0 in a
### demonstration setting:
    • MIP Frontend
    • MIP APIs
    • MIP EXAREME engine
    • MIP Algorithms
    • MIP Initial Metadata (Common Data Elements for one or more medical condition)
    • MIP Datasets (standard datasets and demonstration datasets)
This project is defined to set up two sets of metadata and datasets for the following medical conditions:

    • Dementia
    • Trauma Brain Injury
This project does not cover the installation of the additional data pre-processing tools (Data Factory) needed to prepare your own datasets and metadata, nor the installation of your own local datasets and associated metadata describing the specific variables you would like to focus on.  These topics will soon be covered by additional projects to be published and announced later.
The installation process of the MIP Version 5.0 in a demonstration setting is divided into different parts along with the different software stacks that need to be deployed. The MIP installation is performed in 2 major steps:

    1) Installation of the EXAREME and Backend components
    2) Installation of the Frontend components (Web-Analytics-Pack)
This guide will assist you in deploying all the packs and explain what dependencies each one has with the rest. This guide does not include detailed installation steps for each service but will prompt you to the appropriate guide.

## Prerequisites
- The server must be set up according to the MIP Technical Requirements and must be in a clean state.  In case you already have a previous version of the MIP installed and before proceeding with the MIP version 5.0 installation you will need to uninstall the previous version totally. 
- Please proceed manually to clean up the server by removing components like: MESOS, Marathon, Zookeeper.
**You can using the script cleanup.sh to remove the previous installation**.
- You need to create FQDN for you MIP application in order to to that you need to generate TLS certificat and setting your Domaine name application.
### If you want to secure your MIP with OpenId
Connect to HBP Collabotory to generate your credential OpenID security domain (https://services.humanbrainproject.eu/oidc/login)
for configure the authentication in you MIP local Installation you have to modify the docker-compose file with your own CLIENT_ID and CLIENT_SECRET

There is the OpenId documentation on the GitHub repository which explain how to create and configure OpenID (OpenID Connect Client.pdf)

## Installation Steps
### Before you start (requirements)
Ensure you have GIT installed on your server. If not proceed with GIT installation. When this is done:
 - clone this repository on your server so you can use it to install the MIP 5.0
 - Execute the script **“after-git-clone.sh”**
 - Each software stack is based on docker and uses docker compose so you need to install **docker and docker compose** on your server:
 - Each software stack has it's own requirements but in order to deploy everything into one machine you need at **least 16 GB of ram.**

All of the software stack is based on docker so you need to install it in the machines that you will use:

- docker (tested using version 17.05.0-ce)
- docker-compose (tested using version 1.17.0)

## Install EXAREME and backend components
Each software stack has more specific requirments

To install EXAREME locally see the [Local exareme Deployment Guide](https://github.com/HBPMedical/mip-deployment-infrastructure/tree/release/Local-Deployment).

## Install Front End and APIs Pack

### Prepare your environment
In order to deploy the Frontend component and API you need to modify the docker-compose.yaml file and set the Variable **EXAREME_URL** with the server IP addresse:
EXAREME_URL (EXAREME_IP:EXAREME_PORT from step 1 e.g. http://{your-server-ip-address}:9090 ) keeping the default port 9090.
**If you secure your application access with OpenID** you need to set the variable below with you own **CLIENT_ID and CLIENT_SECRET**
refer to **OpenID Connect Client.pdf file**.
- AUTHENTICATION: 1
- CLIENT_ID: ${your Clientid}
- CLIENT_SECRET: ${your client_secret}
- FRONTEND_LOGIN_URL: ${https://your domaine name MIP application/services/login/hbp}
- FRONTEND_AFTER_LOGIN_URL: ${https://your domaine name MIP application}
- FRONTEND_AFTER_LOGOUT_URL: ${https://your domaine name MIP application/services/login/hbp}

### Proceed with frontend and API pack Installation
Run the ./run.sh command to install the rest of the components.
After the installation is done, MIP will be visible on your local domaine.

## Verify the MIP 5.0 is working
After the installation is done, the MIP Version 5.0 in a demonstration setting is now visible on localhost.  To verify all is working fine  Launch the MIP
  Check 2 medical conditions (dementia and TBI) are accessible from the frontend
  Check 5 datasets are accessible from the front end
  ADNI, PPMI, EDSD
  Demo-DEM, Demo-TBI

