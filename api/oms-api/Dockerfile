FROM openjdk:17-jdk-slim

WORKDIR /app

COPY ./target/oms-api-2.2.25.jar oms-api.jar

RUN chmod -R 777 /app

CMD ["java", "-jar", "oms-api.jar"]