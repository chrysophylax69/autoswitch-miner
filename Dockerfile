FROM ubuntu:latest
MAINTAINER Felix Brucker

RUN echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/zz-local-tame

RUN apt-get update && apt-get upgrade -y && apt-get install -y nodejs nodejs-legacy npm libjansson-dev libcurl4-gnutls-dev

ADD . /autoswitch-miner/

WORKDIR /autoswitch-miner

RUN npm install

CMD ["npm", "start"]