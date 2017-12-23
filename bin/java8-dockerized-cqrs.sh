#!/bin/bash

set -e

PROJECT_DIR=$(dirname "$0")
DOCKER_IMAGE_TAG=1.0-java8
cd ${PROJECT_DIR}/.. 

echo '###############################################################'
echo '$ bin/java8-command-line.sh'
echo '###############################################################'
bin/java8-command-line.sh


echo '###############################################################'
echo "\$ sudo docker build -t cqrs:${DOCKER_IMAGE_TAG} ."
echo '###############################################################'
sudo docker build -t cqrs:${DOCKER_IMAGE_TAG} .


echo '###############################################################'
echo "\$ sudo docker run --rm -t cqrs:${DOCKER_IMAGE_TAG}"
echo '###############################################################'
sudo docker run --rm -t --name cqrs-java8 cqrs:${DOCKER_IMAGE_TAG}
