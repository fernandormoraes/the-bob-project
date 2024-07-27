# Use OpenJDK 11 as the base image
FROM openjdk:21-jdk

RUN microdnf install findutils

WORKDIR /app

ENTRYPOINT ["bash", "/app/.docker/entrypoint.sh"]