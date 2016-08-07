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

RUN mkdir -p /var/src/track/client_deps
WORKDIR /var/src/track

# COPY src/server/requirements.txt /var/src/track/server/
# RUN cd server && \
#     pip3 install -vr requirements.txt

COPY src/client/package.json /var/src/track/client_deps/
RUN cd client_deps && \
    npm install

COPY src/server /var/src/track/server/
COPY src/client /var/src/track/client/

# Build/transpile web resources
RUN ./client/node_modules/gulp/bin/gulp.js build
