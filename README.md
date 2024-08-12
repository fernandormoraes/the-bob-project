# The Bob Project 🐢

A case study on Micro Frontend Architecture approaches (Microservices Architecture, Mobile, Web).

## Publications

The directories *bob-ms* and *bob_mobile* contain the code available for the case study presented in the paper *"A New Integration Approach to support the Development of Build-time Micro Frontend Architecture Applications"*, which was accepted at *SBES* (Brazilian Symposium on Software Engineering) in the *IIER* (Insightful Ideas and Emerging Results Track) track.

## Requirements

- Windows 10 or later/Linux compatible with Flutter
- Docker
- Docker Compose
- Dart
- Flutter SDK (3.4 or later)

## Installation

This section presents how to run the case study.

### Bob-ms

The *bob-ms* directory contains all the microservice structure of the case study. Which can be run using *Docker Compose*.

    docker compose -f compose.yml up

### Bob_mobile

The *bob_mobile* directory contains the mobile application developed in flutter, which consumes the RSBF services and interpret UI using rfw library.

After Flutter SDK was installed and with the running microservices, it is necessary to set the API Gateway host in Flutter Project.

    ./bob_mobile/shared_app/const.dart
    const String apiBaseUrl = 'http://10.0.2.2:8080/api'; // Change host/port if necessary to the API Gateway.

To run the Flutter application:

    flutter run

### Bob-mfa

The *bob-mfa* directory contains code for a web application that is not part of the aforementioned publication and it is a work in progress.

### Technologies
**Microservices Architecture**
- Kotlin
- Spring Framework
- Containers
- Dart (RSBF Services for Mobile)
- Alfred (Dart backend)

**Mobile**
- Flutter
- RFW library
- Backend for Frontend concepts
- Remote Component Rendering concepts
- RSBF concepts

**Web**
- ReactJS
- Garfish
- NodeJS
- Webpack
- Babel
