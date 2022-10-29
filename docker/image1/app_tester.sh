#!/bin/bash -e

echo "Running tester..."
poetry install --with test
.venv/bin/pytest