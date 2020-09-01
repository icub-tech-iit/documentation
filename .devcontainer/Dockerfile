FROM mcr.microsoft.com/vscode/devcontainers/base:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y python3-wheel python3-setuptools
    
RUN pip3 install mkdocs mkdocs-material pymdown-extensions
