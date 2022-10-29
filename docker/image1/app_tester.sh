#!/bin/bash -e

echo "Running tester..."
poetry lock --no-update
poetry install --with test
poetry shell pytest