#!/bin/bash
cd /opt/

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-get install -y wget

sudo wget https://github.com/slteksystemsllc/elasticsearch_siem/blob/master/scripts/initialize.sh && sudo bash prereq.sh

sudo wget https://github.com/slteksystemsllc/elasticsearch_siem/blob/master/scripts/prereq.sh && sudo bash initialize.sh
          

cd /usr/share/elasticsearch/

docker-compose up --no-start
