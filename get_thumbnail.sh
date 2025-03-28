#!/bin/bash

# Vérifier que l'URL est passée en argument
if [ -z "$1" ]; then
  echo "Usage : $0 <URL YouTube>"
  exit 1
fi

URL="$1"

# Extraire l'ID de la vidéo
VIDEO_ID=$(echo "$URL" | grep -oE 'v=([a-zA-Z0-9_-]+)' | cut -d'=' -f2)

# Vérifier que l'ID est valide
if [ -z "$VIDEO_ID" ]; then
  echo "Erreur : impossible d'extraire l'ID de la vidéo."
  exit 1
fi

# Créer le répertoire pour les miniatures
mkdir -p thumbnails

# Télécharger la miniature (en version haute résolution si possible)
THUMBNAIL_URL="https://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"
OUTPUT_FILE="thumbnails/${VIDEO_ID}_thumbnail.jpg"

# Télécharger la miniature
curl -s -o "$OUTPUT_FILE" "$THUMBNAIL_URL"

# Si le téléchargement échoue, essayer une version par défaut
if [ ! -f "$OUTPUT_FILE" ]; then
  echo "Miniature en haute résolution non trouvée, téléchargement de la version par défaut..."
  curl -s -o "$OUTPUT_FILE" "https://img.youtube.com/vi/$VIDEO_ID/default.jpg"
fi

echo "Miniature téléchargée sous le nom : $OUTPUT_FILE"

# Ouvrir la miniature si feh ou xdg-open est installé
if command -v feh &> /dev/null; then
  feh "$OUTPUT_FILE"
elif command -v xdg-open &> /dev/null; then
  xdg-open "$OUTPUT_FILE"
else
  echo "Vous pouvez ouvrir manuellement la miniature dans le dossier 'thumbnails'."
fi
