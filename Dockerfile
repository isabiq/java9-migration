FROM debian:sid-slim

RUN mkdir -p /app/patch-modules /usr/lib/jvm/jre/

WORKDIR /app

# copy the reduced jre
COPY mytarget/com.cqrs /usr/lib/jvm/jre/

ENV JAVA_HOME  /usr/lib/jvm/jre/

ENV PATH $PATH:$JAVA_HOME:$JAVA_HOME/bin

# copy cqrs and classpath into to app dir
COPY mytarget/cqrs.jar mytarget/lib ./

COPY mytarget/patch-modules ./patch-modules

# run cqrs app
ENTRYPOINT java \
     --patch-module jaxb.core=/app/patch-modules/jaxb-runtime-2.3.0.jar \
     --patch-module java.sql=/app/patch-modules/geronimo-jta_1.1_spec-1.1.1.jar \
     --add-modules jdk.unsupported \
     --add-opens java.base/java.lang=javassist \
     --add-exports java.sql/javax.transaction=hibernate.core \
     -p /app \
     -m com.iluwatar.cqrs/com.iluwatar.cqrs.app.App

