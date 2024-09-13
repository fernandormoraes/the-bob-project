# The Bob Project 🐢

A case study on Micro Frontend Architecture approaches (Microservices Architecture, Mobile, Web).

## Publications

The directories *bob-ms* and *bob_mobile* contain the code available for the case study presented in the paper *"A New Integration Approach to support the Development of Build-time Micro Frontend Architecture Applications"*, which was accepted at *SBES* (Brazilian Symposium on Software Engineering) in the *IIER* (Insightful Ideas and Emerging Results Track) track.

The paper is available in *paper* directory, this case study is reproducible by the integration between the mobile application and RSBF services (check the paper for more deep details), following the *Bob-ms* section will perfectly show a running case study.

## Requirements

- Windows 10 or later/Linux compatible with Flutter/MacOs 13 or higher (https://docs.flutter.dev/reference/supported-platforms)
- Docker
- Docker Compose
- Dart
- Flutter SDK (3.4 or later)

## Installation

This section presents how to run the case study.

### Bob-ms

The *bob-ms* directory contains all the microservice structure of the case study. Which can be run using *Docker Compose*.

    docker compose -f compose.yml up

### Preparing Database to reproduce the Case Study

Initially, only tables and columns migrations are running in the project, which means that although the database is ready, there is no data inserted at the start of the microservices.

The first step to ensure a running application is to insert the available user roles. In the *roles* table insert the following:

    insert into roles (name) values ('USER');
    insert into roles (name) values ('ADMIN');

The second step is to insert a user, the mobile application hasn't a way to do that *yet*, but the microservices already has signup support, so we do have two ways to sign up a user.

Post to SignUp route (http://localhost:8080/api/users/signup), with the following body request (you can change attibutes):

    {
    	"username": "test@mail.com",
    	"email": "test@mail.com",
    	"name": "test",
    	"password": "123"
    }

Or inserting manually in database (note that password in encrypted using *BCRYPT*):

    insert into users (email, name, password, username) values ('test@mail.com', 'Test', '$2a$12$MIOta4TsmAYOA3b.YP1QYOJPU35KBWOA1jJLQhdeYEK0ksSZLZe/S', 'test@mail.com'); // Password '123'

    insert into users_roles (user_id, roles_id) values (1, 1);

At this moment, the mobile application is ready for a login with email and password, yet, there is no courses available in the home page, let's insert some courses.

    insert into course (cover, description) values ('https://media.geeksforgeeks.org/wp-content/uploads/20240104114808/Free-JavaScript-Courses.jpg', 'Javascript Course');

You're ready to go! It is possible to insert multiple courses, just note that *cover* column is a link to an image. The microservices are ready to get modules and content, but the mobile application only supports showing courses *for now*.

### Testing RSBF route

It is possible to GET the UI code response from a RSBF.

First step, POST a login

    http://localhost:8080/api/users/login

    {
	    "username": "test@mail.com",
	    "password": "123"
    }

Get *data* field body response, where we'll have the *Bearer Token* for authentication.

GET RSBF courses:

In Headers:
    
    Authorization: Bearer bearer_token_here

Run GET request on:

    http://localhost:3000/api/courses-mobile

And you should be able to receive the response UI code presented in the home page of the mobile application.

### Bob_mobile

The *bob_mobile* directory contains the mobile application developed in flutter, which consumes the RSBF services and interpret UI using rfw library.

After Flutter SDK was installed and with the running microservices, it is necessary to set the API Gateway host in Flutter Project.

    ./bob_mobile/shared_app/const.dart
    const String apiBaseUrl = 'http://10.0.2.2:8080/api'; // Change host/port if necessary to the API Gateway.

To run the Flutter application:

    flutter run

### Login

Following the steps to insert data presented in *Bob-ms* section, it is possible to login in the application by using *email* and *password*.

The home page will list a carroussel with courses and a Drawer menu, every piece of this UI comes from a RSBF response.

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
