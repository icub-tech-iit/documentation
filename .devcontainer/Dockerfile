FROM ubuntu:latest
LABEL org.opencontainers.image.authors="Ugo Pattacini <ugo.pattacini@iit.it>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y python3 python3-pip python3-setuptools python3-wheel wget ruby git

RUN pip3 install mkdocs mkdocs-material pymdown-extensions

RUN gem install yaml

RUN rm -Rf /var/lib/apt/lists/*

EXPOSE 8000
