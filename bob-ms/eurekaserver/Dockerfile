FROM openjdk:21-jdk

RUN microdnf install findutils

COPY ./ /app

WORKDIR /app

RUN chmod +x ./gradlew

RUN ./gradlew build -x test

RUN ls 

RUN ls ./build/

RUN ls ./build/libs/

RUN chmod +x ./build/libs/eurekaserver-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar", "/build/libs/eurekaserver-0.0.1-SNAPSHOT.jar"]
