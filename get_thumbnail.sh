#!/bin/bash

# Vérifier si l'URL a été passée en argument
if [ -z "$1" ]; then
  echo "Usage: $0 <URL de la vidéo YouTube>"
  exit 1
fi

# Créer le répertoire 'thumbnails' s'il n'existe pas
echo "Création du répertoire thumbnails..."
mkdir -p thumbnails

# Vérifier si le répertoire a bien été créé
if [ -d "thumbnails" ]; then
  echo "Le répertoire thumbnails a été créé avec succès."
else
  echo "Erreur : Le répertoire thumbnails n'a pas pu être créé."
  exit 1
fi

# Vérifier que la miniature a bien été téléchargée dans le répertoire 'thumbnails'
echo "Fichiers dans thumbnails :"
ls -l thumbnails

# Extraire l'ID de la vidéo à partir de l'URL
URL=$1
VIDEO_ID=$(echo $URL | sed -E 's/.*(v=|\/)([a-zA-Z0-9_-]+).*/\2/')

# Vérifier si l'ID de la vidéo est bien extrait
if [ -z "$VIDEO_ID" ]; then
  echo "Erreur : Impossible d'extraire l'ID de la vidéo."
  exit 1
fi

# Télécharger la miniature en haute définition
curl -s -o "thumbnails/${VIDEO_ID}_thumbnail.jpg" "https://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"


# Vérifier si le téléchargement a réussi
if [ $? -eq 0 ]; then
  echo "Miniature téléchargée avec succès : $OUTPUT_FILE"
else
  echo "Erreur lors du téléchargement de la miniature."
  exit 1
fi