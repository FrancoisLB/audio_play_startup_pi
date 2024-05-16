#!/bin/bash

echo "Installation of startup_play et shutdown_play services."

# Utiliser grep pour filtrer les lignes contenant "Model"
model=$(grep Model /proc/cpuinfo)

# Extraire la version à partir de la ligne de révision
version_pi=$(echo "$model" | awk -F': ' '{print $2}')

# Afficher la version du Raspberry Pi
echo "Raspberry Pi version : $version_pi"

echo "Installation of espeak voice synthesis."
sudo apt install espeak -y

echo "Directory création : /home/pi/audio to store audio files (wave format)." 
mkdir -p /home/pi/audio 
sudo chmod 777 /home/pi/audio 

echo "Audio files copy." 
cp ./audio_fichier_waves/*.wav /home/pi/audio

echo "sh files copy in directory : /etc."
sudo cp *.sh /etc
sudo chmod +x /etc/shutdownplay.sh
sudo chmod +x /etc/startupplay.sh

echo "service files copy in directory : /etc/systemd/system."
sudo cp *.service /etc/systemd/system 
sudo chmod 644 /etc/systemd/system/startupplay.service
sudo chmod 644 /etc/systemd/system/shutdownplay.service

echo "services activation." 
sudo systemctl daemon-reload 
sudo systemctl enable startupplay.service
sudo systemctl enable shutdownplay.service

echo "services restart."
sudo systemctl restart startupplay.service

echo "Completed."
