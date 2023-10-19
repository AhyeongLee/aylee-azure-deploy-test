#!/bin/bash

# install java
sudo apt update
sudo apt-get install openjdk-17-jdk
echo 'export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))' >> ~/.profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.profile
source ~/.profile

# download source
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package

# run application
nohup java -jar target/*.jar > log.txt 2>&1 &
