#!/bin/bash

poetry install --only publish
.venv/bin/semantic-release semantic-release --verbosity=INFO publish