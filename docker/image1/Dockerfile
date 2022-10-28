FROM python:3.9.9-slim-bullseye

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt update \
    && apt install --assume-yes --quiet curl gdal-bin \
    && apt --assume-yes --quiet autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

ARG USER=user
ARG USER_UID=1000
ARG USER_GID=1000

RUN addgroup --gid ${USER_GID} ${USER}
RUN adduser --disabled-password --gecos "" --gid ${USER_GID} --shell /bin/bash --uid ${USER_UID} $USER

USER $USER

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/home/${USER}/.local/bin:$PATH"

RUN poetry config virtualenvs.in-project true