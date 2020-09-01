ARG VARIANT=focal
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends python3-wheel python3-setuptools
    
RUN pip3 install mkdocs mkdocs-material pymdown-extensions
