#!/bin/bash

# Serrubf Gitleaks
sudo cp /home/gitpod/.dotfiles/bin/gitleaks /usr/local/bin/
sudo chmod +x /usr/local/bin/gitleaks 

# Setting husky
npx husky-init && npm install
echo '#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

gitleaks protect --staged' > .husky/pre-commit
chmod +x .husky/pre-commit 
