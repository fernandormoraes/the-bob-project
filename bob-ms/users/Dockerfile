# Use OpenJDK 11 as the base image
FROM eclipse-temurin:21-jre-ubi10-minimal

RUN microdnf install findutils

WORKDIR /app

ENTRYPOINT ["bash", "/app/.docker/entrypoint.sh"]