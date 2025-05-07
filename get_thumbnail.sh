#!/bin/bash

get_thumbnail(){
    # Vérifie que l'URL est passée
if [ -z "$1" ]; then
  echo "Usage : $0 <URL YouTube>"
  exit 1
fi

URL="$1"

# Extraction de l'ID depuis l'URL (fonctionne pour les URLs classiques)
VIDEO_ID=$(echo "$URL" | grep -oE 'v=([a-zA-Z0-9_-]+)' | cut -d'=' -f2)

# Vérifie si l'ID est vide
if [ -z "$VIDEO_ID" ]; then
  echo "Erreur : impossible d'extraire l'ID de la vidéo."
  exit 1
fi

mkdir -p thumbnails

# Télécharge la miniature
curl -s -o "thumbnails/${VIDEO_ID}_thumbnail.jpg" "https://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"

# Vérifie le succès
if [ $? -eq 0 ]; then
  echo "Miniature téléchargée dans thumbnails/${VIDEO_ID}_thumbnail.jpg"
else
  echo "Erreur lors du téléchargement."
  exit 1
fi
}

get_thumbnail "$1"