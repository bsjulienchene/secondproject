# Installation du Composant LaTeX

## Prérequis système

- Ubuntu 18.04 ou supérieur
- Docker installé et fonctionnel
- Droits sudo pour Docker

## Installation de Docker (si nécessaire)

```bash
# Mise à jour des paquets
sudo apt update

# Installation de Docker
sudo apt install docker.io

# Démarrage du service Docker
sudo systemctl start docker
sudo systemctl enable docker

# Ajout de l'utilisateur au groupe docker (optionnel)
sudo usermod -aG docker $USER
# Redémarrer la session pour appliquer les changements
```

## Installation du composant

1. Naviguer vers le dossier latex du projet
```bash
cd /chemin/vers/projet/latex
```

2. Construire l'image Docker
```bash
sudo docker build -t latex2img .
```

3. Tester l'installation
```bash
./tex2img.sh -i test_emc2.tex -o test_output.png
```

## Vérification

Après installation, vous devriez pouvoir:
- Exécuter `./tex2img.sh -i test_emc2.tex -o test.png`
- Voir l'image générée `test.png` contenant la formule E=mc²

## Dépannage

### Erreur "docker: command not found"
- Installer Docker selon les instructions ci-dessus

### Erreur "permission denied"
- Vérifier que l'utilisateur a les droits sudo
- Ou ajouter l'utilisateur au groupe docker

### Erreur "LaTeX compilation failed"
- Vérifier la syntaxe du fichier LaTeX
- Consulter les logs Docker pour plus de détails