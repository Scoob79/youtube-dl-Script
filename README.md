# youtube-dl-Script
Ce script permet de télécharger des vidéos sur youtube de façon très simple.

  pour cela vous devez avoir préalablement installé youtube-dl
  
    sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
  
  Pour utiliser ce script vous avez deux solutions :
    
    ./youtube.sh ensuite entrez directement l'URL ou le code de la vidéo
    ./youtube.sh https://www.youtube.com/watch?v=xxxxxxxxxxx ou ./youtube xxxxxxxxxxx

# Installation 

Copier ce script dans le répertoire de votre choix en utilisant la commande suivante

    git clone https://github.com/Scoob79/youtube-dl-Script.git
    cd youtube-dl-Script/
    chmod u+x ./youtube.sh

Si vous n'a vez pas git :

    sudo apt-get install git

# Petit plus

Si vous le souhaitez en chageant la ligne 36 comme suit :

    ret=$(youtube-dl $URLC -f $ret2 -o "/media/www/%(title)s.%(ext)s" | tail -n 1)

Vous pouvez modifier le repértoire où vous souhaitez stocker le vidéo, de plus rien ne vous empêche de rajouter toutes les options que vous souhaitez.
