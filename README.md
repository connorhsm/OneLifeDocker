# OneLife: Dockerised
Easily bring up a container running a OneLife game server using Docker.

Supports:
- One Hour One Life (OHOL): Port 8005
- Two Hours One Life (2HOL): Port 8006

Default configuration is within rules defined by [Speedrun.com](https://www.speedrun.com/Two_Hours_One_Life_2HOL).

## Setup
- Need a fully fledged guide? See the [Full Setup guide](FULL_SETUP.md).
- Need the leanest, most basic setup? See the [Simple Setup guide](SIMPLE_SETUP.md).

## Utils

Found in `utils/` are executables to build, run and manage either server.

Windows:
- `utils\build.cmd <ohol|2hol>`
- `utils\start.cmd <ohol|2hol>`
- `utils\stop.cmd <ohol|2hol>`
- `utils\restart.cmd <ohol|2hol>`

Linux:
- `utils/build <ohol|2hol>`
- `utils/start <ohol|2hol>`
- `utils/stop <ohol|2hol>`
- `utils/restart <ohol|2hol>`
- and more

## Running the server

Run `utils/start <ohol|2hol>`. This will start the server and begin following it's output. Press `ctrl-c` to stop watching the output. It will continue running in the background. `utils/stop <ohol|2hol>` will put the server in shutdown mode. No new players will be allowed to connect, and once the last player leaves, the server will shut down. `utils/stop <ohol|2hol> force` will tell the server to disconnect all players and begin shutting down immediately.

## Rebuild the image

As new versions of the game are released, you will need to rebuild the server image. Run `utils/build <ohol|2hol>` to fetch the latest version of the server and build a new Docker image with it.

## Patches

Place patch files in the subdirectories of `docker/*hol/patches` to customise your server. You can generate a patch file from a staged commit by `git diff --staged > file.patch` or from a completed commit with `git format-patch`. Only the latter method works with binary files.

Some possibly useful patches are provided in the `examples` subdirectories of each patch directory. To use them, copy out of the examples directory. For example, `cp docker/ohol/patches/OneLife/examples/private_server_defaults.patch docker/ohol/patches/OneLife`. You will then need to rebuild your image as above.

Note that when patching settings, this only affects the default settings that get copied into the shared settings folder the first time you run your container. If that folder is already populated, those settings will still be used. 

### Provided examples:
#### OHOL
Find in `docker/ohol/patches/*/examples`
| Title                 | Description                                          | Default enabled? |
| --------------------- | ---------------------------------------------------- | ---------------- |
| Allow all VOG         | Allows all players to use VOG.                       | Yes              |
| Disable login check   | Disables authentication to login to the game server. | Yes              |
| Force all players Eve | Sets all players to spawn as Eve.                    | No               |
| Force Eve location    | Sets Eve spawn location to coordinates 0, 0.         | Yes              |
| No container decay    | Stops wheelbarrows from decaying.                    | Yes              |
| No clothing decay     | Stops hats, shirts, pants and shoes from decaying.   | Yes              |

#### 2HOL
Find in `docker/2hol/patches/*/examples`
| Title                 | Description                                          | Default enabled? |
| --------------------- | ---------------------------------------------------- | ---------------- |
| Allow all VOG         | Allows all players to use VOG.                       | Yes              |
| Allow Apocalypse      | Allows the Apocalypse to be triggered.               | Yes              |
| Disable login check   | Disables authentication to login to the game server. | Yes              |
| Force all players Eve | Sets all players to spawn as Eve.                    | No               |

## Missing something?
[Create a new issue](https://github.com/connorhsm/OneLifeDocker/issues/new) and let me know!
