#!/usr/bin/env bash
# vim:tw=0:ts=2:sw=2:et:norl:ft=bash
# Author: Landon Bouma <https://tallybark.com/>
# Project: https://github.com/landonb/dubs-vim#✌️
# License: GPLv3

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

EVIM_INSTALL_TEMPLATE="${EVIM_INSTALL_TEMPLATE:-${HOME}/.vim/doc/INSTALL.m4.md}"
EVIM_REAME_TEMPLATE_MD="${EVIM_REAME_TEMPLATE_MD:-${HOME}/.vim/doc/INSTALL-README.m4.md}"
EVIM_REAME_TEMPLATE_RST="${EVIM_REAME_TEMPLATE_RST:-${HOME}/.vim/doc/INSTALL-README.m4.rst}"

EVIM_INSTALL_TARGET="${EVIM_INSTALL_TARGET:-INSTALL.md}"
EVIM_README_MD_TARGET="${EVIM_README_MD_TARGET:-README.md}"
EVIM_README_RST_TARGET="${EVIM_README_RST_TARGET:-README.rst}"

# ***

gm4 () {
  command -v gm4 || command -v m4
}

must_locate_templates () {
  must_locate_template "${EVIM_INSTALL_TEMPLATE}"
  must_locate_template "${EVIM_REAME_TEMPLATE_MD}"
  must_locate_template "${EVIM_REAME_TEMPLATE_RST}"
}

must_locate_template () {
  local template="$1"

  if [ -s "${template}" ]; then

    return
  fi

  >&2 echo "GAFFE: Template not found at ${template}"

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

# ***

generate_document () {
  local template="$1"

  command $(gm4) \
    --define=ORG_NAME=${EVIM_ORG_NAME:-embrace-vim} \
    \
    --define=PLUG_NAME=$(basename -- "$(pwd)") \
    \
    --prefix-builtins \
    <( \
        printf "m4_changecom()"; \
        printf "m4_changequote(\`[[[', \`]]]')"; \
        cat "${template}"; \
    )
}

generate_install_readme () {
  generate_document "${EVIM_INSTALL_TEMPLATE}" > "${EVIM_INSTALL_TARGET}"

  echo "Created new readme ${EVIM_INSTALL_TARGET}"
}

# ***

append_readme_sections () {
  append_readme_sections_from_template "${EVIM_REAME_TEMPLATE_MD}" "${EVIM_README_MD_TARGET}"
  append_readme_sections_from_template "${EVIM_REAME_TEMPLATE_RST}" "${EVIM_README_RST_TARGET}"
}

append_readme_sections_from_template () {
  local template="$1"
  local target="$2"

  if ! [ -f "${target}" ]; then

    return
  fi

  generate_document "${template}" >> "${target}"

  echo "ALERT: Please clean up changes to ${target}"
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

main () {
  set -e

  must_locate_templates

  must_be_repo_root

  must_not_clobber

  generate_install_readme

  # For convenience, append short-n-sweet install section to existing
  # README file, though user will have to clean up.
  append_readme_sections
}

main "$@"

