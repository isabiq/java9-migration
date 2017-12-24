FROM debian:sid-slim

RUN mkdir -p /app/lib /usr/lib/jvm/jre/

WORKDIR /app

# copy the reduced jre
COPY mytarget/com.cqrs /usr/lib/jvm/jre/

ENV JAVA_HOME  /usr/lib/jvm/jre/

ENV PATH $PATH:$JAVA_HOME:$JAVA_HOME/bin

# copy cqrs and classpath into to app dir
COPY mytarget/cqrs.jar mytarget/lib-direct ./

COPY mytarget/lib ./lib

# run cqrs app
CMD java --add-modules java.sql \
     --add-opens java.base/java.lang=javassist \
     -p /app \
     -cp "/app/lib/*" \
     -m com.iluwatar.cqrs/com.iluwatar.cqrs.app.App
