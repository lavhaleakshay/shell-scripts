#cassandragui.sh
#sudo apt-get update -y
#sudo apt-get upgrade -y
#sudo apt-get install openjdk-8-jre-headless
sudo wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.18.v20190429/jetty-distribution-9.4.18.v20190429.tar.gz
sudo tar xzvf jetty-distribution-9.4.18.v20190429.tar.gz
sudo mv jetty-distribution-9.4.18.v20190429 /opt/
sudo mv /opt/jetty-distribution-9.4.18.v20190429 /opt/jetty
sudo rm -rf /opt/jetty/demo-base/

sudo mkdir -p /opt/web/mybase/
sudo mkdir -p /opt/jetty/temp/

sudo echo 'JAVA_HOME=/usr/lib/jvm/jdk1.8.0_211'                       >> /etc/environment
sudo echo 'JETTY_HOME=/opt/jetty'                                     >> /etc/environment
sudo echo 'JETTY_BASE=/opt/jetty'                                     >> /etc/environment

sudo useradd --home-dir /opt/jetty jetty
sudo mkdir -p /opt/webapps

sudo chown -R jetty:jetty /opt/webapps
sudo chown -R jetty:jetty /opt/jetty
sudo usermod -a -G jetty asimov

sudo touch /etc/default/jetty
sudo cp /opt/jetty/bin/jetty.sh /etc/init.d/jetty

sudo echo 'JETTY_HOME=/opt/jetty'       >> /etc/default/jetty
sudo echo 'JETTY_BASE=/opt/jetty'       >> /etc/default/jetty
sudo echo 'TMPDIR=/opt/jetty/temp'      >> /etc/default/jetty


# create download directory
#sudo mkdir -p ~/Services/helenos
 
# download war
#sudo wget https://sourceforge.net/projects/helenos-gui/files/helenos-1.5.war/download
 
# copy to helenos.war
sudo cp helenos-1.5.war /opt/jetty/webapps/
#sudo cd ~/Services/helenos
 
# make jetty user the owner of helenos.war
#sudo chown asimov:asimov helenos.war
 
# move the war file to webapps
#sudo mv helenos.war /opt/jetty/webapps/
 
# Using jetty
# http://localhost:8080/helenos
sudo /etc/init.d/jetty restart
 
# the application takes ages to load  1-3 minutes
# monitor jetty log files in case of error
#ls -l /opt/jetty/logs
 
#Cassandra URL	127.0.0.1
