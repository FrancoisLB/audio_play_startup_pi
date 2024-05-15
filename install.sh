#!/bin/bash

echo "Install startup_play and shutdown_play services." 

# Utiliser grep pour filtrer les lignes contenant "Model"
model=$(grep Model /proc/cpuinfo)

# retourne par exemple :
# Model           : Raspberry Pi 4 Model B Rev 1.1
 
# Extraire la version à partir de la ligne de révision
version_pi=${model: -4}

# Afficher la version du Raspberry Pi
echo "Version du Raspberry Pi : $version_pi"

echo "Install espeak"
sudo apt install espeak

echo "Create new directory : home/pi/audio to store audio files" 
mkdir /home/pi/audio 
sudo chmod 777 /home/pi/audio 

echo "Copy audio files in this directory" 
cp ./audio_fichier_waves/*.wav /home/pi/audio

echo "sh files are copied in /etc directory."
cp *.sh /etc
chmod +x /etc/shutdownplay.sh
chmod +x /etc/startupplay.sh

echo "Copy of service files in /etc/systemd/system directory."
cp *.service /etc/systemd/system 
sudo chmod 644 /etc/systemd/system/startupplay.service
sudo chmod 644 /etc/systemd/system/shutdownplay.service

echo "Service activation" 
sudo systemctl daemon-reload 
sudo systemctl enable startupplay.service
sudo systemctl enable shutdownplay.service

echo "Restart services."
sudo systemctl daemon-reload
sudo systemctl restart startupplay.service
 
