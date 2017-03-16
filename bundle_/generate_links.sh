#!/bin/bash

make_links () {

  local bdir=../bundle

  /bin/ln -sf ${bdir}/dubs_all
  /bin/ln -sf ${bdir}/dubs_core

  /bin/ln -sf ${bdir}/AutoAdapt
  /bin/ln -sf ${bdir}/command-t
  /bin/ln -sf ${bdir}/ctrlp.vim
  /bin/ln -sf ${bdir}/editorconfig-vim
  /bin/ln -sf ${bdir}/ingo-library
  /bin/ln -sf ${bdir}/minibufexpl.vim
  /bin/ln -sf ${bdir}/nerdtree
  /bin/ln -sf ${bdir}/syntastic
  /bin/ln -sf ${bdir}/taglist
  /bin/ln -sf ${bdir}/TeTrIs.vim
  /bin/ln -sf ${bdir}/tlib_vim
  /bin/ln -sf ${bdir}/viki_vim
  /bin/ln -sf ${bdir}/vim-bufsurf
  #/bin/ln -sf ${bdir}/vim-easytags
  /bin/ln -sf ${bdir}/vim-gnupg
  /bin/ln -sf ${bdir}/vim-markdown
  /bin/ln -sf ${bdir}/vim-misc
  /bin/ln -sf ${bdir}/vim-rails
}

make_links

