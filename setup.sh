#!/bin/bash

# File: setup.sh
# Author: Landon Bouma (landonb &#x40; retrosoft &#x2E; com)
# Last Modified: 2016.03.24
# Project Page: https://github.com/landonb/dubsacks_vim
# License: GPLv3

# Use .vimrc.bundle if you checked out dubsacks to ~/.vim/bundle.
DUBS_VIMRC="./bundle/dubs_all/.vimrc.bundle"
# Use .vimrc.bundle if you develop dubsacks from ~/.vim/bundle_.
#DUBS_VIMRC="./bundle/dubs_all/.vimrc.bundle_"

# Exit on error.
set -e

# Complain if this script is not run from the base of Dubsacks Vim.
if [[ ! -e ${DUBS_VIMRC} ]]; then
  echo "ERROR: Not there: ${DUBS_VIMRC}."
  exit 1
fi

# Complain if user's .vimrc already exists.
if [[ -e ~/.vimrc ]]; then
  echo "ERROR: Your .vimrc already exists."
  echo
  echo "This script is too basic to help you interactively."
  echo "It'll give you advice, though. Try one of the following:"
  echo
  echo "1. Compare the two files and merge whatever you want"
  echo "   to keep into the new Vim startup file."
  echo
  echo "   meld ${DUBS_VIMRC} ~/.vimrc"
  echo
  echo "2. Or, remove ~/.vimrc and rerun this script."
  echo
  echo "3. Or, create the symlink forcefully."
  echo
  echo "   /bin/ls -rsf ${DUBS_VIMRC} ~/.vimrc"
  echo
  echo "4. Or, move your .vimrc to a plugin/ directory, renaming"
  echo "   it appropriately, and making it work like a normal plugin."
  echo
  exit 1
fi

# Link to our vimrc.
/bin/ln --relative --symbolic ${DUBS_VIMRC} ~/.vimrc

# Setup Pathogen.
if [[ ! -e ~/.vim/autoload/pathogen.vim ]]; then
  mkdir -p ~/.vim/autoload
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

cd ./bundle

# Note that `git submodule foreach git pull` dies if it needs a
# branch name, but update --init --remote seems to always work.
git submodule update --init --remote

