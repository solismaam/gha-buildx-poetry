#!/bin/bash

poetry install --only publish
.venv/bin/semantic-release --verbosity=INFO publish