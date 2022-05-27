# elastic_stack

THIS IS IN BETA PLEASE DO NOT USE JUST YET - Deploying the Elastic Stack can be difficult. This project hopes to simplify that.

### Initial Goal

Make it simple to deploy a full fledged Elastic Stack with advanced capabilities on a single physical box using Docker.

### Long Term Goal

Contain scripts for easy deployment to production systems

## Prerequisites
Must have Docker installed. An example of how to do this on an Ubuntu 18.04 system is as below:

```#Assumes you have downloaded and installed Ubuntu 18.04 minimum to start. Follow the rest of the steps below to configure and get up and running


sudo apt install net-tools


# Once Ubuntu is insalled run update and upgrade commands to update system
sudo apt-get update -y && sudo apt-get upgrade -y

# Install wget
sudo apt-get install -y wget

# Change to the working directory /opt
cd /opt

# Download the prerequisites script and run in bash
sudo wget https://github.com/slteksystemsllc/elasticsearch_siem/raw/main/scripts/prereq.sh && sudo bash prereq.sh

# Download the initialization script and run in bash
sudo wget https://github.com/slteksystemsllc/elasticsearch_siem/raw/main/scripts/initialize.sh && sudo bash initialize.sh

# Navigate to /opt/elasticsearch_siem/ and run the following command.  This will start the stack in daemon mode.
cd /opt/elasticsearch_siem/
sudo docker-compose up -d

# Wait until Elasticsearch is running then run this bsah script to install elasticsearch index's
bash elasticsearch/indexes/import.sh

## Completely hands off install
Script runs all of the above commands in one run
sudo wget https://github.com/slteksystemsllc/elasticsearch_siem/raw/main/automated_install.sh && sudo bash automated_install.sh
```
