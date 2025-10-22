# Composant Audio pour Vidéos Éducatives

Ce composant permet de générer des fichiers audio à partir de texte en utilisant la synthèse vocale Microsoft Edge TTS. Il fait partie d'un projet plus large visant à créer des vidéos éducatives avec du contenu LaTeX et de la voix synthétisée.

## Fonctionnalités

- Synthèse vocale de haute qualité avec Microsoft Edge TTS
- Support de plusieurs voix (française par défaut)
- Containerisation complète avec Docker
- Interface en ligne de commande simple

## Utilisation

### Syntaxe de base

```bash
./speak.sh "texte à lire" fichier_sortie.mp3
```

### Exemple avec voix par défaut (français)

```bash
./speak.sh "Bonjour les enfants" bonjour.mp3
```

### Exemple avec une voix spécifique

```bash
./speak.sh "Hello children" hello.mp3 en-GB-RyanNeural
```

### Voix disponibles

Quelques voix couramment utilisées :
- `fr-FR-HenriNeural` (français, homme, par défaut)
- `fr-FR-DeniseNeural` (français, femme)
- `en-GB-RyanNeural` (anglais britannique, homme)
- `en-US-JennyNeural` (anglais américain, femme)

Pour une liste complète des voix, consultez la [documentation d'Edge TTS](https://github.com/rany2/edge-tts).

## Structure des fichiers

- `speak.py` : Script Python principal pour la synthèse vocale
- `speak.sh` : Script shell pour la gestion Docker
- `Dockerfile` : Configuration du conteneur Docker

## Prérequis

- Docker
- Droits sudo (pour la gestion des conteneurs)