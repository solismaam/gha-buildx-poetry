#!/bin/bash

poetry install --no-root --with publish
.venv/bin/semantic-release --help