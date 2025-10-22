# Guide d'Installation

Ce guide vous aidera à installer et configurer le composant audio sur un système Ubuntu 18.04 ou supérieur.

## Prérequis système

1. Installation de Docker :
```bash
# Mise à jour du système
sudo apt-get update
sudo apt-get upgrade -y

# Installation des paquets requis
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Ajout de la clé GPG de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Ajout du dépôt Docker
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Installation de Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
```

2. Configuration des permissions Docker (optionnel mais recommandé) :
```bash
# Ajout de l'utilisateur au groupe docker
sudo usermod -aG docker $USER

# Déconnectez-vous et reconnectez-vous pour que les changements prennent effet
```

## Installation du composant

1. Clonez le dépôt (si ce n'est pas déjà fait)
2. Naviguez vers le dossier audio :
```bash
cd audio
```

3. Rendez le script exécutable :
```bash
chmod +x speak.sh
```

## Test de l'installation

Pour vérifier que tout fonctionne correctement :

```bash
./speak.sh "Ceci est un test" test.mp3
```

## Résolution des problèmes courants

### Erreur de permission Docker

Si vous voyez des erreurs de permission avec Docker, soit :
1. Utilisez `sudo` devant les commandes Docker
2. Ajoutez votre utilisateur au groupe docker comme indiqué plus haut

### Erreur de création de fichier

Si le script ne peut pas créer le fichier de sortie, vérifiez :
1. Que vous avez les droits d'écriture dans le dossier cible
2. Que le dossier parent existe
3. Qu'il y a suffisamment d'espace disque

### Problèmes de réseau

Le composant nécessite une connexion Internet pour :
1. La première construction de l'image Docker (téléchargement des paquets)
2. L'utilisation du service Edge TTS

En cas de problème réseau, vérifiez votre connexion Internet et les paramètres de proxy si nécessaire.