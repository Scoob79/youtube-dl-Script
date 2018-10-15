#!/bin/bash

if [ "$1" == "--help" ];then
  echo "Ce script permet de télécharger des vidéos sur youtube de façon très simple.
  pour cela vous devez avoir préalablement installé youtube-dl
  
  sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
  sudo chmod a+rx /usr/local/bin/youtube-dl
  
  Pour utiliser ce script vous avez deux solutions :
    - ./youtube.sh ensuite entrez directement l'URL ou le code de la vidéo
    - ./youtube.sh https://www.youtube.com/watch?v=xxxxxxxxxxx ou ./youtube xxxxxxxxxxx"
  exit 1
fi

cd /media/www

if [ "$1" == "" ];then # Si le paramètre n'est pas passer dans la commande alors on pose la question
  echo Code de la vidéo ou URL :
  read URL

  var1=$(echo $URL | grep "https://www.youtube.com/watch?v")
  if [ "$var1" == "" ]; then
    URLC="https://www.youtube.com/watch?v=$URL"
  else
    URLC=$URL
  fi
else # Sinon on le récupère pour créer URLC
  var1=$(echo $1 | grep "https://www.youtube.com/watch?v")
  if [ "$var1" == "" ]; then
    URLC="https://www.youtube.com/watch?v=$1"
  else
    URLC=$1
  fi
fi

ret=$(youtube-dl -F $URLC | tail -n 1)
ret2=$(echo $ret | cut -d' ' -f1)

echo Téléchargement en cours, merci de patienter.

ret=$(youtube-dl $URLC -f $ret2 -o "/media/www/%(title)s.%(ext)s" --download-archive /media/www/youtube-dl-archive | tail -n 1)
echo $ret

ret3=$(df -h | tail -n 1)

var1=$(echo $ret | grep "100%")

if [ "$var1" != "" ];then
  echo -e "\033[36m$ret3\033[0m"
  echo -e "\033[32mTéléchargement réussi\033[0m"
else
  echo -e "\033[31mTéléchargement échoué\033[0m"
fi
