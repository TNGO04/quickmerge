FROM --platform=linux/amd64 ubuntu:22.04 as builder

RUN apt-get update && \
    apt-get install -y vim less file locate && echo 'alias locate="updatedb && locate"' >> ~/.bashrc && \
    apt-get install -y build-essential

COPY . /repo
WORKDIR /repo
RUN chmod +x make_merger.sh
RUN ./make_merger.sh
