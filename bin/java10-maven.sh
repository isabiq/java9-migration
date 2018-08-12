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
echo '$ mkdir target/patch-modules \
           mv target/lib/jaxb-runtime-2.3.0.jar target/lib/geronimo-jta_1.1_spec-1.1.1.jar target/patch-modules/'
echo '###############################################################'
mkdir target/patch-modules && \
  mv target/lib/jaxb-runtime-2.3.0.jar target/lib/geronimo-jta_1.1_spec-1.1.1.jar target/patch-modules/

echo '###############################################################'
echo '$ java \
             --patch-module jaxb.core=target/patch-modules/jaxb-runtime-2.3.0.jar \
	     --patch-module java.sql=target/patch-modules/geronimo-jta_1.1_spec-1.1.1.jar \
	     --add-modules jdk.unsupported \
	     --add-opens java.base/java.lang=javassist \
	     --add-exports java.sql/javax.transaction=hibernate.core \
	     -p target/lib:target/cqrs.jar \
	     -m com.iluwatar.cqrs/com.iluwatar.cqrs.app.App'
echo '###############################################################'
java \
     --patch-module jaxb.core=target/patch-modules/jaxb-runtime-2.3.0.jar \
     --patch-module java.sql=target/patch-modules/geronimo-jta_1.1_spec-1.1.1.jar \
     --add-modules jdk.unsupported \
     --add-opens java.base/java.lang=javassist \
     --add-exports java.sql/javax.transaction=hibernate.core \
     -p target/lib:target/cqrs-1.18.0-SNAPSHOT.jar \
     -m com.iluwatar.cqrs/com.iluwatar.cqrs.app.App

