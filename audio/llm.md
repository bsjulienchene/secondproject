Historique des prompts pour générer ce projet :

1. Développement initial du composant audio :
```
Objectif : Créer un composant Docker pour la synthèse vocale avec edge-tts
Points clés abordés :
- Création du script Python speak.py
- Configuration du Dockerfile
- Création du script shell speak.sh
- Tests et debugging
```

2. Documentation :
```
Objectif : Documenter l'installation et l'utilisation du composant
Points clés abordés :
- Création du README.md avec les instructions d'utilisation
- Création du INSTALL.md avec les étapes d'installation détaillées
- Documentation des problèmes courants et leurs solutions
```

Pour continuer le développement, les prochaines étapes suggérées sont :

1. Composant LaTeX :
```
Objectif : Créer un composant Docker pour générer des images à partir de LaTeX
Points à aborder :
- Installation de la stack LaTeX dans un conteneur
- Script de conversion LaTeX vers PNG/SVG
- Interface en ligne de commande similaire à speak.sh
```

2. Composant d'assemblage vidéo :
```
Objectif : Créer un composant pour assembler images et audio en vidéo
Points à aborder :
- Utilisation de ffmpeg dans un conteneur
- Synchronisation audio/vidéo
- Format de configuration pour le timing
```