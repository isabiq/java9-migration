#!/bin/bash

set -e

PROJECT_DIR=$(dirname "$0")
cd ${PROJECT_DIR}/.. 

echo '###############################################################'
echo '$ mvn clean verify'
echo '###############################################################'
mvn clean verify


echo '###############################################################'
echo '$ mvn exec:exec -Dexec.executable="java"  -Dexec.args="-cp %classpath com.iluwatar.cqrs.app.App"'
echo '###############################################################'
mvn exec:exec -Dexec.executable="java"  -Dexec.args="-cp %classpath com.iluwatar.cqrs.app.App"

