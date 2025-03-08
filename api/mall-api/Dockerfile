FROM openjdk:17-jdk-slim

WORKDIR /app

COPY ./target/supplier-api-2.2.25.jar supplier-api.jar

CMD ["java", "-jar", "supplier-api.jar"]