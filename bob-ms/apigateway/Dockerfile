# Use OpenJDK 11 as the base image
FROM openjdk:21-jdk

RUN microdnf install findutils

COPY ./ /app

WORKDIR /app

RUN chmod +x ./gradlew

RUN ./gradlew build -x test

ENTRYPOINT ["java","-jar", "/build/libs/apigateway-0.0.1-SNAPSHOT.jar"]
