The aim of this project is to add a sound when a raspberry PI starts and stops. 

This will enable a visually impaired or blind user to know the operating status of his pi.

we use two audio files in wave format to play two different sounds at startup and shutdown.
to do this, we use the raspberry pi's services. 

we create two services, startupplay and shutdownplay, which use two bash files to play the sounds in the files.
At startup, we also announce the wifi status using the espeak voice synthesis engine. 

the project's github repository contains an “install.sh” file that installs all the necessary components:
* audio files
* service file 
* bash file
* espeak installation 
* file rights management
* launch both service

This project has been developed on Raspberry PI 4 (2024/05). 
