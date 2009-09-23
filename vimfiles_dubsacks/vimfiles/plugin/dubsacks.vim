" ------------------------------------------
"  Vim startup script for Windows gVim.
" ------------------------------------------

" Author: Landon Bouma <landonb@retrosoft.com>
" Version: 0.0.1 / Summer Aught Nine
" License: What License?

" NOTE!! If you edit this file, be sure to delete
"        ~/vimfiles/Session.vim
"        (If you have dubsacks.vim loaded, you can 
"         also run <Alt-f>e to close all windows 
"         and then <Alt-f>x to quit; dubsacks will 
"         destroy Session.vim for you.)

" ------------------------------------------

" Once you're done, you're done
" -------------------------
" NOTE This file gets sourced more than once 
"      when occupying the plugin directory (and 
"      I don't know why, also known as: "Just 
"      when you think you know Vim...!"), so set 
"      a flag telling ourselves when we've already
"      been loaded (a/k/a "had enough!")
if exists("plugin_dubsacks_vim")
  finish
endif
let plugin_dubsacks_vim = 1

" Delete default Vim buffer
" -------------------------
" If you're not already running gVim and you 
" double-click a file from Explorer, (or run 
" gVim from the command line), gVim opens your 
" file, but also opens a nameless buffer (and 
" then hides it when your file is opened).
" You'd think this wouldn't be the default,
" or there'd be a way to stop it, but, alas...
" I guess we're responsible for cleaning up 
" this mess.
let s:CleansedBufList = 0
function! s:CleanseBufList(bang)
  let last_buffer = bufnr('$')
  let delete_count = 0
  let n = 1
  while n <= last_buffer
    " NOTE I'm assuming when we restore Session.-
    "      vim that there's just one unnamed 
    "      buffer and that it's the empty one 
    "      created on startup. However, I could 
    "      be wrong (I haven't verified this 
    "      through reading the help), so who 
    "      knows if this ever might fail (if 
    "      which case your documents don't get 
    "      opened -- whatever, so you just fix 
    "      this script and know that I was wrong 
    "      to assume).
    if (buflisted(n)) && (bufname(n)== "")
      execute "bdelete" . a:bang . ' ' . n
      if ! buflisted(n)
        let delete_count = delete_count + 1
      endif
    endif
    let n = n + 1
  endwhile
  " Pretty-print a message 'splaining whaddup
  if delete_count == 1
    let plural = ""
  else
    let plural = "s"
  endif
  echomsg "CleansedBufList: " . delete_count 
    \ . " buffer" . plural . " deleted"
  " Remember that we've cleansed
  let s:CleansedBufList = 1
endfunction

" Run CleanseBufList just once, right 
" after we start and load Session.vim
autocmd SessionLoadPost * nested 
  \ if 0 == s:CleansedBufList |
  \   :call <SID>CleanseBufList('') | 
  \ endif
" And how come I never seen a tip fer this
" on-line, eh, vim.org? eh, vim.wikia.com?
" 'cause usually when I can't Google something... 
" it means I'm wrong! ...but I digress... 
" (seriously, I'm probably just missing a 
"  setting somewhere...)

" Restore previous session on open
" --------------------------------
" Inspired by
"   http://vim.wikia.com/wiki/Open_the_last_edited_file

" Save current session on exit
" --------------------------------
" NOTE Vim's default is to set 
"        sessionoptions=blank,buffers,curdir,
"          \ folds,help,options,tabpages,winsize
"      which means we can't update _this_ file 
"      without first deleting 
"      ~/vimfiles/Session.vim -- otherwise, 
"      Session.vim overrides any changes we make 
"      here (because it stores mappings, etc., 
"      and is loaded after this file). 
"      Alternatively, we could set 
"      sessionoptions to save only winsize, 
"      buffers, etc., but not options: though I 
"      haven't tested this, so for now: delete 
"      Session.vim if you m*ck w//touch this 
"      fi#e.
" NOTE I still haven't figured out unloaded/
"      hidden buffers, such that :Bclose all and 
"      restarting Vim starts with the buffers
"      you just closed -- as a kludge, we'll 
"      just not re-write the session file if 
"      <Alt-f>e was just called.
autocmd VimLeave * nested 
  \ let last_buffer = bufnr('$') |
  \ let num_buffers = 0 |
  \ let empty_buffers = 0 |
  \ let n = 1 |
  \ while n <= last_buffer |
  \   if (buflisted(n)) |
  \     let num_buffers = num_buffers + 1 |
  \     if (bufname(n)== "") |
  \       let empty_buffers = empty_buffers + 1 |
  \     endif |
  \   endif |
  \   let n = n + 1 |
  \ endwhile |
  \ if (num_buffers == 1) 
  \     && (empty_buffers == 1) |
  \   call delete(
  \     $HOME . "/vimfiles/Session.vim") |
  \ else |
  \   if (!isdirectory($HOME . "/vimfiles")) |
  \     call mkdir($HOME . "/vimfiles") |
  \   endif |
  \   execute "mksession! " . $HOME . 
  \     "/vimfiles/Session.vim" |
  \ endif

