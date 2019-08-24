#!/bin/bash
#devsetup.sh
mkdir ~/Services

sudo echo 'export BINTRAY_PASSWORD=d60ee5465af4e5d1c6354acb9617dc9961ff7d15' >> /etc/bash.bashrc
sudo echo 'export PATH=$PATH:/usr/local/go/bin'                              >> /etc/bash.bashrc
sudo echo 'export GOROOT=/usr/local/go'                                  >> /etc/bash.bashrc
sudo echo 'eval "$(direnv hook bash)"'                                       >> /etc/bash.bashrc
sudo echo "alias sudo='sudo env PATH=$PATH'"                                 >> /etc/bash.bashrc
sudo echo 'export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_211'                       >> /etc/bash.bashrc
sudo echo 'export PATH=$PATH:\$JAVA_HOME/bin'                               >> /etc/bash.bashrc

echo 'if [ "$color_prompt" = yes ]; then'         >> ~/.bashrc
echo "    PS1='\[\033[01;34m\]\W\[\033[00m\]\$ '" >> ~/.bashrc
echo 'else'                                       >> ~/.bashrc
echo "    PS1='[\W]\$ '"                          >> ~/.bashrc
echo 'fi' >> ~/.bashrc

sudo add-apt-repository -y ppa:gnome-terminator

# Update
sudo apt-get -y  update

# Tree
sudo apt install -y tree*

# VIM
sudo apt install -y vim
sudo echo 'set nu'       >> /etc/vim/vimrc

# JRE
#sudo apt-get install -y default-jre


cp 8jdk-8u211-linux-x64.tar.gz ~/ && \
cd ~/ && tar -xvf 8jdk-8u211-linux-x64.tar.gz && \
sudo mv jdk1.8.0_211/ /usr/lib/jvm/ && \
cd -

# terminator
sudo apt-get -y install terminator

#gcc
sudo apt -y install gcc

#make
sudo apt -y install make

#curl
sudo apt -y install curl

#JDK 8
sudo apt -y install openjdk-8-jdk

#Git
sudo apt install -y git

#Docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Redis
sudo apt-get install -y redis-server

#Cassandra
echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
sudo apt update
	#If verification fails
	#sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA
	#sudo apt update
sudo apt -y install cassandra

#GCloud SDK

# Create environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get -y install google-cloud-sdk

#Go
sudo curl -s https://dl.google.com/go/go1.11.linux-amd64.tar.gz | tar  -C /usr/local -xz

#Scala
sudo apt -y install scala

#VS Code
sudo snap install --classic code

#direnv
sudo apt -y install direnv

#IntelliJ
wget https://download.jetbrains.com/idea/ideaIC-2019.1.tar.gz
tar zxf ideaIC-2019.1.tar.gz
rm ideaIC-2019.1.tar.gz 
sudo mv idea-IC-191.6183.87 ~/Services/
#cd idea-IC-191.6183.87/bin
#./idea.sh

#memcached
sudo apt -y install memcached

#Elasticsearch
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.2.deb 
sudo dpkg -i elasticsearch-6.3.2.deb

#Kibana
mkdir ~/Services
cd ~/Services && sudo wget https://artifacts.elastic.co/downloads/kibana/kibana-6.3.2-linux-x86_64.tar.gz \
&& sudo tar -xvf kibana-6.3.2-linux-x86_64.tar.gz && cd -

#MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

#neo4j
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb https://debian.neo4j.org/repo stable/' | sudo tee -a /etc/apt/sources.list.d/neo4j.list
sudo apt-get update
sudo apt-get install -y neo4j=1:3.5.4

#Postman
sudo snap install postman

# Zookeeper and Kafka
sudo wget https://www.apache.org/dist/kafka/2.1.1/kafka_2.11-2.1.1.tgz 
sudo mv kafka_2.11-2.1.1.tgz ~/Services/
cd ~/Services && sudo tar -xvf kafka_2.11-2.1.1.tgz
sudo echo 'delete.topic.enable=true'  >> ~/Services/kafka_2.11-2.1.1/config/server.properties
sudo mv kafka_2.11-2.1.1 kafka
cd -

sudo cp kibana.service zookeeper.service kafka.service /etc/systemd/system/

sudo useradd kafka -m
sudo adduser kafka sudo

sudo echo "kafka:Password1" | sudo chpasswd

# service check script
cp service.sh ~/Services/
cp README.md ~/Services/

# JAVA default config
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# Redis GUI
sudo snap install redis-desktop-manager

#
sudo cp helenos-1.5.war ~/Services/helenos.war

sudo apt get install -y meld
