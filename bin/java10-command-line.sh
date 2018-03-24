#!/bin/bash

set -e

PROJECT_DIR=$(dirname "$0")
cd ${PROJECT_DIR}/.. 


echo '$ rm -rf mytarget/ && mkdir -p mytarget/classes && mkdir mytarget/lib-direct'
echo '###############################################################'
rm -rf mytarget/ && mkdir -p mytarget/classes && mkdir mytarget/lib-direct


echo '###############################################################'
echo '$ mvn dependency:copy-dependencies -DoutputDirectory=mytarget/lib'
echo '###############################################################'
mvn dependency:copy-dependencies -DoutputDirectory=mytarget/lib


echo '###############################################################'
echo '$ mv mytarget/lib/hibernate-jpa-2.1-api-1.0.0.Final.jar \
           mytarget/lib/hibernate-core-5.0.1.Final.jar \
	   mytarget/lib/slf4j-api-1.7.21.jar \
	   mytarget/lib/javassist-3.18.1-GA.jar \
	   mytarget/lib-direct'
echo '###############################################################'
mv mytarget/lib/hibernate-jpa-2.1-api-1.0.0.Final.jar \
   mytarget/lib/hibernate-core-5.0.1.Final.jar \
   mytarget/lib/slf4j-api-1.7.21.jar \
   mytarget/lib/javassist-3.18.1-GA.jar \
   mytarget/lib-direct


echo '###############################################################'
echo '$ javac -d mytarget/classes/ -p mytarget/lib -cp mytarget/lib-direct $(find src/main/java -name "*.java")'
echo '###############################################################'
javac -d mytarget/classes/ -p mytarget/lib-direct -cp mytarget/lib $(find src/main/java -name "*.java")

echo '###############################################################'
echo '$ cp src/main/resources/* mytarget/classes/'
echo '###############################################################'
cp src/main/resources/* mytarget/classes/


echo '###############################################################'
echo '$ jar cf mytarget/cqrs.jar -C mytarget/classes .'
echo '###############################################################'
jar cf mytarget/cqrs.jar -C mytarget/classes/ .

echo '###############################################################'
echo '$ java --add-modules java.sql \
             --add-opens java.base/java.lang=javassist \
	     -p mytarget/lib-direct:mytarget/cqrs.jar \
	     -cp "mytarget/lib/*" \
	     -m com.iluwatar.cqrs/com.iluwatar.cqrs.app.App'
echo '###############################################################'
java --add-modules java.sql \
     --add-opens java.base/java.lang=javassist \
     -p mytarget/lib-direct:mytarget/cqrs.jar \
     -cp "mytarget/lib/*" \
     -m com.iluwatar.cqrs/com.iluwatar.cqrs.app.App

