#!/bin/bash -e

poetry install --with test
.venv/bin/pytest