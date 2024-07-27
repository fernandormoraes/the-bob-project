# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.12)
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app

# Start server.
EXPOSE 3000
CMD ["bash", "/app/.docker/entrypoint.sh"]