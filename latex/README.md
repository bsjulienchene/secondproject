# Composant LaTeX pour Vidéos Éducatives

Ce composant convertit du code LaTeX en images (PNG/JPG/SVG). Il fait partie d'un projet plus large visant à créer des vidéos éducatives avec du contenu LaTeX et de la voix synthétisée.

## Fonctionnalités

- Compilation LaTeX vers PDF puis conversion en image
- Support PNG, JPG, SVG
- Containerisation complète avec Docker
- Interface en ligne de commande simple

## Utilisation

### Syntaxe de base

```bash
./tex2img.sh -i input.tex -o output.png
```

### Exemples

```bash
# PNG par défaut (300 DPI)
./tex2img.sh -i emc2.tex -o emc2.png

# Haute résolution
./tex2img.sh -i formula.tex -o formula.png --dpi 600

# Format SVG (vectoriel)
./tex2img.sh -i diagram.tex -o diagram.svg
```

## Structure des fichiers

- `latex2img.sh` : Script principal de conversion
- `tex2img.sh` : Script shell pour la gestion Docker
- `Dockerfile` : Configuration du conteneur Docker
- `test_emc2.tex` : Exemple de fichier LaTeX

## Prérequis

- Docker
- Droits sudo (pour la gestion des conteneurs)