" Restore previous session on startup
" --------------------------------
" ... but not if specifically opening a file; in 
" other words, just restore the previous session 
" if user clicked gVim.exe, but not some dumb 
" text file.
" NOTE (argc() == 0) is true even when double-
"      clicking from Explorer, so it's not a 
"      reliable indicator of whether a file is 
"      being opened (as the aforementioned wikia.
"      com link may lead you to believe); 
"      rather, 
autocmd VimEnter * nested
    \ let greatest_buf_no = bufnr('$') |
    \ if (greatest_buf_no == 1) 
    \     && (bufname(1) == "") 
    \     && filereadable(
    \       $HOME . "/vimfiles/Session.vim") |
    \   execute "source " . $HOME . 
    \     "/vimfiles/Session.vim" |
    \ endif

" ------------------------------------------
"  The Basics
" ------------------------------------------

" It's Courier New 9, Folks!
" --------------------------------
if has("gui_running")
  " How come Courier New isn't the default?
  set guifont=Courier_New:h9
  " Get rid of silly, space-wasting toolbar
  " Default is 'egmrLtT'
  set guioptions=egmrLt
  " Hide the mouse pointer while typing
  " NOTE This does not hide the mouse in
  "      Windows gVim, so it's off! for now
  "set mousehide
endif

" Show line numbers
" --------------------------------
set nu!

" Pretty Print
" --------------------------------
" Change the color of the line numbers
" from deep red (default) to dark grey
" (it's less abusive to the eye this way)
:highlight LineNr term=NONE cterm=NONE 
  \ ctermfg=DarkGrey ctermbg=NONE gui=NONE 
  \ guifg=DarkGrey guibg=NONE

" What Are You Hiding From Me?
" --------------------------------
" Show new buffers w/ all folds open
" (See http://vim.wikia.com/wiki/Folding)
" TODO can i use autocmd BufAdd * ?? <C-a><C-o>zO
"      'cause foldlevelstart=20 isn't bullet-
"       proof ??
set foldlevelstart=20

" Start Big
" --------------------------------
" Start with a reasonably sized window
set columns=111
set lines=44
" NOTE To start maximized:
"      au GUIEnter * simalt ~x

" Search Behavior
" --------------------------------
" Case-insensitive searches
" NOTE /You can override this with/I
set ignorecase
" Better yet, search case sensitive if the
" search term contains a captial letter
set smartcase
" These should be set by default:
"   set hlsearch  " Highlight search terms
"   set incsearch " search dynamically as keyword is typed

" Common Backup file and Swap Directory
" --------------------------------
" Use a common directory for backups and 
" swp files; creates the backup dir if new
let s:backupDir = '"' . $USERPROFILE . '/.vim_backups' . '"'
let s:backupFtype = getftype(s:backupDir)
if "" == s:backupFtype
  silent execute '!mkdir ' . s:backupDir
elseif "dir" != s:backupFtype
  call confirm('Backup directory exists but is not a directory! '
    \ . 'Dir: ' . s:backupDir . ' / Type: ' . s:backupFtype)
endif
set backupdir=$USERPROFILE/.vim_backups//
set directory=$USERPROFILE/.vim_backups//

" Skip Backups
" --------------------------------
" Backups are only written when you save a 
" file, anyway, so I don't see the point. 
" And if Vim crashes, you'll need the swap 
" file for recovery, but the backup file....
set nobackup

" Drop a Deuce on that Tab
" --------------------------------
" Anyone out there still tabbing?
" How 'bout you spacers using 4?
" Seems the Rubyists have got me 
" down to 2... what's next, reverse
" indenting?
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
" smartindent is too smart and doesn't 
" indent lines that look like C macros,
" i.e., those that start with an octothorpe
"set smartindent
"set smarttab

" Something Something Something
" --------------------------------
" NOTE I thought autowrite was suppose to 
"      cause the buffer to be written to disk 
"      whenever you changed buffers, but it 
"      doesn't really seem to do anything...
"set autowrite

