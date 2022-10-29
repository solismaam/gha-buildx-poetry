#!/bin/bash

poetry install --with publish
.venv/bin/semantic-release --help