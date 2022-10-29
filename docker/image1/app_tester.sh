#!/bin/bash -e

echo "Running tester..."
poetry install --with test
poetry shell pytest