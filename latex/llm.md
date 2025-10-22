# LLM Prompts - Composant LaTeX

## État actuel
Composant LaTeX fonctionnel pour conversion LaTeX vers images.

## Architecture
- `latex2img.sh` : Script principal de conversion LaTeX→PDF→Image
- `tex2img.sh` : Wrapper Docker pour isolation
- `Dockerfile` : Environnement LaTeX complet (texlive + imagemagick + pdf2svg)
- Support PNG/JPG/SVG avec contrôle DPI

## Prochaines étapes suggérées
1. Créer composant assemblage vidéo (dossier `video/`)
2. Script pour synchroniser images + audio avec timing
3. Améliorer LaTeX avec marquage pour narration

## Prompts pour continuation

### Créer composant vidéo
"Créer le troisième composant selon contexte.md : assemblage vidéo qui combine images LaTeX et fichiers audio avec timing. Utiliser ffmpeg dockerisé, interface simple comme les autres composants."

### Améliorer LaTeX avec timing
"Ajouter support markup dans fichiers LaTeX pour indiquer timing narration, pauses, synchronisation avec audio. Exemple : commentaires spéciaux pour marquer les segments."

### Tests d'intégration
"Créer pipeline complet : LaTeX→Image + Texte→Audio + Assemblage→Vidéo. Script d'exemple bout-en-bout avec fichier de démonstration."