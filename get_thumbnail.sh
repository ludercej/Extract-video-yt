#!/bin/bash

# Vérifier si l'argument est fourni
if [ -z "$1" ]; then
  echo "Usage: $0 <URL de la vidéo YouTube>"
  exit 1
fi

# Extraire l'ID de la vidéo YouTube à partir de l'URL
URL=$1
VIDEO_ID=$(echo $URL | sed -E 's/.*[?&]v=([^&]*).*/\1/')

# Vérifier si l'ID de la vidéo a été extrait correctement
if [ -z "$VIDEO_ID" ]; then
  echo "Erreur: Impossible d'extraire l'ID de la vidéo à partir de l'URL."
  exit 1
fi

# Télécharger la miniature en haute définition
THUMBNAIL_URL="https://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"
OUTPUT_FILE="thumbnail_$VIDEO_ID.jpg"

echo "Téléchargement de la miniature de la vidéo YouTube avec l'ID $VIDEO_ID..."
curl -o $OUTPUT_FILE $THUMBNAIL_URL

# Vérifier si le téléchargement a réussi
if [ $? -eq 0 ]; then
  echo "Miniature téléchargée avec succès et sauvegardée sous le nom : $OUTPUT_FILE"
else
  echo "Erreur: Échec du téléchargement de la miniature."
fi