FROM ubuntu:latest
LABEL maintainer="ugo.pattacini@iit.it"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y python3-wheel python3-setuptools && \
    rm -Rf /var/lib/apt/lists/*
    
RUN pip3 install mkdocs mkdocs-material pymdown-extensions
