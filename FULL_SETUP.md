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
5. Start the server `utils\start.cmd 2hol`.
   1. Press `ctrl-c` to stop watching the output. It will continue running in the background.
6. Stop the server `utils\stop.cmd 2hol`.
   1. You can add `force` to kick all living players.

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

- Windows: `utils\build 2hol`.
- Linux: `utils/build 2hol`.
- Start the server as above.

## Change settings
Either use Patches (see below) before the first build of the server or edit settings files found in `2hol-data/settings/`.

## Patches
See detailed description as in [README.md](README.md).

Small changes that can be made to the server, which then requires a rebuild. Examples can be found in `docker/2hol/OneLife/examples/`.

Apply these with:
- Windows
  - `move docker/2hol/OneLife/examples/xyz.patch docker/2hol/OneLife/`
  - build
- Linux
  - `cp docker/2hol/OneLife/examples/xyz.patch docker/2hol/OneLife/`
  - `utils/build 2hol`

## Wipe all data
- Windows: `rmdir 2hol-data`
- Linux: `sudo rm -rf 2hol-data`

## Missing something?
[Create a new issue](https://github.com/connorhsm/OneLifeDocker/issues/new) and let me know!
