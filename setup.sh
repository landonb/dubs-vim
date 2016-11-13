#!/bin/bash

# File: setup.sh
# Author: Landon Bouma (landonb &#x40; retrosoft &#x2E; com)
# Last Modified: 2016.11.13
# Project Page: https://github.com/landonb/dubsacks_vim
# License: GPLv3

# Exit on error.
set -e

# Use .vimrc.bundle if you checked out dubsacks to ~/.vim/bundle.
DUBS_VIMRC=".vim/bundle/dubs_all/.vimrc.bundle"
# Use .vimrc.bundle if you develop dubsacks from ~/.vim/bundle_.
# NOTE: This is setup from private ~/.curly via chase_and_face.
#DUBS_VIMRC=".vim/bundle/dubs_all/.vimrc.bundle_"

pushd ${HOME} &> /dev/null

if [[ ! -e ${DUBS_VIMRC} ]]; then
  echo "ERROR: Not there: ${DUBS_VIMRC}."
  exit 1
fi

# Complain if user's .vimrc already exists.
if [[ -e ${HOME}/.vimrc && ! -h ${HOME}/.vimrc ]]; then
  echo "ERROR: Your .vimrc already exists."
  echo
  echo "Remove it to continue."
  echo
  echo "   /bin/rm ${HOME}/.vimrc"
  exit 1
fi

# Link to our vimrc.
# --symbolic --relative --force
/bin/ln -sf ${DUBS_VIMRC} .vimrc

popd &> /dev/null

# Setup Pathogen.
# NOTE: Not necessary. It's checked into git.
if [[ ! -e ${HOME}/.vim/autoload/pathogen.vim ]]; then
  mkdir -p ${HOME}/.vim/autoload
  curl -LSso ${HOME}/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Note that `git submodule foreach git pull` dies if it needs a
# branch name, but update --init --remote seems to always work.
#
# FIXME/MAYBE: Run this command once a day or at some interval...
pushd ${HOME}/.vim/bundle
git submodule update --init --remote
popd &> /dev/null

