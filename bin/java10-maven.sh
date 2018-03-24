#!/bin/bash

set -e

PROJECT_DIR=$(dirname "$0")
cd ${PROJECT_DIR}/.. 


echo '###############################################################'
echo '$ mvn clean verify'
echo '###############################################################'
mvn clean verify


echo '###############################################################'
echo '$ mvn dependency:copy-dependencies -DoutputDirectory=target/lib'
echo '###############################################################'
mvn dependency:copy-dependencies -DoutputDirectory=target/lib


echo '###############################################################'
echo '$ mkdir target/lib-direct && \
        mv target/lib/hibernate-jpa-2.1-api-1.0.0.Final.jar \
           target/lib/hibernate-core-5.0.1.Final.jar \
	   target/lib/slf4j-api-1.7.21.jar \
	   target/lib/javassist-3.18.1-GA.jar \
	   target/lib-direct'
echo '###############################################################'
mkdir target/lib-direct && \
mv target/lib/hibernate-jpa-2.1-api-1.0.0.Final.jar \
   target/lib/hibernate-core-5.0.1.Final.jar \
   target/lib/slf4j-api-1.7.21.jar \
   target/lib/javassist-3.18.1-GA.jar \
   target/lib-direct


echo '###############################################################'
echo '$ java --add-modules java.sql \
             --add-opens java.base/java.lang=javassist \
	     -p target/lib-direct:target/cqrs-1.18.0-SNAPSHOT.jar \
	     -cp "target/lib/*" \
	     -m com.iluwatar.cqrs/com.iluwatar.cqrs.app.App'
echo '###############################################################'
java --add-modules java.sql \
     --add-opens java.base/java.lang=javassist \
     -p target/lib-direct:target/cqrs-1.18.0-SNAPSHOT.jar \
     -cp "target/lib/*" \
     -m com.iluwatar.cqrs/com.iluwatar.cqrs.app.App

