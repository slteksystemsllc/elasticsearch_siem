#!/bin/bash
cd /opt/

# Set hostname for sinlge node opensearch
hostnamectl set-hostname "es01. local"
exec bash

git clone https://github.com/slteksystemsllc/opensearch_siem.git

sudo chown 1000:1000 -R /opt/opensearch_siem/
#######################################################
# Elasticsearc Pre-Config

mkdir -p /opt/opensearch/
mkdir -p /opt/opensearch/cron/custom-cron/
mkdir -p /opt/opensearch/data

sudo chown 1000:1000 -R /opt/opensearch/

cp -f /opt/opensearch_siem/docker-compose.yml.example /opt/opensearch/docker-compose.yml
cp -f /opt/opensearch_siem/cron/custom-cron.example /opt/opensearch/cron/custom-cron/

#########################################################
# Logstash Pre-Config 

mkdir -p /opt/logstash/
mkdir -p /opt/logstash/bin/
mkdir -p /opt/logstash/config/
mkdir -p /opt/logstash/configs/
mkdir -p /opt/logstash/custom_patterns/
mkdir -p /opt/logstash/dictionaries/
mkdir -p /opt/logstash/persistent_data/
mkdir -p /opt/logstash/pipeline/
mkdir -p /opt/logstash/plugins/
mkdir -p /opt/logstash/rules/

sudo chown 1000:1000 -R /opt/logstash/

cp -r /opt/opensearch_siem/logstash/logstash_configs/* /opt/logstash/configs/
cp -r /opt/opensearch_siem/logstash/dictionaries/* /opt/logstash/dictionaries/
cp -f /opt/opensearch_siem/logstash/pipelines.yml.example /opt/logstash/config/pipelines.yml

############################################################
# Elastalert Pre-Config

mkdir -p /opt/elastalert/
mkdir -p /opt/elastalert/config/
mkdir -p /opt/elastalert/rules/
mkdir -p /opt/elastalert/rule_templates/
mkdir -p /opt/elastalert/elastalert-server/config/

sudo chown 1000:1000 -R /opt/elastalert/

cp -r /opt/opensearch_siem/elastalert/example_rules/* /opt/elastalert/rules/
cp -f /opt/opensearch_siem/elastalert/config.yaml.example /opt/elastalert/config.yaml
cp -f /opt/opensearch_siem/elastalert/config.json /opt/elastalert/elastalert-server/config/config.json

cd /opt/opensearch/

docker-compose up --no-start
