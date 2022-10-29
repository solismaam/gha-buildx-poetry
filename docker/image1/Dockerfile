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
ENV APP=${HOME}/app
ENV PATH="${HOME}/.local/bin:$PATH"

RUN mkdir ${APP}
WORKDIR ${APP}

FROM app as app_build
RUN curl -sSL https://install.python-poetry.org | python3 -
RUN poetry config virtualenvs.in-project true
COPY --chown=${USER}:${USER} . ${APP}
RUN poetry build

FROM app_build AS app_publish
COPY docker/image1/app_publish.sh ${HOME}/.local/bin/
CMD ["app_publish.sh"]

FROM app AS app_release
COPY --from=app_build ${APP}/dist ${APP}/dist

FROM app_build AS app_test
COPY docker/image1/app_test.sh ${HOME}/.local/bin/
CMD ["app_test.sh"]

FROM app_${APP_TYPE} as app_final
