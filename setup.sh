#!/bin/bash

# Author: Landon Bouma (landonb &#x40; retrosoft &#x2E; com)
# Project Page: https://github.com/landonb/dubs-vim
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
    echo "   /bin/rm ${HOME}/.vimrc"
    exit 1
  fi

  # Link to our vimrc.
  # --symbolic --relative --force
  /bin/ln -sf ${DUBS_VIMRC} .vimrc

  cd "${before_cd}"
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

# Compile Command-T extension.
build_command_t_ext () {
  local before_cd="$(pwd -L)"
  cd "${HOME}"

  cd "${HOME}/.vim/pack/wincent/start/command-t/ruby/command-t/ext/command-t"

  # FIXME/MEH: Making command-t should probably happen any time submodule is
  #            updated... could add to myrepos fetch-and-ff task.
  if [ ! -e ext.so ]; then
    echo "Making command-t..."
    if command -v chruby > /dev/null; then
      chruby system
    fi
    ruby extconf.rb
    make
  else
    echo "Skipping command-t"
  fi

  cd "${before_cd}"
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

main () {
  # Exit on error.
  set -e

  create_user_home_vimrc_symlink

  build_command_t_ext
}

main "$@"

