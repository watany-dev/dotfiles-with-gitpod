#!/bin/bash

# move work dirctory
subdir=$(find /workspaces -maxdepth 1 -mindepth 1 -type d | head -n 1)
if [ -d "$subdir" ]; then
    cd "$subdir"
    echo "Moved to: $(pwd)"
else
    echo "No subdirectory found in /workspaces"
fi

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
