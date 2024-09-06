#!/bin/bash

# play start sound
/usr/bin/aplay /home/pi/audio/start.wav

# Pause de 0.5 seconde
sleep 0.3

# nom de la machine 
espeak -vfr "nom de la machine : $(hostname)"

sleep 0.3 

echo "Détection réseau WIFI : "

# Vérifier la connexion à un réseau WiFi
connected=$(iwgetid -r)

# Si connecté à un réseau, afficher "WiFi connecté"
if [ -n "$connected" ]; then
    echo "WiFi connecté à : $connected"
    espeak -vfr "WiFi connecté à $connected"
else
    echo "WiFi non connecté."
    espeak -vfr "WiFi non connecté."
fi
