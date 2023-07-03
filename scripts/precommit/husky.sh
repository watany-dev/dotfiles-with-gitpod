#!/bin/bash

# move work dirctory
subdir=$(find /workspaces -maxdepth 1 -mindepth 1 -type d | head -n 1)
if [ -d "$subdir" ]; then
    cd "$subdir"
    echo "Moved to: $(pwd)"
else
    echo "No subdirectory found in /workspaces"
fi

# Setting husky
npx husky-init && npm install
echo '#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

gitleaks protect --staged' > .husky/pre-commit
chmod +x .husky/pre-commit 
