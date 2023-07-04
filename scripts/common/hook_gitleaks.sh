#!/bin/bash

# move work dirctory
TARGET_DIR='/workspace'
subdir=$(find "$TARGET_DIR" -maxdepth 1 -mindepth 1 -type d ! -name ".*" | head -n 1)
if [ -d "$subdir" ]; then
    cd "$subdir"
    echo "Moved to: $(pwd)"
else
    echo "No subdirectory found in $TARGET_DIR"
fi

# Install gitleaks
brew install gitleaks

# Setting pre-commit
pip install --upgrade pip
pip install pre-commit
echo 'repos:
  - repo: https://github.com/gitleaks/gitleaks
    rev: v8.17.0
    hooks:
      - id: gitleaks' > .pre-commit-config.yaml
pre-commit autoupdate
pre-commit install