" Enable Vim Command-line Completion
" --------------------------------
" Can't remember a command's proper name?
" Hit <Tab> (!)
set wildmenu

" Always show a status line
" --------------------------------
au VimEnter * set laststatus=2

" All Quiet on the Vimmer Front
" --------------------------------
" I tried noerrorbells and novisualbell to
" no avail, but this seems to do the trick.
set vb t_vb=

" ------------------------------------------
"  Dealing with Buffers
" ------------------------------------------

" I tried minibufexpl, bufman, and bufferlist:
"   http://www.vim.org/scripts/script.php?script_id=159
"   http://www.vim.org/scripts/script.php?script_id=875
"   http://www.vim.org/scripts/script.php?script_id=1325
"   :(respectively)
" but this is simply the best
function! s:SimplBuffrListr()
  " Show all buffers, one per line, in the 
  " command-line window (which expands upward 
  " as needed, and disappears when finished)
  " TODO I've never tested w/ more buffers than 
  "      screen lines -- is there a More/Enter-to-
  "      Continue prompt?
  :buffers
  " Ask the user to enter a buffer by its number
  let i = input("Buffer number: ")
  " Check for <ESC> lest we dismiss a help 
  " page (or something not in the buffer list)
  if i != ""
   execute "buffer " . i
  endif
endfunction
" Map a double-underscore to the simpl(e) 
" buffe(r) liste(r)
map <silent> __ :call <SID>SimplBuffrListr()<CR>
" NOTE to the wise: tabs? tabs?! who needs tabs!!?
"      buflists? buflists?! who needs buflists!!?
"      serlussly, pound a double-underscore every
"      once 'n a while, but keep yer doc names 
"      outta me face. #foccers

" ------------------------------------------
"  Quickfix Toggle
" ------------------------------------------
"   http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
" (Quickfix is Vim's search results 
"  window, among other things.)
" TODO Make height settable or at least 
"      remember/restore between toggles
let g:jah_Quickfix_Win_Height=12
command -bang -nargs=? QFix 
  \ :call <SID>QFixToggle(<bang>0)
function! <SID>QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen " . g:jah_Quickfix_Win_Height
  endif
endfunction
" used to track the quickfix window
augroup <SID>QFixToggle
  autocmd!
  autocmd BufWinEnter quickfix 
    \ :let g:qfix_win = bufnr('$')
  autocmd BufWinLeave * 
    \ if exists("g:qfix_win") 
    \     && expand("<abuf>") == g:qfix_win | 
    \   unlet! g:qfix_win | 
    \ endif
augroup END

" Toggle Annoyance
" --------------------------------
" When toggling the quickfix window,
" make sure it only increases/decreases
" the height of the window adjacent to 
" it (above it). Default Vim behavior 
" is to resize all window the same size.
set noequalalways

" ------------------------------------------
"  Find/Search/Replace/Substitute
" ------------------------------------------
" How many ways can you spell regexp?

" Ctrl-H Hides Highlighting
" --------------------------------
" Vim's default Ctrl-H is the same as <BS>.
" It's also the same as h, which is the 
" same as <Left>. WE GET IT!! Ctrl-H won't 
" be missed....
" NOTE Highlighting is back next time you search.
" NOTE Ctrl-H should toggle highlighting (not 
"      just turn it off), but nohlsearch doesn't 
"      work that way
noremap <C-h> :nohlsearch<CR>
inoremap <C-h> <C-O>:nohlsearch<CR>
cnoremap <C-h> <C-C>:nohlsearch<CR>
onoremap <C-h> <C-C>:nohlsearch<CR>
" (NEWB|NOTE: From Insert mode, Ctrl-o
"  is used to enter one command and 
"  execute it. If it's a :colon 
"  command, you'll need a <CR>, too.
"  Ctrl-c is used from command and
"  operator-pending modes.)

" Start Substitution Under Cursor
" --------------------------------
" Starts a substitution command on whatever
" the cursor's on.
" Usage: Highlight some text
"        Type Ctrl-o \s
" http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor
" NOTE .,$ searches from the cursor to end of 
"      file; that's probably the best default...
:noremap <Leader>s "sy:.,$s/<C-r>s//gc<Left><Left><Left>

" Use Cygwin's grep (not Windows' findstr)
" --------------------------------
" Options we use:
"  -n makes grep show line numbers
"  -R recurses directories
"  -E uses extended regexp (same as egrep) 
"       so that alternation (|) works, 
"       among other opts
"  --exclude-from specifies a file containing
"                 filename globs used to exclude
"                 files from the search
" Example Vim Grep command:
"  :grep "Sentence fragment" "C:\my\project\path"
if filereadable(
    \ $HOME . "/.vim/grep-exclude")
  " *nix
  set grepprg=egrep\ -n\ -R\ --exclude-from=\"$HOME/.vim/grep-exclude\"
