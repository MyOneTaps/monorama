# Panorama UI notes.

The Panorama UI utilizes JavaScript for programming the interface. The game includes a copy of the
Chrome's rendering engine. 

All panorama data is stored in a `code.pbin` file inside `/csgo/panorama/`. That file is just a zip 
archive.

I store these files inside the airgap folder within this project. I can't share it due to legal 
concerns.

# Using the Makefile

If you want to toy with Panorama yourself, I've added a Makefile to slightly streamline the process.
You will need Linux Subsystem for Windows or any other sufficently POSIX environment. Panorama 
doesn't run on Linux itself yet, so this is why I'm emulating a good development environment on top 
of a bad one.

To use it, first you must set up an envvar pointing to your CSGO directory. In your shell, run
```bash
export CSGO="/mnt/d/games/steam/SteamApps/common/Counter-Strike Global Offensive/"
```
obviously, replacing the path so it's valid for wherever you've installed the game. 
Remember to end it with a slash