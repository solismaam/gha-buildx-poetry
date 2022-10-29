#!/bin/bash -e

poetry install --with test
.venv/bin/pytest
.venv/bin/black app
.venv/bin/flake8 app
.venv/bin/isort app