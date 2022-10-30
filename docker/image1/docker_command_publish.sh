#!/bin/bash
git config user.name github-actions
git config user.email mikko.solismaa@spatineo.com
poetry install --only publish
poetry run semantic-release --verbosity=INFO publish