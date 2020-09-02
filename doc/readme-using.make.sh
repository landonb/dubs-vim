#!/usr/bin/env bash

build_readme_using () {
  cd "${HOME}/.vim/doc"

  local target=../README-USING.rst

  cat readme-using.pt1.rst > ${target}

  local startd="${HOME}/.vim/pack/landonb/start"

  cat ${startd}/dubs_after_dark/README.rst >> ${target}
  cat ${startd}/dubs_appearance/README.rst >> ${target}
  cat ${startd}/dubs_buffer_fun/README.rst >> ${target}
  cat ${startd}/dubs_edit_juice/README.rst >> ${target}
  cat ${startd}/dubs_file_finder/README.rst >> ${target}
  cat ${startd}/dubs_ftype_mess/README.rst >> ${target}
  cat ${startd}/dubs_grep_steady/README.rst >> ${target}
  cat ${startd}/dubs_html_entities/README.rst >> ${target}
  cat ${startd}/dubs_mescaline/README.rst >> ${target}
  cat ${startd}/dubs_project_tray/README.rst >> ${target}
  cat ${startd}/dubs_quickfix_wrap/README.rst >> ${target}
  cat ${startd}/dubs_rest_fold/README.rst >> ${target}
  cat ${startd}/dubs_style_guard/README.rst >> ${target}
  cat ${startd}/dubs_syntastic_wrap/README.rst >> ${target}
  cat ${startd}/dubs_toggle_textwrap/README.rst >> ${target}
  cat ${startd}/dubs_web_hatch/README.rst >> ${target}

  # Forked repos (not their original):
  #  cat ${startd}/ansible-vim/README.md >> ${target}
  #  # DEPRECATED: cat ${startd}/vim-jsx/README.md >> ${target}
  #  cat ${startd}/vim-markdown/README.md >> ${target}
  #  cat ${startd}/vim-surround/README.markdown >> ${target}
  #  cat ${startd}/vim-tmux-navigator/README.markdown >> ${target}

  cat readme-using.pt2.rst >> ${target}
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

main () {
  local before_cd="$(pwd -L)"

  build_readme_using

  cd "${before_cd}"
}

main "$@"

