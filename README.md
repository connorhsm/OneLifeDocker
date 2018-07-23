# One Hour One Life: Dockerized

This will let you easily bring up a container running a One Hour One Life game server.

## Running the server

Run `utils/up`.  This will start the server and begin following it's output.  Press `ctrl-c` to stop watching the output.  It will continue running in the background.  `utils/halt` will put the server in shutdown mode.  No new players will be allowed to connect, and once the last player leaves, the server will shut down.  `utils/halt force` will tell the server to disconnect all players and begin shutting down immediately.

## Rebuild the image

As new versions of the game are released, you will need to rebuild the server image.  Run `docker-compose build --no-cache` to fetch the latest version of the server and build a new Docker image with it.

## Patches

Place patch files the subdirectories of `docker/patches` to customize your server.  You can generate a patch file from a staged commit by `git diff --staged > file.patch` or from a completed commit with `git format-patch`. Only the latter method works with binary files.

Some possibly usefull patches are provided in the `examples` subdirectories of each patch directory.  To use them, copy out of the examples directory.  For example, `cp docker/patches/OneLife/examples/private_server_defaults.patch docker/patches/OneLife`.  You will then need to rebuild your image as above.

### Provided examples:

#### `OneLife/examples/private_server_defaults.patch`
Sets some reasonable default settings for private servers.  Specifically, it turns on requireClientPassword, and turns off requireTicketServerCheck, useLineageServer and useStatsServer.  Note that this only affects the default settings that get copied into the shared settings folder the first time you run your container.  If that folder is already populated, those settings will still be used.

#### `OneLifeData/examples/no_basket_decay.patch`
Stops baskets from turning to floppy baskets after 10 hours.
