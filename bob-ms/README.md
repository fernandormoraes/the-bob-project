# Bob Microservices

This directory presents all the microservices and RSBF's of the case study.

## Directory structure

*apigateway.* This is the API Gateway reponsible for providing an unique entrypoint for microservices applications.

*users.* This is Users microservice, providing endpoints for signup and login features.

*courses.* This is Courses microservice, providing endpoints for listing Courses, Modules and Content.

*eurekaserver.* This folder contains the Eureka Server, responsible for Service Discovery.

*courses-mobile-rsbf.* This folder contains the code responsible for RSBF service for the Home Page Mobile application.

*.docker/postgres.* This folder contains the PostgreSQL database configuration.

Below we present installation instructions (they are the same presented in the main README of repository).

## Installation

This section presents how to run the case study.

### Run microservices with a data-ready database

To run the application with pre-inserted data in the database and avoid the section to prepare database, you can run *compose.case-study.yml* instead of *compose.yml*:

    docker compose -f compose.case-study.yml up

Now, it is possible to *login* in the Mobile application with the following user:

*Username:* test@mail.com
*Password:* 123

The section *Preparing Database to reproduce the Case Study* can be *SKIPPED* after running *compose-case-study.yml*.

### Bob-ms

The *bob-ms* directory contains all the microservice structure of the case study. Which can be run using *Docker Compose*.

    docker compose -f compose.yml up

### Preparing Database to reproduce the Case Study

Initially, only tables and columns creation migrations are running in the project, which means that although the database is ready, there is no data inserted at the start of the microservices.

The first step to ensure a running application is to insert the available user roles. In the *roles* table insert the following:

    insert into roles (name) values ('USER');
    insert into roles (name) values ('ADMIN');

The second step is to insert a user, the mobile application doesn't has a way to do that *yet*, but the microservices already has signup support, so we do have two ways to sign up a user.

Post to SignUp route (http://localhost:8080/api/users/signup), with the following body request (you can change attibutes):

    {
    	"username": "test@mail.com",
    	"email": "test@mail.com",
    	"name": "test",
    	"password": "123"
    }

Or inserting manually in the database (note that password in encrypted using *BCRYPT*):

    insert into users (email, name, password, username) values ('test@mail.com', 'Test', '$2a$12$MIOta4TsmAYOA3b.YP1QYOJPU35KBWOA1jJLQhdeYEK0ksSZLZe/S', 'test@mail.com'); // Password '123'

    insert into users_roles (user_id, roles_id) values (1, 1);

At this moment, the mobile application is ready for a login with email and password, yet, there are no courses available in the home page, let's insert some courses.

    insert into course (cover, description) values ('https://media.geeksforgeeks.org/wp-content/uploads/20240104114808/Free-JavaScript-Courses.jpg', 'Javascript Course');

You're ready to go! At this moment, it is possible to insert multiple courses, note that *cover* column is a link to an image. The microservices are ready to get modules and content, but the mobile application only supports showing courses *for now*.

### Testing RSBF route

It is possible to GET the UI code response from an RSBF.

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

Now you should be able to receive the response UI code presented in the home page of the mobile application.
