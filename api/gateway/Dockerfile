FROM openjdk:17-jdk-slim

WORKDIR /app

COPY ./target/gateway-2.2.21.jar gateway.jar

CMD ["java", "-jar", "gateway.jar"]