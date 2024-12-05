#!/usr/bin/env bash

# Author: Landon Bouma (landonb &#x40; retrosoft &#x2E; com)
# Project: https://github.com/landonb/dubs-vim#✌
# License: GPLv3

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

DUBS_VIMRC=".vim/.vimrc"

create_user_home_vimrc_symlink () {
  local before_cd="$(pwd -L)"
  cd "${HOME}"

  if [ ! -e ${DUBS_VIMRC} ]; then
    echo "ERROR: Not there: ${DUBS_VIMRC}."
    exit 1
  fi

  # Complain if user's .vimrc already exists.
  if [ -e ${HOME}/.vimrc ] && ! [ -h ${HOME}/.vimrc ]; then
    echo "ERROR: Your .vimrc already exists."
    echo
    echo "Remove it to continue."
    echo
    echo "   command rm \"${HOME}/.vimrc\""
    exit 1
  fi

  # Link to our vimrc.
  # --symbolic --relative --force
  command ln -sf -- "${DUBS_VIMRC}" ".vimrc"

  cd "${before_cd}"
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

main () {
  # Exit on error.
  set -e

  create_user_home_vimrc_symlink
}

main "$@"

