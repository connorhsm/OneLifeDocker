# One Hour One Life: Dockerized

This will let you easily bring up a container running a One Hour One Life game server.

## Build the image

You will need to have Docker installed to build and run the image.  From the repo root in your terminal run:

`$ docker build -t ohol-server:latest .`

## Running the server

```
$ docker run -t -p 8005:8005 -v `pwd`/db/:/opt/OneLife/server/db/ -v `pwd`/settings:/opt/OneLife/server/settings/ ohol-server:latest
```

## Patches

Place patch files the subdirectories of `docker/patches` to customize your server.  You can generate a patch file from a staged commit by `git diff --staged > file.patch` or from a completed commit with `git format-patch`. Only the latter method works with binary files.

Some possibly usefull patches are provided in the `examples` subdirectories of each patch directory.  To use them, copy out of the examples directory.  For example, `cp docker/patches/OneLife/examples/private_server_defaults.patch docker/patches/OneLife`.

### Provided examples:

#### `OneLife/examples/private_server_defaults.patch`
Sets some reasonable default settings for private servers.  Specifically, it turns on requireClientPassword, and turns off requireTicketServerCheck, useLineageServer and useStatsServer.

#### `OneLifeData/examples/no_basket_decay.patch`
Stops baskets from turning to floppy baskets after 10 hours.
