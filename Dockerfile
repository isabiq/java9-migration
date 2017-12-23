FROM debian:sid-slim

RUN mkdir -p /app /usr/lib/jvm/jre/

WORKDIR /app

# copy the reduced jre
COPY mytarget/com.cqrs /usr/lib/jvm/jre/

ENV JAVA_HOME  /usr/lib/jvm/jre/

ENV PATH $PATH:$JAVA_HOME:$JAVA_HOME/bin

# copy cqrs and classpath into to app dir
COPY mytarget/cqrs.jar mytarget/lib ./

# run cqrs app
CMD java -cp "/app/*" com.iluwatar.cqrs.app.App
