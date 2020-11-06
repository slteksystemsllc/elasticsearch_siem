#!/bin/bash
cd /opt/

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-get install -y wget

sudo wget https://github.com/slteksystemsllc/elasticsearch_siem/raw/main/scripts/prereq.sh && sudo bash prereq.sh

sudo wget https://github.com/slteksystemsllc/elasticsearch_siem/raw/main/scripts/initialize.sh && sudo bash initialize.sh

cd /usr/share/elasticsearch/

docker-compose up --no-start