elseif filereadable(
    \ $USERPROFILE . 
    \ "/vimfiles/grep-exclude")
  " Windows
  set grepprg=egrep\ -n\ -R\ --exclude-from=\"$USERPROFILE/vimfiles/grep-exclude\"
else
  call confirm('dubsacks.vim: Cannot find grep-xclude file', 'OK')
endif

" NOTE The grep exclude-from file *must* be saved 
"      in unix format 
"      i.e., if :set ff is 'dos', it won't work! 
"      so :set ff=unix
" NOTE The exclude-from file has one file glob 
"      per line, i.e.,
"        *.sql
"        *.skipme
"        *.etc
" TODO Is there a better way to specify filename 
"      globs than using a file? 
" TODO Make it easy to switch btw glob files
" TODO Make a command to manage one or more 
"      filename glob files and switch between
"      them
" TODO Add a command for non-recursive searching
" TODO Multiple Quickfix search results windows?

" ------------------------------------------
"  Macros
" ------------------------------------------
" Think of 'em as personal assistants:
" show 'em it once, then have them repeat.

" Single-Key Replays with Q
" --------------------------------
" This is a shortcut to playback the recording in 
" the q register.
"   1. Start recording with qq
"   2. End recording with q (or with 
"      Ctrl-o q if in Insert mode)
"   3. Playback with Q
noremap Q @q

" ------------------------------------------
"  Color Scheme 
" ------------------------------------------
" I like the White background that the default 
" color scheme uses, but the color scheme still 
" needs a little tweaking.

" Tone down the tildes
" --------------------------------
" Vim displays tildes (~) to represent lines that 
" appear in a window but are not actually part of 
" the buffer (i.e., for visual lines that follow 
" the last line of a buffer). This isn't too 
" distracting unless you verially split a window, 
" then the empty buffer on the right is full of 
" colorful blue tildes. You could tone this done 
" by, say, changing the tildes to pink, i.e.,
"
"   highlight NonText guifg=Pink2
"
" but, really, since Vim is displaying line 
" numbers -- and since line numbers are only 
" displayed for actual lines in the document -- 
" we don't even need the tildes! You can simply 
" infur the end of the document by where the line 
" numbers are no longer displayed. (Note that 
" guifg=NONE seems like the proper way to do 
" this, but it makes the tildes black, not 
" transparent (or maybe I missed something when I 
" tried it).)
highlight NonText guifg=White

" Mock zellner
" --------------------------------
" The zellner color scheme changes the status 
" line for the active window. The default is that 
" each status line (i.e., the line beneath each 
" window) is white text on a black background, 
" save for the active window (the window where 
" the cursor is), which is yellow text on a dark 
" gray background. (For the default color scheme, 
" the active window's status line is bold white 
" on black, and inactive windows' status lines 
" are normal white on black.)
"
" This is what's set in zellner.vim:
"
"    highlight StatusLine 
"    \ term=bold,reverse cterm=NONE |
"    \ ctermfg=Yellow ctermbg=DarkGray |
"    \ gui=NONE guifg=Yellow guibg=DarkGray
"
" Note that zellner does not specify StatusLineNC 
" (for inactive windows), so it remains the 
" default -- white foreground and black 
" background. This is annoying; I don't like some 
" status lines being black and one being dark 
" gray, so let's make them all dark gray. This 
" means using the same settings zellner uses for 
" StatusLine, but also adding StatusLineNC, 
" specifying that inactive windows' status lines 
" use the same background as the active window 
" status line but instead use a white foreground 
" (font) color.
highlight StatusLineNC term=reverse gui=NONE 
  \ guifg=White guibg=DarkGray 
  \ ctermfg=White ctermbg=DarkGray
highlight StatusLine term=bold,reverse gui=NONE 
  \ guifg=Yellow guibg=DarkGray 
  \ cterm=NONE ctermfg=Yellow ctermbg=DarkGray 

