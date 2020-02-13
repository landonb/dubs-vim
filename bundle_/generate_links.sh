#!/bin/sh
# vim:tw=0:ts=2:sw=2:et:norl:nospell:ft=sh

VIM_BUNDLE__PATH="${HOME}/.vim/bundle_"

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

remove_existing_links () {
  find . -maxdepth 1 -type l -exec /bin/rm {} +
}

vim_bundle__generate_links () {
  local bdir=../bundle

  remove_existing_links

  /bin/ln -sf ${bdir}/dubs_all
  /bin/ln -sf ${bdir}/dubs_core

  # (lb): I forked ansible-vim forked to tweak Yaml syntax engine.
  #  /bin/ln -sf ${bdir}/ansible-vim
  /bin/ln -sf ${bdir}/AutoAdapt
  /bin/ln -sf ${bdir}/command-t
  /bin/ln -sf ${bdir}/ctrlp.vim
  # Dubs Vim:
  #  dubs_after_dark
  #  dubs_all  # -> ../bundle/dubs_all
  #  dubs_appearance
  #  dubs_buffer_fun
  #  dubs_core  # ->  # ../bundle/dubs_core -> ../bundle/dubs_all
  #  dubs_edit_juice
  #  dubs_file_finder
  #  dubs_ftype_mess
  #  dubs_grep_steady
  #  dubs_html_entities
  #  dubs_mescaline
  #  dubs_project_tray
  #  dubs_quickfix_wrap
  #  dubs_rest_fold
  #  dubs_style_guard
  #  dubs_syntastic_wrap
  #  dubs_toggle_textwrap
  #  dubs_web_hatch
  /bin/ln -sf ${bdir}/editorconfig-vim
  /bin/ln -sf ${bdir}/goyo.vim
  /bin/ln -sf ${bdir}/ingo-library
  /bin/ln -sf ${bdir}/jellybeans.vim
  /bin/ln -sf ${bdir}/limelight.vim
  /bin/ln -sf ${bdir}/nerdtree
  /bin/ln -sf ${bdir}/nord-vim
  /bin/ln -sf ${bdir}/QFEnter
  /bin/ln -sf ${bdir}/syntastic
  /bin/ln -sf ${bdir}/tagbar
  # Note that taglist is part of Dubs Vim repo.
  /bin/ln -sf ${bdir}/taglist
  /bin/ln -sf ${bdir}/TeTrIs.vim
  /bin/ln -sf ${bdir}/tlib_vim
  /bin/ln -sf ${bdir}/viki_vim
  /bin/ln -sf ${bdir}/vim-abolish
  /bin/ln -sf ${bdir}/vim-bufsurf
  /bin/ln -sf ${bdir}/vim-colorschemes
  /bin/ln -sf ${bdir}/vim-easyescape
  /bin/ln -sf ${bdir}/vim-fugitive
  /bin/ln -sf ${bdir}/vim-gnupg
  /bin/ln -sf ${bdir}/vim-istanbul
  /bin/ln -sf ${bdir}/vim-javascript
  /bin/ln -sf ${bdir}/vim-jdaddy
  /bin/ln -sf ${bdir}/vim-js
  /bin/ln -sf ${bdir}/vim-jsx-pretty
  # (lb): I forked vim-markdown to fix issue of "white on white".
  #  /bin/ln -sf ${bdir}/vim-markdown
  /bin/ln -sf ${bdir}/vim-misc
  /bin/ln -sf ${bdir}/vim-rails
  /bin/ln -sf ${bdir}/vim-speeddating
  # (lb): I forked vim-surround... and have made zero commits to it.
  #  /bin/ln -sf ${bdir}/vim-surround
  # (lb): I forked vim-tmux-nav. to add C-S-Up/-Down +/- pane motions
  #  /bin/ln -sf ${bdir}/vim-tmux-navigator
  /bin/ln -sf ${bdir}/vim-toml
  /bin/ln -sf ${bdir}/vim-unimpaired
  /bin/ln -sf ${bdir}/vim-vinegar
  /bin/ln -sf ${bdir}/yats.vim
  /bin/ln -sf ${bdir}/ZoomWin
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

main () {
  local before_cd="$(pwd -L)"
  cd "${VIM_BUNDLE__PATH}"

  vim_bundle__generate_links

  cd "${before_cd}"
}

set -e

main "${@}"

