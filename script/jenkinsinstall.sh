#! /bin/bash
#sudo apt-get update
#sudo apt-get install openjdk-8-jdk -y
#sudo wget -q -O - https://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
#sudo sh -c 'echo deb https://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
#sudo apt-get update
#sudo apt-get install jenkins -y
#sudo apt-get -qq install python -y

sudo apt update 
sudo apt install openjdk-8-jdk -y 
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add  
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' 
sudo apt update 
sudo apt install jenkins -y
sudo systemctl status jenkins
sudo apt-get -qq install python -y
