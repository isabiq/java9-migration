#!/bin/bash

set -e

PROJECT_DIR=$(dirname "$0")
cd ${PROJECT_DIR}/.. 

echo '###############################################################'
echo '$ rm -rf mytarget/ && mkdir -p mytarget/classes'
echo '###############################################################'
rm -rf mytarget/ && mkdir -p mytarget/classes


echo '###############################################################'
echo '$ mvn dependency:copy-dependencies -DoutputDirectory=mytarget/lib'
echo '###############################################################'
mvn dependency:copy-dependencies -DoutputDirectory=mytarget/lib


echo '###############################################################'
echo '$ javac -d mytarget/classes -cp "mytarget/lib/*" $(find src/main/ -name "*.java")'
echo '###############################################################'
javac -d mytarget/classes -cp "mytarget/lib/*" $(find src/main/ -name "*.java")


echo '###############################################################'
echo '$ cp src/main/resources/* mytarget/classes/'
echo '###############################################################'
cp src/main/resources/* mytarget/classes/


echo '###############################################################'
echo '$ jar cf mytarget/cqrs.jar -C mytarget/classes .'
echo '###############################################################'
jar cf mytarget/cqrs.jar -C mytarget/classes .


echo '###############################################################'
echo '$ java -cp "mytarget/lib/*":mytarget/cqrs.jar com.iluwatar.cqrs.app.App'
echo '###############################################################'
java -cp "mytarget/lib/*":mytarget/cqrs.jar com.iluwatar.cqrs.app.App

# If you didn't add the jaxb to the dependencies you can use --add-modules to add java.xml.bind to the root modules: 
#java --add-modules java.xml.bind -cp "mytarget/lib/*":mytarget/cqrs.jar com.iluwatar.cqrs.app.App
