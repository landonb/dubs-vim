#!/bin/bash

remove_dirs () {
  mkdir old_bundle
  mv AutoAdapt old_bundle
  mv command-t old_bundle
  mv ctrlp.vim old_bundle
  mv dubs_all old_bundle
  mv dubs_core old_bundle
  mv editorconfig-vim old_bundle
  mv ingo-library old_bundle
  mv minibufexpl.vim old_bundle
  mv nerdtree old_bundle
  mv syntastic old_bundle
  mv taglist old_bundle
  mv TeTrIs.vim old_bundle
  mv tlib_vim old_bundle
  mv viki_vim old_bundle
  mv vim-bufsurf old_bundle
  mv vim-easytags
  mv vim-gnupg
  mv vim-misc
  mv vim-rails old_bundle
  mv vim-wakatime old_bundle
}

make_links () {

  local bdir=../bundle

  /bin/ln -sf ${bdir}/AutoAdapt
  /bin/ln -sf ${bdir}/command-t
  /bin/ln -sf ${bdir}/ctrlp.vim
  /bin/ln -sf ${bdir}/dubs_all
  /bin/ln -sf ${bdir}/dubs_core
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
  /bin/ln -sf ${bdir}/vim-easytags
  /bin/ln -sf ${bdir}/vim-gnupg
  /bin/ln -sf ${bdir}/vim-misc
  /bin/ln -sf ${bdir}/vim-rails
  /bin/ln -sf ${bdir}/vim-wakatime
}

make_links

