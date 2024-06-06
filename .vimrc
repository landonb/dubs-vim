" One developer's Vim directory (dotfiles, etc.).
" Author: Landon Bouma (landonb &#x40; retrosoft &#x2E; com)
" Project: https://github.com/landonb/dubs-vim#🖖
" License: GPLv3

" ========================================================================

" ----------------------------------------
"  Local Preload
" ----------------------------------------

" To override system Vim behavior, source a so-called preload script that,
" e.g., sets g:global variables to influence plugin settings.
execute "source " . pathogen#split(&rtp)[0] . "/plugin/dubs_preloads.vim"

" We'll use a Pathogen utility fcn. to help us locate the file
" (by splitting apart the runtimepath array, so we can get the
" first element, e.g., ~/.vim). Note that we haven't sourced
" Pathogen yet, but it's an 'autoload' script, as indicated by
" the # sign (which correlates to file paths), and Vim loads
" such scripts when they're referenced.
let dpref = findfile('dubs_preloads.vim', pathogen#split(&rtp)[0] . "/**")
if dpref != ''
  " Turn into a full path. See :h filename-modifiers
  let dpref = fnamemodify(dpref, ":p")
  execute "source " . dpref
" else:
"   don't fail or alert; the preloads file is not required.
endif

" ----------------------------------------
"  OS Bootstrap
" ----------------------------------------

" The buck stops here.
"      ... or does it?
" Actually, it does; we're responsible for 
" loading the application's startup script 
" if the user's startup script (this script) 
" exists.
if filereadable($VIMRUNTIME . "/../.vimrc")
  " This is where the startup file lives in 
  " 'nix, but in Cygwin, it's not created by 
  " default (but I can't vouch for other 
  " distributions).
  source $VIMRUNTIME/../.vimrc
elseif filereadable($VIMRUNTIME . "/../_vimrc")
  " This file exists and *must* be sourced 
  " for native Windows gVim to work properly.
  source $VIMRUNTIME/../_vimrc
elseif filereadable($VIMRUNTIME . "/../vimrc")
  " MacVim (Apple Silicon Homebrew).
  source $VIMRUNTIME/../vimrc
else
  " Well, we could complain, but in some
  " distros, the application startup file
  " doesn't exist. So let's not bother the
  " user, i.e., we won't:
  "  call confirm(
  "   \ 'vimrc: Cannot find VIMRUNTIME''s vimrc, '
  "   \ . 'i.e., $VIMRUNTIME/../[\.|_]vimrc', 'OK')
endif

