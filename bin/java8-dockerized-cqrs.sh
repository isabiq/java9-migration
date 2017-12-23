#!/bin/bash

set -e

PROJECT_DIR=$(dirname "$0")
cd ${PROJECT_DIR}/.. 

echo '###############################################################'
echo '$ bin/java8-command-line.sh'
echo '###############################################################'
bin/java8-command-line.sh


echo '###############################################################'
echo '$ sudo docker build -t cqrs:1.0 .'
echo '###############################################################'
sudo docker build -t cqrs:1.0 .


echo '###############################################################'
echo '$ sudo docker run --rm -t cqrs:1.0'
echo '###############################################################'
sudo docker run --rm -t --name cqrs cqrs:1.0 
