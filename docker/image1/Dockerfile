ARG APP_TYPE

FROM python:3.9.9-slim-bullseye AS app

ARG USER=runner
ARG USER_UID=1000
ARG USER_GID=1000

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt update \
    && apt install --assume-yes --quiet curl gdal-bin \
    && apt --assume-yes --quiet autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN addgroup --gid ${USER_GID} ${USER}
RUN adduser --disabled-password --gecos Runner --gid ${USER_GID} --shell /bin/bash --uid ${USER_UID} $USER

USER ${USER}

ENV USER=${USER}
ENV HOME="/home/${USER}"
ENV PATH="${HOME}/.local/bin:$PATH"

WORKDIR /home/${USER}

FROM app as app_builder

RUN curl -sSL https://install.python-poetry.org | python3 -

RUN poetry config virtualenvs.in-project true

COPY --chown=${USER}:${USER} . ${HOME}

RUN poetry build

FROM app_builder AS app_publisher

CMD ["app_publisher.sh"]

FROM app AS app_release

COPY --from=app_builder ${HOME}/dist ${HOME}/dist

FROM app_builder AS app_tester

COPY docker/image1/app_tester.sh ${HOME}/.local/bin/

CMD ["app_tester.sh"]

FROM app_${APP_TYPE} as app_final
