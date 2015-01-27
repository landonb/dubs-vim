" File: .vim/dubs_preloads.vim
" Author: Landon Bouma (dubsacks &#x40; retrosoft &#x2E; com)
" Last Modified: 2015.01.26
" Project Page: https://github.com/landonb/dubsacks_vim
" Summary: Pre-System Vim startup script
" License: GPLv3
" -------------------------------------------------------------------
" Copyright © 2015 Landon Bouma.
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

" If you want to set any g:global variables to override stock
" Vim script behavior, you have to set the globals *before*
" sourcing the shared Vim files. So the `.vimrc` for Dubsacks
" sources this script before loading any system scripts.

" ------------------------------------------------------------
" Extend the reST syntax highlighter's code vocabulary
" by overriding the ``.. code-block:: <language>`` mapping.
" ------------------------------------------------------------
" SYNC_ME: Similar *.rst changes in dubs_preloads.vim and rst_dubsacks.vim.

" See the Vim package file that takes care of reST syntax highlighting:
"  /usr/share/vim/vim74/syntax/rst.vim
" The list of recognized syntax highlighting languages is merely:
"   if !exists('g:rst_syntax_code_list')
"     let g:rst_syntax_code_list = ['vim', 'java', 'cpp', 'lisp',
"                                   'php', 'python', 'perl']
"   endif
" but we can do better than that, eh?
" Each language type is just bouced to another syntax file; see:
"   ls /usr/share/vim/vim74/syntax
" We could add them in ftplugin/rst_dubsacks.vim, but it's
"  a wee bit easier to setup the array that rst.vim uses.
" See also :help initialization for Vim script load ordering;
"  we could maybe set g: whenever and call runtime! to reload
"  the appropriate vim script, but which script is it? It's
"  easier just to swoop in early.

" Note that you cannot add 'rst' to this list without
" causing errors probably due to recursivenosity.
let g:rst_syntax_code_list = [
  \ 'bash',
  \ 'sh',
  \ 'vim',
  \ 'python',
  \ 'java',
  \ 'cpp',
  \ 'c',
  \ 'sql',
  \ 'javascript',
  \ 'html',
  \ 'css',
  \ 'svg',
  \ 'php',
  \ 'perl',
  \ 'lisp',
  \ 'yaml',
  \ 'diff',
  \ 'make',
  \ ]

" Re: bash syntax defined by sh.vim, so to make it work
" so you don't have to do, e.g., .. code-block:: sh
" we made a symlink, i.e.,
" ln -s /usr/share/vim/vim74/syntax/sh.vim \
"       $HOME/.vim/bundle/dubs_ftype_mess/syntax/bash.vim

" ------------------------------------------------------
" Mini Buffer Explorer
" ------------------------------------------------------

" This is a no-op unless you've installed MBE.
" https://github.com/fholgado/minibufexpl.vim

" Tell MiniBufExplorer not to start.
let g:miniBufExplAutoStart = 0

" ------------------------------------------------------
" Viki settings
" ------------------------------------------------------

" This is a no-op unless you've installed Viki.
" https://github.com/tomtom/viki_vim

" MAYBE: Set VikiMinorMode? Anything else?

let g:vikiOpenFileWith_html  = "silent !firefox %{FILE}"

