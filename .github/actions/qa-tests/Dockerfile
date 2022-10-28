FROM python:3.9.9-slim-bullseye

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt update \
    && apt install --assume-yes --quiet gdal-bin \
    && apt --assume-yes --quiet autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["docker-entrypoint.sh"]