" Visually Appealing Vertical Split
" --------------------------------
" When you split a window vertically, there's a 
" column of black rectangles that runs between 
" the two windows, and each black rectangle has 
" a vertical bar in it. This, to me, is very 
" distracting!
"
" And you really don't need these rectangles- the
" line numbers in each window provide adequate 
" visual separation.
"
" So I like to hide the rectangles.
"
" This is also helpful if you like working with 
" narrow text columns but enjoy having whitespace 
" on the right side of the editor.
"
" Bare with me while I describe this: I like 
" working with two vertical windows, each 50 
" characters wide, with my working buffer in the 
" left window and an empty buffer in the right. 
" Since the buffer in the right window is empty, 
" only line number 1 is displayed, and so you end 
" up with an awesome chunk of whitespace. Why not 
" just work in one window that's 50 characters 
" wide? Well, 'cause then your buffer is squished 
" in a narrow gVim window and your desktop picture 
" is distractingly close to what you're working on.
" Weird, right? Something about how my brain is 
" wired...
"
" So here's what we'll do: we'll set linebreak, 
" which complements wrap by wrapping lines only 
" where visually pleasing, i.e., at the nearest 
" whitespace character or punctuation. 
" Specifically, :set breakat? returns
"
"    breakat= ^I!@*-+;:,./?
"
" We'll also modify the black rectangles with the 
" white vertical tab characters to be white on 
" white, which effectively hides them.
set linebreak
highlight VertSplit term=reverse gui=NONE 
  \ guifg=White guibg=White 
  \ ctermfg=White ctermbg=White

" NOTE When working with two vertically split 
"      windows, the left one container your 
"      document and the right one containing an 
"      empty buffer, the scroll bar for your 
"      document is on the left side of the gVim 
"      window, rather than on the right. You'll
"      probably eventually get used to this....

" ------------------------------------------
"  Random Randomness
" ------------------------------------------

" Ctrl-Return is Your Special Friend
" --------------------------------
" Ctrl-<CR> starts a new line without the comment 
" leader
nmap <C-CR> <C-o><Home><Down>i<CR><Up>
imap <C-CR> <C-o><Home><Down><CR><Up>

" Correct Ctrl-Z While Text Selected 
" --------------------------------
" Ctrl-Z is mapped to undo in Normal and Insert 
" mode, but in Select mode it just lowercases 
" what's selected!
" NOTE To lowercase in Select mode, type  
"      <Ctrl-o> to start a command, then type 
"        gu{motion},
"      e.g., 
"        <C-o>gu<DOWN>
"      (or <C-o>gu<UP>, it does the same thing). 
"      (And guess what? gU uppercases.)
smap <C-Z> <C-o>:undo<CR>

" Change Path Delimiters Quickly
" --------------------------------
" http://vim.wikia.com/wiki/Change_between_backslash_and_forward_slash

" Press f/ to change every backslash to a 
"          forward slash, in the current line.
" Press f\ to change every forward slash to a 
"          backslash, in the current line.
" The mappings save and restore the search 
" register (@/) so you can continue a previous 
" search, if desired (i.e., the previous search 
" doesn't become '/' or '\').
:nnoremap <silent> f/ 
  \ :let tmp=@/<CR>:s:\\:/:ge<CR>:let @/=tmp<CR>
:nnoremap <silent> f<Bslash>
  \ :let tmp=@/<CR>:s:/:\\:ge<CR>:let @/=tmp<CR>

" Capture Ex Output So You Can 
"     Do With It As You Please
" --------------------------------
" http://vim.wikia.com/wiki/Capture_ex_command_output

" Basic Ex output Capture
" --------------------------------
"   :redir @a
"   :set all " or other command
"   :redir END
" and use "ap to put the yanked 

" Advanced Ex output Capture
" --------------------------------
" TabMessage runs the specified command
" and pastes the output to a new buffer
" in a new tab
function! s:TabMessage(cmd)
  " Redirect Ex output to a varibale
  " we'll call 'message'
	redir => message
	silent execute a:cmd
	redir END
  " Create a new tab and put the 
  " captured output
  tabnew
	silent put=message
  " Tell Vim not to ask us to save
  " when we close the buffer
  setlocal buftype=nowrite
endfunction
" Map our TabMessage function to an Ex :command 
" of the same name
command! -nargs=+ -complete=command 
  \ TabMessage call <SID>TabMessage(<q-args>)
" Usage e.g.,
"   :TabMessage highlight
"   :TabMessage ec g:
" Shortcut
"   :Ta<TAB> should invoke autocompletion

" Lorem Ipsum Dump
" --------------------------------
" By Harold Giménez
"   http://awesomeful.net/posts/57-small-collection-of-useful-vim-tricks
"   http://github.com/hgimenez/vimfiles/blob/c07ac584cbc477a0619c435df26a590a88c3e5a2/vimrc#L72-122
" Define :Lorem command to dump a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum.

au BufRead,BufNewFile *.nsh setfiletype nsis

" ------------------------------------------
" ----------------------------------- EOF --

