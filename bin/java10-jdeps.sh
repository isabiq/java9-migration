#!/bin/bash

set -e

PROJECT_DIR=$(dirname "$0")
cd ${PROJECT_DIR}/.. 

echo '###############################################################'
echo '$ rm -rf temp/* && mkdir -p temp/classes'
echo '###############################################################'
rm -rf temp/* && mkdir -p temp/classes


echo '###############################################################'
echo '$ mvn dependency:copy-dependencies -DoutputDirectory=temp/lib'
echo '###############################################################'
mvn dependency:copy-dependencies -DoutputDirectory=temp/lib


echo '###############################################################'
echo '$ javac -d temp/classes -cp "temp/lib/*" $(find src/main/ -name "*.java" ! -name "module-info.java")'
echo '###############################################################'
javac -d temp/classes -cp "temp/lib/*" $(find src/main/ -name "*.java" ! -name "module-info.java" )


echo '###############################################################'
echo '$ cp src/main/resources/* temp/classes/'
echo '###############################################################'
cp src/main/resources/* temp/classes/


echo '###############################################################'
echo '$ jar cf temp/cqrs.jar -C temp/classes .'
echo '###############################################################'
jar cf temp/cqrs.jar -C temp/classes .


echo '###############################################################'
echo 'jdeps -s -cp temp/lib/* temp/cqrs.jar > temp/dependency-report.txt'
echo '###############################################################'
jdeps -s -cp temp/lib/* temp/cqrs.jar > temp/dependency-report.txt


echo '###############################################################'
echo 'mv temp/lib/geronimo-jta_1.1_spec-1.1.1.jar temp/lib/geronimo-jta_spec-1.1.1.jar' 
echo '###############################################################'
mv temp/lib/geronimo-jta_1.1_spec-1.1.1.jar temp/lib/geronimo-jta_spec-1.1.1.jar 


echo '###############################################################'
echo 'jdeps --generate-module-info temp/ temp/lib/* temp/cqrs.jar'
echo '###############################################################'
jdeps --generate-module-info temp/ temp/lib/* temp/cqrs.jar || true


echo '###############################################################'
echo 'find temp/ -maxdepth 1 -type d ! -name "temp" ! -name "cqrs" | xargs rm -rf'
echo '###############################################################'
find temp/ -maxdepth 1 -type d ! -name "temp" ! -name "cqrs" | xargs rm -rf
