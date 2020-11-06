#!/bin/bash
cd /opt/

git clone https://github.com/slteksystemsllc/elasticsearch.git

sudo chown 1000:1000 -R /opt/elasticsearch/
#######################################################
# Elasticsearc Pre-Config

mkdir -p /usr/share/elasticsearch/
mkdir -p /usr/share/elasticsearch/cron/custom-cron/
mkdir -p /usr/share/elasticsearch/data

sudo chown 1000:1000 -R /usr/share/elasticsearch/

cp -f /opt/elasticsearch/docker-compose.yml.example /usr/share/elasticsearch/docker-compose.yml
cp -f /opt/elasticsearch/cron/custom-cron.example /usr/share/elasticsearch/cron/custom-cron/

#########################################################
# Logstash Pre-Config 

mkdir -p /usr/share/logstash/
mkdir -p /usr/share/logstash/bin/
mkdir -p /usr/share/logstash/config/
mkdir -p /usr/share/logstash/configs/
mkdir -p /usr/share/logstash/custom_patterns/
mkdir -p /usr/share/logstash/dictionaries/
mkdir -p /usr/share/logstash/persistent_data/
mkdir -p /usr/share/logstash/pipeline/
mkdir -p /usr/share/logstash/plugins/
mkdir -p /usr/share/logstash/rules/

sudo chown 1000:1000 -R /usr/share/logstash/

cp -r /opt/elasticsearch/logstash/logstash_configs/* /usr/share/logstash/configs/
cp -r /opt/elasticsearch/logstash/dictionaries/* /usr/share/logstash/dictionaries/
cp -f /opt/elasticsearch/logstash/pipelines.yml.example /usr/share/logstash/config/pipelines.yml
cp -r /opt/elasticsearch/logstash/rules/* /usr/share/logstash/rules/


############################################################
# Elastalert Pre-Config

mkdir -p /usr/share/elastalert/
mkdir -p /usr/share/elastalert/config/
mkdir -p /usr/share/elastalert/rules/
mkdir -p /usr/share/elastalert/rule_templates/
mkdir -p /usr/share/elastalert/elastalert-server/config/

sudo chown 1000:1000 -R /usr/share/elastalert/

cp -r /opt/elasticsearch/elastalert/example_rules/* /usr/share/elastalert/rules/
cp -f /opt/elasticsearch/elastalert/config.yaml.example /usr/share/elastalert/config.yaml
cp -f /opt/elasticsearch/elastalert/config.json /usr/share/elastalert/elastalert-server/config/config.json

cd /usr/share/elasticsearch/

docker-compose up --no-start