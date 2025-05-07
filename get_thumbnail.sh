#!/bin/bash

# Vérifie si un argument est fourni
if [ $# -ne 1 ]; then
  echo "Usage: $0 <YouTube_URL>"
  exit 1
fi

URL="$1"

# Extraction de l'ID vidéo (fonctionne pour la plupart des formats d'URL YouTube)
VIDEO_ID=$(echo "$URL" | sed -n 's#.*v=\([a-zA-Z0-9_-]*\).*#\1#p')

# Vérifie si l'ID a été extrait
if [ -z "$VIDEO_ID" ]; then
  echo "Impossible d'extraire l'ID de la vidéo."
  exit 2
fi

# URL de la miniature HD
THUMB_URL="https://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"
OUTFILE="thumbnail_${VIDEO_ID}.jpg"

# Téléchargement de la miniature
wget -q -O "$OUTFILE" "$THUMB_URL"

if [ $? -eq 0 ]; then
  echo "Miniature téléchargée sous : $OUTFILE"
else
  echo "Erreur lors du téléchargement."
  exit 3
fi
