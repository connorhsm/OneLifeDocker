# Simple setup
You don't need or want to know nothin. You just want to play.

## Windows
1. [Install Docker](https://docs.docker.com/engine/install/).
2. [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
3. Open a command prompt.
4. Enter `cd Documents` to open your Documents in the prompt.
5. Enter `git clone https://github.com/connorhsm/OneLifeDocker` to clone the repository.
6. Enter `cd OneLifeDocker`.
7. Enter `utils\start.cmd 2hol` to start the server.
   1. You can then close the command prompt, it will keep running in the background.

### Play on the server
Use your regular 2HOL client.
1. Open your client.
2. Open settings.
3. Enable "Use custom server".
4. Enter custom server address `localhost`.
5. Enter custom server port `8006`.

### Stopping the server
1. Open a command prompt.
2. Enter `cd Documents\OneLifeDocker`.
3. Enter `utils\stop.cmd 2hol` to stop the server.

### Updating the server
1. Open a command prompt.
2. Enter `cd Documents\OneLifeDocker`.
3. Enter `utils\build.cmd 2hol` to rebuild the server (update).
4. Enter `utils\start.cmd 2hol` to start the server.

## Linux
Refer to [Full setup guide](FULL_SETUP.md#linux)
