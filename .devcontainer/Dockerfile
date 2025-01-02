FROM ubuntu:latest
LABEL org.opencontainers.image.authors="Ugo Pattacini <ugo.pattacini@iit.it>"

# Increment this variable to force Docker to build the image for the sections below w/o relying on cache
ENV INVALIDATE_DOCKER_CACHE_ALL=0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y sudo apt-utils bash-completion wget ruby git magic-wormhole \
                   python3 python3-pip python3-setuptools python3-wheel

RUN pip install --break-system-packages mkdocs && \
    wget https://raw.githubusercontent.com/icub-tech-iit/documentation/master/mkdocs.yml && \
    pip install --break-system-packages $(mkdocs get-deps) && \
    rm mkdocs.yml

RUN gem install yaml

RUN rm -Rf /var/lib/apt/lists/*

RUN useradd -l -u 33333 -G sudo -md /home/codespace -s /bin/bash -p codespace codespace && \
    sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

EXPOSE 8000

WORKDIR /workspaces
CMD ["bash"]
