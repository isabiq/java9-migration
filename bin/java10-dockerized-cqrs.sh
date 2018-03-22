#!/bin/bash

set -e

PROJECT_DIR=$(dirname "$0")
DOCKER_IMAGE_TAG=1.0-java10-cp

cd ${PROJECT_DIR}/.. 

echo '###############################################################'
echo '$ bin/java10-command-line.sh'
echo '###############################################################'
bin/java10-command-line.sh

pwd
echo '###############################################################'
echo '$ jlink -p  $JAVA_HOME/jmods:mytarget/lib:mytarget/cqrs.jar \
      --add-modules java.sql,jdk.unsupported,java.naming,java.desktop,java.management \
      --output mytarget/com.cqrs'
echo '###############################################################'
jlink -p $JAVA_HOME/jmods:mytarget/lib:mytarget/cqrs.jar \
      --add-modules java.sql,jdk.unsupported,java.naming,java.desktop,java.management \
      --output mytarget/com.cqrs


echo '###############################################################'
echo "\$ sudo docker build -t cqrs:${DOCKER_IMAGE_TAG} ."
echo '###############################################################'
sudo docker build -t cqrs:${DOCKER_IMAGE_TAG} .


echo '###############################################################'
echo "\$ sudo docker run --rm -t --name cqrs-java10-cp cqrs:${DOCKER_IMAGE_TAG}"
echo '###############################################################'
sudo docker run --rm -t --name cqrs-java10-cp cqrs:${DOCKER_IMAGE_TAG}
