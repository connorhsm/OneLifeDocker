# Full setup
A perscriptive guide to run a private server. You'll need some basic idea of Git and Docker, but otherwise this guide should tell you exactly what you need to install and how to use it. Please create an issue if anything is unclear.

This guide will focus on 2HOL, but can very easily be translated to the OHOL option.

## Requirements

### Docker
- Install Docker https://docs.docker.com/engine/install/.

### Git (recommended)
- It's easiest to simply clone this repo and interact with it locally.
- Install Git https://git-scm.com/book/en/v2/Getting-Started-Installing-Git.

## Windows
1. Open a command prompt.
2. Enter `cd Documents` (Or your preferred save location).
3. Clone repo `git clone https://github.com/connorhsm/OneLifeDocker`.
4. Enter `cd OneLifeDocker`.
5. Build and start a 2HOL server `docker compose -f docker-compose.2hol.yml up -d`.
6. Monitor the server logs `docker logs -f 2hol-server`.
7. Destroy the server `docker compose -f docker-compose.2hol.yml down`.
   1. This is an unsafe shut down. Currently held items will be deleted.

## Linux
1. Open a terminal prompt.
2. Clone repo `git clone https://github.com/connorhsm/OneLifeDocker`.
   1. Optionally you can put this in any desired location.
3. Enter `cd OneLifeDocker`.
4. Build and start a 2HOL server `utils/start 2hol`.
5. Stop the server safely `utils/stop 2hol force`.

## Play on the server
Use your regular 2HOL client. Before logging in, change your custom server settings.
1. Enable custom server.
2. Enter custom server address `localhost`.
3. Enter custom server port `8006`.

## Update the server
When the game is updated, you'll need to rebuild the server.

- Windows: `docker compose -f docker-compose.2hol up -d --build`.
- Linux: `utils/build 2hol`.
- Start the server as above.

## Patches and updating server settings
Patches allow you to customise the server *before* the *first* run.

### Update settings
You can still update settings after the first run by editing settings files found in `2hol-data/settings/`. Admin permission may be required.

### Patches
See detailed description as in [README.md](README.md).

Various patches can be found in `docker/2hol/OneLife/examples/` that can be used to configure your server to a certain preset, such as:
- Vanilla
- Speed running ([Speedrun.com](https://www.speedrun.com/Two_Hours_One_Life_2HOL) rules)
- Other as you see fit

Apply these with:
- Windows `move docker/2hol/OneLife/examples/speed_running.patch docker/2hol/OneLife/`
- Linux: `cp docker/2hol/OneLife/examples/speed_running.patch docker/2hol/OneLife/`

## Wipe all data
- Windows: `rmdir 2hol-data`
- Linux: `sudo rm -rf 2hol-data`

## Missing something?
[Create a new issue](https://github.com/connorhsm/OneLifeDocker/issues/new) and let me know!
