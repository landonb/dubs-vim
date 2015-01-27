" File: ~/.vimrc
" Author: Landon Bouma (landonb &#x40; retrosoft &#x2E; com)
" Last Modified: 2015.01.26
" Project Page: https://github.com/landonb/dubsacks_vim
" Summary: Platform-agnostic Vim startup script
" License: GPLv3
" -------------------------------------------------------------------
" Copyright © 2009, 2015 Landon Bouma.
" 
" This file is part of Dubsacks.
" 
" Dubsacks is free software: you can redistribute it and/or
" modify it under the terms of the GNU General Public License
" as published by the Free Software Foundation, either version
" 3 of the License, or (at your option) any later version.
" 
" Dubsacks is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty
" of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
" the GNU General Public License for more details.
" 
" You should have received a copy of the GNU General Public License
" along with Dubsacks. If not, see <http://www.gnu.org/licenses/>
" or write Free Software Foundation, Inc., 51 Franklin Street,
"                     Fifth Floor, Boston, MA 02110-1301, USA.
" ===================================================================

" ------------------------------------------
" About:

" This cross-platform Vim startup script runs on Linux or Windows.
" Though I haven't tried Dubsacks on Windows for a long time.

" ------------------------------------------
" Versions:

" Version: 1.0 / Winter MMXV
" Version: 0.2 / Winter X
" Version: 0.1 / Summer Aught Nine

" ----------------------------------------
"  Local Preload
" ----------------------------------------

" If you want to override any of the system Vim files, or
" to influence their behavior, add code to the preload script.
" Do this before sourcing systems file at, e.g., /usr/share/vim/vim74/.
" The preload script is just a file with a known pathname;
" it's nothing more special than that. As of 2015, it just
" influences the default reStructuredText script (by setting
" a g:global before the syntax script loads).
" MAYBE: We could maybe instead use :runtime! to reload the file
"        after setting the global.
"        We might also be able to :syntax off/:syntax on
"        to force a reload of syntax files...

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
else
  " Well, we could complain, but in some
  " distros, the application startup file
  " doesn't exist. So let's not bother the
  " user, i.e., we won't:
  "  call confirm(
  "   \ 'vimrc: Cannot find VIMRUNTIME''s vimrc, '
  "   \ . 'i.e., $VIMRUNTIME/../[\.|_]vimrc', 'OK')
endif

" ----------------------------------------
"  Let's Get Infected
" ----------------------------------------

" If Dubsacks is installed as a submodule, i.e.,
"  git clone ... ~/.vim/bundle/dubsacks_vim
" Then you'll want to add its bundle path to your infection, e.g.,
"  execute pathogen#infect('bundle/{}', 'bundle/dubsacks_vim/bundle/{}')
"
" But if Dubsacks was checkout out as ~/.vim, there's no need.
execute pathogen#infect('bundle/{}')

