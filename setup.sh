#!/bin/bash

TMPDIR=$(mktemp -d)

CURRENT=$PWD

cd $TMPDIR

for script in ~/.dotfiles/scripts/common/*; do
# for script in ~/.dotfiles/scripts/*; do
  bash "$script"
done

cd $CURRENT

rm -rf $TMPDIR

# for script in ~/.dotfiles/scripts/precommit/*; do
#   bash "$script"
# done
