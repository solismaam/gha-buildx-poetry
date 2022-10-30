#!/bin/bash
git config user.name ${GITHUB_ACTOR:?}
git config user.email mikko.solismaa@spatineo.com
export GH_TOKEN=${GITHUB_TOKEN:?}
poetry install --only publish
poetry run semantic-release --verbosity=INFO publish