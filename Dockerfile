FROM ubuntu:16.04

MAINTAINER Alex Fraser <alex@phatcore.com>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y \
        nodejs \
        npm \
        python3 \
        python3-dev \
        python3-pip \
        --no-install-recommends && \
    pip3 install -vU pip setuptools && \
    npm install -g ionic@beta && \
    which node || apt-get install -y nodejs-legacy
    # rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/src/track/{server,client}
WORKDIR /var/src/track

# COPY src/server/requirements.txt /var/src/track/server/
# RUN pip3 install -vr server/requirements.txt
#
# COPY package.conf /var/src/track/package.json
# RUN npm
# #
# # COPY src/ /var/src/track/
