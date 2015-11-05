#!/bin/bash


echo "Configuring required services " | tee -a  /tmp/sainsburys.log

systemctl stop nginx 
systemctl disable nginx 
systemctl enable docker.socket
systemctl start docker.socket
systemctl enable docker.service
systemctl start docker.service
systemctl enable goapp
systemctl start goapp
systemctl enable goapp1
systemctl start goapp1
systemctl enable nginxapp
systemctl start nginxapp



if [ `hostname | head -c 9` == "appserver" ];
then
  echo "Starting AppServer services " | tee -a  /tmp/sainsburys.log

else
  echo "Starting WebServer services " | tee -a  /tmp/sainsburys.log

fi

echo "Configuring required services : Completed " | tee -a  /tmp/sainsburys.log

