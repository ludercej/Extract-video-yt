#!/bin/bash

<<<<<<< HEAD
# Vérifie si un argument est fourni
if [ $# -ne 1 ]; then
  echo "Usage: $0 <YouTube_URL>"
  exit 1
fi

URL="$1"

# Extraction de l'ID vidéo (fonctionne pour la plupart des formats d'URL YouTube)
VIDEO_ID=$(echo "$URL" | sed -n 's#.*v=\([a-zA-Z0-9_-]*\).*#\1#p')

# Vérifie si l'ID a été extrait
=======
# Vérifier si l'URL a été passée en argument
if [ -z "$1" ]; then
  echo "Usage: $0 *"
  exit 1
fi

# Create folder
mkdir -p thumbnails

# Extraire l'ID de la vidéo à partir de l'URL
URL=$1
VIDEO_ID=$(echo $URL | sed -E 's/.*(v=|\/)([a-zA-Z0-9_-]+).*/\2/')

# Vérifier si l'ID de la vidéo est bien extrait
>>>>>>> 572ff92e76a27314297204f02a36432ab6897086
if [ -z "$VIDEO_ID" ]; then
  echo "Impossible d'extraire l'ID de la vidéo."
  exit 2
fi

<<<<<<< HEAD
# URL de la miniature HD
THUMB_URL="https://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"
OUTFILE="thumbnail_${VIDEO_ID}.jpg"

# Téléchargement de la miniature
wget -q -O "$OUTFILE" "$THUMB_URL"
=======
# Télécharger la miniature en haute définition
THUMBNAIL_URL="https://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"

# Sauvegarder l'image avec un nom clair
OUTPUT_FILE="thumbnail_${VIDEO_ID}.jpg"
curl -o "$OUTPUT_FILE" "$THUMBNAIL_URL"
>>>>>>> 572ff92e76a27314297204f02a36432ab6897086

if [ $? -eq 0 ]; then
  echo "Miniature téléchargée sous : $OUTFILE"
else
<<<<<<< HEAD
  echo "Erreur lors du téléchargement."
  exit 3
=======
  echo "Erreur lors du téléchargement de la miniature."
  exit 1
>>>>>>> 572ff92e76a27314297204f02a36432ab6897086
fi
