#!/usr/bin/env bash

build_readme_using () {
  cd "${HOME}/.vim/doc"

  local target=../README-USING.rst

  cat readme-using.pt1.rst > ${target}

  local startd="${HOME}/.vim/pack/landonb/start"

  # PARITY: See directories under ~/.vim/pack/landonb/start

  # (forked) cat ${startd}/ansible-vim/README.md >> ${target}
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
  cat ${startd}/dubs_style_guard/README.rst >> ${target}
  cat ${startd}/dubs_syntastic_wrap/README.rst >> ${target}
  cat ${startd}/dubs_toggle_textwrap/README.rst >> ${target}
  cat ${startd}/dubs_web_hatch/README.rst >> ${target}
  # (not reST) cat ${startd}/vim-buffer-ring/README.md >> ${target}
  # (forked) cat ${startd}/vim-classic-taglist/README.rst >> ${target}
  cat ${startd}/vim-command-line-clock/README.rst >> ${target}
  # (not reST) cat ${startd}/vim-lcd-project-root/README.md >> ${target}
  # (forked) cat ${startd}/vim-markdown/README.md >> ${target}
  # (not reST) cat ${startd}/vim-netrw-cfg-split-explorer/README.md >> ${target}
  # (not reST) cat ${startd}/vim-netrw-link-resolve/README.md >> ${target}
  cat ${startd}/vim-nicer-file-changed-prompt/README.rst >> ${target}
  cat ${startd}/vim-ovm-easyescape-kj-jk/README.rst >> ${target}
  cat ${startd}/vim-ovm-seven-of-spines/README.rst >> ${target}
  cat ${startd}/vim-reSTfold/README.rst >> ${target}
  cat ${startd}/vim-reST-highdefs/README.rst >> ${target}
  cat ${startd}/vim-reST-highfive/README.rst >> ${target}
  cat ${startd}/vim-reST-highline/README.rst >> ${target}
  cat ${startd}/vim-select-mode-stopped-down/README.rst >> ${target}
  # (not reST) cat ${startd}/vim-source-reloader/README.md >> ${target}
  # (forked) cat ${startd}/vim-surround/README.markdown >> ${target}
  cat ${startd}/vim-title-bar-time-of-day/README.rst >> ${target}
  # (forked) cat ${startd}/vim-tmux-navigator/README.markdown >> ${target}
  # (forked) cat ${startd}/vim-unimpaired/README.markdown >> ${target}

  cat readme-using.pt2.rst >> ${target}
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

main () {
  local before_cd="$(pwd -L)"

  build_readme_using

  cd "${before_cd}"
}

main "$@"

