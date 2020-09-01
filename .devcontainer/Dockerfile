FROM mcr.microsoft.com/vscode/devcontainers/base:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y python3-wheel python3-setuptools && \
    rm -Rf /var/lib/apt/lists/*
    
RUN pip3 install mkdocs mkdocs-material pymdown-extensions
