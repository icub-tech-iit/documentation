FROM ubuntu:latest
LABEL org.opencontainers.image.authors="Ugo Pattacini <ugo.pattacini@iit.it>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y sudo apt-utils bash-completion wget ruby git \
                   python3 python3-pip python3-setuptools python3-wheel

RUN pip3 install mkdocs mkdocs-material pymdown-extensions

RUN gem install yaml

RUN rm -Rf /var/lib/apt/lists/*

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod && \
    sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

EXPOSE 8000

WORKDIR /workspace
CMD ["bash"]
