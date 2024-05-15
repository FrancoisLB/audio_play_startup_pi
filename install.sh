#!/bin/bash

echo "Installation des services startup_play et shutdown_play."

# Utiliser grep pour filtrer les lignes contenant "Model"
model=$(grep Model /proc/cpuinfo)

# Extraire la version à partir de la ligne de révision
version_pi=$(echo "$model" | awk -F': ' '{print $2}')

# Afficher la version du Raspberry Pi
echo "Version du Raspberry Pi : $version_pi"

echo "Installation de espeak"
sudo apt install espeak -y

echo "Création du répertoire /home/pi/audio pour stocker les fichiers audio" 
mkdir -p /home/pi/audio 
sudo chmod 777 /home/pi/audio 

echo "Copie des fichiers audio dans ce répertoire" 
cp ./audio_fichier_waves/*.wav /home/pi/audio

echo "Copie des fichiers sh dans le répertoire /etc."
sudo cp *.sh /etc
sudo chmod +x /etc/shutdownplay.sh
sudo chmod +x /etc/startupplay.sh

echo "Copie des fichiers de service dans le répertoire /etc/systemd/system."
sudo cp *.service /etc/systemd/system 
sudo chmod 644 /etc/systemd/system/startupplay.service
sudo chmod 644 /etc/systemd/system/shutdownplay.service

echo "Activation des services" 
sudo systemctl daemon-reload 
sudo systemctl enable startupplay.service
sudo systemctl enable shutdownplay.service

echo "Redémarrage des services."
sudo systemctl restart startupplay.service

echo "Completed."