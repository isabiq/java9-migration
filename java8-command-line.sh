#!/bin/bash

set -e

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
