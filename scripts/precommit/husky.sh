#!/bin/bash

# Setting husky
repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root"

npx husky-init && npm install
echo '#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

gitleaks protect --staged' > .husky/pre-commit
chmod +x .husky/pre-commit 
