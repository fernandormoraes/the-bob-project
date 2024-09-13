
# Bob_mobile

## Directory structure

*.* The root folder contains the application responsible for being the application container (In MFA context) of the MFApps.

*home_app.* This folder contains the MFApp responsible for rendering the home app based on RSBF UI code.

*shared_app.* This folder contains shared libraries for MFApps and Container application.

## Installation

The *bob_mobile* directory contains the mobile application developed in flutter, which consumes the RSBF services and interpret UI using rfw library.

After Flutter SDK was installed and with the running microservices, it is necessary to set the API Gateway host in Flutter Project.

    ./bob_mobile/shared_app/const.dart
    const String apiBaseUrl = 'http://10.0.2.2:8080/api'; // Change host/port if necessary to the API Gateway.

To run the Flutter application:

    flutter run

### Login

After following the steps to insert data presented in *Bob-ms* section, it is possible to login in the application by using *email* and *password*.

The home page will list a carroussel with courses and a Drawer menu, every piece of this UI comes from a RSBF response.
