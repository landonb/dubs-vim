" This file is part of Dubsacks.
" --------------------------------
" Dubsacks is Copyright © 2009, 2010 Landon Bouma.
" 
" Dubsacks is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
" 
" Dubsacks is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
" GNU General Public License for more details.
" 
" You should have received a copy of the GNU General Public License
" along with Dubsacks. If not, see <http://www.gnu.org/licenses/>.

" ------------------------------------------
"  Filetypes
" ------------------------------------------

" Author: Landon Bouma <landonb@retrosoft.com>
" Version: 0.0.1 / Summer Aught Nine
" License: What License?

" NOTE!! If you edit this file, be sure to delete
"        ~/vimfiles/Session.vim

" Startup
" ------------------------

" Load this script just once
if exists("plugin_filetypes_vim")
  finish
endif
let plugin_filetypes_vim = 1

" Markdown Syntax
" --------------------------------
" http://daringfireball.net/projects/markdown/
augroup markdown
  au! BufRead,BufNewFile *.mkd setfiletype mkd
  autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
  " Also map *.txt files, since you 
  " love Markdown so much
  " au! BufRead,BufNewFile *.txt 
  "   \ set nowrap sw=2 sts=2 ts=8
  "au BufRead,BufNewFile *.txt setfiletype mkd
  "autocmd BufRead *.txt set ai formatoptions=tcroqn2 comments=n:>
augroup END
"augroup mkd
"  autocmd BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
"augroup END

" I keep waffling on this, but I can get used to 
" naming my text files *.mkd, I suppose...
"au BufRead,BufNewFile *.txt setfiletype mkd

" Textile Syntax
" --------------------------------
" Map *.textile files to the syntax highlighter
augroup textile
  au BufRead,BufNewFile *.textile setf textile
augroup END

" NSIS Installer Script Syntax
" --------------------------------
" The Nullsoft Scriptable Installer System 
" makes Windows .exe executables ('cause  
" Windows isn't cool enough for gems).
" The defauft NSIS file extension is .nsi, 
" but convention says to use .nsh for 
" include (header?) files.
augroup nsis
  au BufRead,BufNewFile *.nsh setfiletype nsis
augroup END

" ActionScript/MXML/Flex Highlighting
" --------------------------------
" (No comment.)
autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.mxml set filetype=mxml

" Wikitext
" --------------------------------
" Because who doesn't love Jimmy Wales?
" Even his name is Super Sexy!
autocmd BufRead *.wp set filetype=wp

" ------------------------------------------
" ----------------------------------- EOF --

