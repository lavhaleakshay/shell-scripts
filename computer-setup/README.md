# Packages installed

gcloud sdk 
kubernetes 
docker 
curl 
intellij 
vscode 
scala 
go 
terminator 
git 
direnv  
elasticsearch-6.3.2 
cassandra 
zookeeper 
kafka 
kibana-6.3.2 
nginx 
filebeat 
logstash 
redis-server 
mongod 
memcached 
neo4j 
postman
Zookeeper 
Kafka

# ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
# gcloud auth application-default login
# python -m SimpleHTTPServer 8080
# sudo apt get install -y meld

#// Export ########################################################################
sudo mongoexport --db asimov_default -c ram --out ram.json
sudo mongoexport --db asimov_default -c redhat --out redhat.json
# // Import #######################################################################
sudo mongoimport --db asimov_default -c ram --file ram.json
sudo mongoimport --db asimov_default -c redhat --file redhat.json


# Service control and access details
see status of the running services:
	"netstat -plntu"
	or "ss -nlt"
	or "service --status-all"

start a service:
	"sudo systemctl stop cassandra"

stop a service:
	"sudo systemctl start cassandra"

    #Services      #Port          #Configfile                                             #Command-cli
===================================================================================================
 1. elasticsearch: 9200 <-http    /etc/elasticsearch/elasticsearch.yml
               9300 <-tcp
 2. cassandra:     9042           /etc/cassandra/cassandra.yaml                           cqlsh

 3. zookeeper:     2181           /etc/zookeeper/conf/zoo.cfg

 4. kafka:         9092           /etc/kafka.properties

 5. kibana:        5601           /etc/kibana/kibana.yml

 6. nginx:         80             /etc/nginx/sites-available/*, 
                              /etc/nginx/sites-enabled/*

 7. logstash:      5443           /etc/logstash/conf.d/filebeat-input.conf

 8. filebeat:                     /etc/filebeat/filebeat.yml, 
                              /etc/filebeat/filebeat.reference.yml

 9. mongod:        27017          /etc/mongod.conf                                        mongo

10. redis-server:  6379           /etc/redis/redis.conf                                   redis-cli

11. memcached:     11211          /etc/memcached.conf                                     memcached-cli

12. neo4j:         7474           /etc/neo4j/neo4j.conf                                   cypher-shell -u neo4j -p neo4j
