#!/bin/bash

# Vérification des arguments
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 \"texte à lire\" fichier_sortie.mp3 [voix]"
    echo "Example: $0 \"Bonjour les enfants\" bonjour.mp3"
    echo "Example avec voix: $0 \"Hello children\" hello.mp3 en-GB-RyanNeural"
    exit 1
fi

# Récupération des arguments
TEXT="$1"
OUTPUT="$2"
VOICE="${3:-fr-FR-HenriNeural}"  # Utilise fr-FR-HenriNeural par défaut

# Création d'un dossier temporaire
TEMP_DIR="/tmp/audio-tts-$$"
mkdir -p "$TEMP_DIR"

# Création du dossier de sortie si nécessaire
mkdir -p "$(dirname "$OUTPUT")"

# Chemin absolu pour le fichier de sortie
ABSOLUTE_OUTPUT="$(realpath "$OUTPUT")"

# Construction et exécution de la commande docker
sudo docker build -t audio-tts .
sudo docker run --rm -v "$TEMP_DIR:/output:rw" audio-tts -t "$TEXT" -o "/output/output.mp3" --voice "$VOICE"

# Copie du fichier de sortie vers la destination finale
sudo mv "$TEMP_DIR/output.mp3" "$ABSOLUTE_OUTPUT"

# Nettoyage
sudo rm -rf "$TEMP_DIR"