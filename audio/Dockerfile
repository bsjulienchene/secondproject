FROM ubuntu:24.04

# Installation des dépendances minimales
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Création et activation d'un environnement virtuel
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Installation de edge-tts dans l'environnement virtuel
RUN pip install edge-tts

# Création du dossier de travail
WORKDIR /app

# Copie du script
COPY speak.py .
RUN chmod +x speak.py

ENTRYPOINT ["python3", "speak.py"]