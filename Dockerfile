FROM openjdk:8u151-jre-alpine

RUN mkdir /app/

WORKDIR /app

# copy cqrs and classpath into to app dir
COPY mytarget/cqrs.jar mytarget/lib ./

# run cqrs app
ENTRYPOINT java -cp "/app/*" com.iluwatar.cqrs.app.App
