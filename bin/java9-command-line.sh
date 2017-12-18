#!/bin/bash

set -e

PROJECT_DIR=$(dirname "$0")
cd ${PROJECT_DIR}/.. 


echo '$ rm -rf mytarget/ && mkdir -p mytarget/classes && mkdir mytarget/lib-direct'
echo '###############################################################'
rm -rf mytarget/ && mkdir -p mytarget/classes && mkdir mytarget/patch-modules/


echo '###############################################################'
echo '$ mvn dependency:copy-dependencies -DoutputDirectory=mytarget/lib'
echo '###############################################################'
mvn dependency:copy-dependencies -DoutputDirectory=mytarget/lib


echo '###############################################################'
echo '$ mv mytarget/lib/jaxb-runtime-2.3.0.jar mytarget/lib/geronimo-jta_1.1_spec-1.1.1.jar mytarget/patch-modules/'
echo '###############################################################'
mv mytarget/lib/jaxb-runtime-2.3.0.jar mytarget/lib/geronimo-jta_1.1_spec-1.1.1.jar mytarget/patch-modules/
#   mytarget/lib/hibernate-core-5.0.1.Final.jar \
#   mytarget/lib/slf4j-api-1.7.21.jar \
#   mytarget/lib/javassist-3.18.1-GA.jar \
#   mytarget/lib-direct


echo '###############################################################'
echo '$ javac -d mytarget/classes/ \
      --patch-module jaxb.core=mytarget/patch-modules/jaxb-runtime-2.3.0.jar \
      --patch-module java.sql=mytarget/patch-modules/geronimo-jta_1.1_spec-1.1.1.jar \
      -p mytarget/lib $(find src/main/java -name "*.java")'
echo '###############################################################'
javac -d mytarget/classes/ \
      --patch-module jaxb.core=mytarget/patch-modules/jaxb-runtime-2.3.0.jar \
      --patch-module java.sql=mytarget/patch-modules/geronimo-jta_1.1_spec-1.1.1.jar \
      -p mytarget/lib $(find src/main/java -name "*.java")


echo '###############################################################'
echo '$ cp src/main/resources/* mytarget/classes/'
echo '###############################################################'
cp src/main/resources/* mytarget/classes/


echo '###############################################################'
echo '$ jar cf mytarget/cqrs.jar -C mytarget/classes .'
echo '###############################################################'
jar cf mytarget/cqrs.jar -C mytarget/classes/ .


echo '###############################################################'
echo '$ java \
             --patch-module jaxb.core=mytarget/patch-modules/jaxb-runtime-2.3.0.jar \
	     --patch-module java.sql=mytarget/patch-modules/geronimo-jta_1.1_spec-1.1.1.jar \
	     --add-modules jdk.unsupported \
	     --add-opens java.base/java.lang=javassist \
	     --add-exports java.sql/javax.transaction=hibernate.core \
	     -p mytarget/lib:mytarget/cqrs.jar \
	     -m com.iluwatar.cqrs/com.iluwatar.cqrs.app.App'
echo '###############################################################'
java \
     --patch-module jaxb.core=mytarget/patch-modules/jaxb-runtime-2.3.0.jar \
     --patch-module java.sql=mytarget/patch-modules/geronimo-jta_1.1_spec-1.1.1.jar \
     --add-modules jdk.unsupported \
     --add-opens java.base/java.lang=javassist \
     --add-exports java.sql/javax.transaction=hibernate.core \
     -p mytarget/lib:mytarget/cqrs.jar \
     -m com.iluwatar.cqrs/com.iluwatar.cqrs.app.App
     

