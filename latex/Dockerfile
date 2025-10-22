FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    imagemagick \
    pdf2svg \
    && rm -rf /var/lib/apt/lists/*

COPY latex2img.sh /usr/local/bin/latex2img.sh
RUN chmod +x /usr/local/bin/latex2img.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/latex2img.sh"]