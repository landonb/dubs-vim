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

  # 2018-12-17: ansible-vim forked to tweak Yaml syntax engine.
  #  /bin/ln -sf ${bdir}/ansible-vim
  /bin/ln -sf ${bdir}/AutoAdapt
  /bin/ln -sf ${bdir}/command-t
  /bin/ln -sf ${bdir}/ctrlp.vim
  # Dubs Vim:
  #  dubs_after_dark/
  #  dubs_all/  # -> ../bundle/dubs_all/
  #  dubs_appearance/
  #  dubs_buffer_fun/
  #  dubs_core  # ->  # ../bundle/dubs_core/ -> ../bundle/dubs_all/
  #  dubs_edit_juice/
  #  dubs_file_finder/
  #  dubs_ftype_mess/
  #  dubs_grep_steady/
  #  dubs_html_entities/
  #  dubs_mescaline/
  #  dubs_project_tray/
  #  dubs_quickfix_wrap/
  #  dubs_rest_fold/
  #  dubs_style_guard/
  #  dubs_syntastic_wrap/
  #  dubs_toggle_textwrap/
  #  dubs_web_hatch/
  /bin/ln -sf ${bdir}/editorconfig-vim
  /bin/ln -sf ${bdir}/goyo.vim
  /bin/ln -sf ${bdir}/ingo-library
  /bin/ln -sf ${bdir}/jellybeans.vim
  # Skipping:
  #  /bin/ln -sf ${bdir}/_last_update
  /bin/ln -sf ${bdir}/limelight.vim
  # 2017-11-02: Removed minibufexpl.vim.
  #  /bin/ln -sf ${bdir}/minibufexpl.vim
  /bin/ln -sf ${bdir}/nerdtree
  /bin/ln -sf ${bdir}/nord-vim
  /bin/ln -sf ${bdir}/QFEnter
  /bin/ln -sf ${bdir}/syntastic
  /bin/ln -sf ${bdir}/taglist
  /bin/ln -sf ${bdir}/TeTrIs.vim
  /bin/ln -sf ${bdir}/tlib_vim
  /bin/ln -sf ${bdir}/viki_vim
  /bin/ln -sf ${bdir}/vim-abolish
  /bin/ln -sf ${bdir}/vim-bufsurf
  /bin/ln -sf ${bdir}/vim-colorschemes
  /bin/ln -sf ${bdir}/vim-easyescape
  # 2019-10-25: From at latest 2016-11-13:
  #  /bin/ln -sf ${bdir}/vim-easytags
  # 2019-03-19: Disable: vim-endwise: it's frustrating me.
  #  /bin/ln -sf ${bdir}/vim-endwise
  /bin/ln -sf ${bdir}/vim-fugitive
  /bin/ln -sf ${bdir}/vim-gnupg
  /bin/ln -sf ${bdir}/vim-istanbul
  # 2017-09-18: Thank you, pangloss.
  /bin/ln -sf ${bdir}/vim-javascript
  /bin/ln -sf ${bdir}/vim-jdaddy
  # 2017-10-16: vim-jsx forked to avoid forward-slash triggering GetJsxIndent.
  # 2020-02-08: vim-jsx deprecated b/c broke by pangloss/vim-javascript; replaced.
  #  /bin/ln -sf ${bdir}/vim-jsx
  # 2017-03-16: vim-markdown forked to fix issue of "white on white".
  #  /bin/ln -sf ${bdir}/vim-markdown
  /bin/ln -sf ${bdir}/vim-misc
  /bin/ln -sf ${bdir}/vim-rails
  # 2018-02-01: The new reST plugin makes editing sluggish.
  # And (2) when I use \s to find-replace <TAB>s, it only works
  # on the first line of matches, and then it exits replace mode,
  # and you see "xx matches on xx lines" message like you would
  # with \S find-replace-multi-files command. So weird. So disabled!
  #  /bin/ln -sf ${bdir}/vim-restructuredtext/
  /bin/ln -sf ${bdir}/vim-speeddating
  # Forked vim-surround... but haven't actually tipped the code.
  #  /bin/ln -sf ${bdir}/vim-surround
  /bin/ln -sf ${bdir}/vim-toml
  # 2020-02-08: vim-tmux-nav. forked to add Dubs' C-S-Up/-Down +/- pane mappings.
  #  /bin/ln -sf ${bdir}/vim-tmux-navigator
  /bin/ln -sf ${bdir}/vim-unimpaired
  /bin/ln -sf ${bdir}/vim-vinegar
  # 2018-12-13: A colorscheme I looked at, for inspiration,
  # but ultimately dubs_after_dark is too hot.
  #  /bin/ln -sf ${bdir}/vim-vividchalk
  /bin/ln -sf ${bdir}/yats.vim/
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

