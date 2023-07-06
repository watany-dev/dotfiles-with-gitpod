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
copy_prepared_gitleaks_binary() {
    echo "Copying the prepared gitleaks binary to a location in the PATH..."
    sudo cp /home/gitpod/.dotfiles/bin/gitleaks /usr/local/bin/gitleaks
    sudo chmod +x /usr/local/bin/gitleaks
    echo "Gitleaks binary copied to /usr/local/bin/gitleaks"
}

if command -v brew &> /dev/null; then
    echo "Installing gitleaks using Homebrew..."
    if ! brew install gitleaks; then
        copy_prepared_gitleaks_binary
    fi
else
    copy_prepared_gitleaks_binary
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
