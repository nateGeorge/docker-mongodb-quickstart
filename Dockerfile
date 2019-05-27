FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install gnupg ca-certificates -y #gnupg2 gnupg1 -y

# install MongoDB CE
# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get update
RUN apt-get install -y mongodb-org


# 'service mongod start' wouldn't work for some reason, but this does
# https://askubuntu.com/a/1126592/458247
ENTRYPOINT mongod --fork -f /etc/mongod.conf && /bin/bash
