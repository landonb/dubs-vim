#!/usr/bin/env bash
# vim:tw=0:ts=2:sw=2:et:norl:ft=bash
# Author: Landon Bouma <https://tallybark.com/>
# Project: https://github.com/landonb/dubs-vim#✌️
# License: GPLv3

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

EVIM_INSTALL_TEMPLATE="${EVIM_INSTALL_TEMPLATE:-${HOME}/.vim/doc/INSTALL.m4.md}"

EVIM_INSTALL_TARGET="INSTALL.md"

gm4 () {
  command -v gm4 || command -v m4
}

must_locate_template () {
  if [ -s "${EVIM_INSTALL_TEMPLATE}" ]; then

    return
  fi

  >&2 echo "GAFFE: Template not found at ${EVIM_INSTALL_TEMPLATE}"

  exit 1
}

must_be_repo_root () {
  if [ "$(git rev-parse --show-toplevel)" = "$(pwd -P)" ]; then

    return
  fi

  >&2 echo "GAFFE: Please run this from the root of your project"

  exit 1
}

must_not_clobber () {
  if ! [ -e "${EVIM_INSTALL_TARGET}" ]; then

    return
  fi

  >&2 echo "GAFFE: The target file already exists at ${EVIM_INSTALL_TARGET}"

  exit 1
}

generate_readme_install () {
  command $(gm4) \
    --define=ORG_NAME=${EVIM_ORG_NAME:-embrace-vim} \
    \
    --define=PLUG_NAME=$(basename -- "$(pwd)") \
    \
    --prefix-builtins \
    <( \
        printf "m4_changecom()"; \
        printf "m4_changequote(\`[[[', \`]]]')"; \
        cat "${EVIM_INSTALL_TEMPLATE}"; \
    ) \
    > "${EVIM_INSTALL_TARGET}"
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

main () {
  set -e

  must_locate_template

  must_be_repo_root

  must_not_clobber

  generate_readme_install
}

main "$@"

