FROM ubuntu:16.04

MAINTAINER Alex Fraser <alex@phatcore.com>
EXPOSE 80

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y \
        nodejs \
        npm \
        python3 \
        python3-dev \
        python3-pip \
        python3-psycopg2 \
        --no-install-recommends \
    && pip3 install -vU pip setuptools \
    && npm install -g ionic@beta \
    && which node || apt-get install -y nodejs-legacy
    # rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/src/track/client_deps
WORKDIR /var/src/track

COPY src/client/package.json /var/src/track/client_deps/
RUN cd client_deps \
    && npm install

COPY src/server/requirements.txt /var/src/track/server/
RUN cd server \
    && pip3 install -vr requirements.txt

COPY src/client /var/src/track/client/
COPY src/server /var/src/track/server/

# Build/transpile web resources
RUN cd client \
    && ./node_modules/gulp/bin/gulp.js build

ENV PYTHONPATH=/var/src/track/server \
    DB_URL=postgresql://postgres:postgres@postgres/postgres

CMD ["python3", "-m", "app"]
