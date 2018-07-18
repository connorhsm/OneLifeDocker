# One Hour One Life: Dockerized

This will let you easily bring up a container running a One Hour One Life game server.

## Build the image

You will need to have Docker installed to build and run the image.  From the repo root in your terminal run:

`$ docker build -t ohol-server:latest .`

## Running the server

```
$ docker run -t -p 8005:8005 -v `pwd`/db/:/opt/OneLife/server/db/ -v `pwd`/settings:/opt/OneLife/server/settings/ ohol-server:latest
```
