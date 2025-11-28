#!/bin/bash

dart pub get
# Ensure packages are still up-to-date if anything has changed
dart pub get --offline

dart compile exe bin/courses_mobile_rsbf.dart -o bin/server

/app/bin/server
