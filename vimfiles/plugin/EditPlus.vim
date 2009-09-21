" ------------------------------------------
"  EditPlus Vim Treatment
" ------------------------------------------

" Author: Landon Bouma <landonb@retrosoft.com>
" Version: 0.0.1 / Summer Aught Nine
" License: What License?

" NOTE!! If you edit this file, be sure to delete
"        ~/vimfiles/Session.vim

" Startup
" ------------------------

" Load this script just once
if exists("plugin_editplus_vim")
  finish
endif
let plugin_editplus_vim = 1

" ------------------------------------------
"  EditPlus
" ------------------------------------------
" 'It doesn't suck,' says BBEdit. Which I 
" started using sometime in the 90s. Then 
" I graduated college, and some corporation 
" sent monies my way to program on Windows. 
" So I found EditPlus, which is the mostest 
" baddest-ass Windows GUI editor ever. No 
" Intellisence for me, thank you very much! 
" Just file and project browsing, and regex 
" searching to boot. And lots of nice keyboard 
" shortcuts. Which we try to mock herein.

" Welcome to the (Incomplete) Vim treatment 
" of EditPlus. Who doesn't use <M-f>e all 
" the time?

" --------------------------------
"  EditPlus // File Commands
" --------------------------------
" Ctrl-W and Ctrl-Q are GUI editor favorites.
" But in gVim on Windows, <C-q> remaps what 
" <C-v> was (which is "start Visual mode 
" blockwise", so that <C-v> can be used for 
" paste), and <C-w> is the start of all Window 
" commands (and if you touch that, an angry 
" mob of puritan Vimmers will come find you). 
" So instead, get used to Alt-F commands, i.e., 
" the File menu.

" The menu is created and populated 
"   $VIMRUNTIME/menu.vim
if has("menu")

  " --------------------------------
  " A Close is a close is a close
  " --------------------------------
  " ... No, I mean *REALLY* close it. Don't just 
  " hide the dang buffer -- pop it from the list. 
  " And show the last buffer we were on.
  "
  " menu.vim's File.Close calls :close, which 
  " closes the current window (or hides the 
  " active buffer if there's only one window left 
  " (and by hide I mean :enew is called to start 
  " a new buffer)). So it's not actually closing 
  " the file, it's closing the window or making a 
  " new buffer. I'm not sure why this is mapped 
  " to the File menu... so let's change it and 
  " make File.Close really close (i.e., release) 
  " the current file buffer. Do any or you Vimmer 
  " traditionalists have a problem with that? =)
  " (Also -- redundantly -- the :close command 
  "  is mapped to Window.Close, aka <Alt-W>c,
  "  or <Ctrl-W>c.)
  " NOTE 10.330 is File.Close, and 10.335 is 
  "      File.-SEP1-
  "      i.e., from menu.vim:
  "   an <silent> 10.330 &File.&Close<Tab>:close
  "     \ :if winheight(2) < 0 <Bar>
  "     \   confirm enew <Bar>
  "     \ else <Bar>
  "     \   confirm close <Bar>
  "     \ endif<CR>
  " 'Un'-menu the existing menu item
  aunmenu File.Close
  " Use :an rather than :menu to apply to all 
  " modes
  an 10.330 &File.&Close<Tab>:Bclose :Bclose<CR>
  " Thanks for :Bclose, Joe! (See: newbufdel.vim)
  "   http://vim.wikia.com/wiki/VimTip165

  " --------------------------------
  " Clear the buffer list
  " --------------------------------
  " <Alt-f>e ==> Close all files. This isn't 
  " like <Alt-f>x, which quits and preserves your 
  " workspace for the next time you run gVim.
  " This command literally deletes all your 
  " buffers and starts a new one for you.
  " TODO This is broken if you <Alt-f>c some 
  "      files and then quit -- the closed 
  "      buffers are reopened. I think this is 
  "      probably got to do with what's in 
  "      Session.vim -- but even if I <Alt-f>c 
  "      one buffer, then modify another buffer, 
  "      save it, and quit- on restart, the 
  "      buffer I closed is reopened (meaning, 
  "      Session.vim was rewrit but still 
  "      contains the closed buffers). This also 
  "      has to do w/ Vim hidden buffers, which I 
  "      don't completely get yet -- if you close 
  "      a buffer and remove it from your buffer 
  "      list, why is it just hidden and not 
  "      really gone? Does this have to do with 
  "      tags that are set, or something?
  " NOTE To work-around this, you have to <Alt-
  "      f>e to close all buffers, and then you 
  "      have to <Alt-f>x to quit -- I've got it 
  "      so if there's only the one empty buffer 
  "      open when you quit, then Session.vim is 
  "      deleted. Then, when you re-run Vim, none 
  "      of those closed buffers are re-opened.
  nmenu 10.331 &File.Clos&e\ All 
   \ :only<CR>:enew<CR>:BufOnly<CR>
  imenu 10.331 &File.Clos&e\ All  
   \ <C-O>:only<CR><C-O>:enew<CR><C-O>:BufOnly<CR>
  cmenu 10.331 &File.Clos&e\ All 
   \ <C-O>:only<CR><C-O>:enew<CR><C-O>:BufOnly<CR>
  omenu 10.331 &File.Clos&e\ All 
   \ <C-O>:only<CR><C-O>:enew<CR><C-O>:BufOnly<CR>
  " Thanks for :BufOnly, CJR!
  "   http://www.vim.org/scripts/script.php?script_id=1071

  " --------------------------------
  " Simple Save All
  " --------------------------------
  " <Alt-f>l ==> Save All
  "      :wa (save all buffers)
  "   or :xa (save-all-and-bidy-bye!)
  "      ZZ is also a nice way to save/close 
  "         current buffer/window
  " NOTE 10.350 is File.Save; 10.400 is 
  "      File.-SEP2-

  " Re-map the split command, which uses the  
  " same <Alt-f>l shortcut, i.e., from menu.vim:
  "   an 10.320 &File.Sp&lit-Open\.\.\.<Tab>:sp 
  "     \ :browse sp<CR>
  aunmenu File.Split-Open\.\.\.
  an 10.320 &File.Spli&t-Open\.\.\.<Tab>:sp 
    \ :browse sp<CR>

  " Make Save All the new <Alt-f>l
  an 10.350 &File.Save\ A&ll<Tab>:wa :wa<CR>

  " --------------------------------
  " Make a Window.New that splits Vertically
  " --------------------------------
  " <Ctrl-W>n (also mapped to menu <Alt-w>n) 
  " opens a new window above the current one 
  " with an empty buffer. We want to do the 
  " same, but for a vertically-split window, 
  " i.e., open a new buffer in a new window 
  " to the right of the current window.
  "an 70.300 &Window.&New<Tab>^Wn			<C-W>n
  nmenu 70.301 &Window.New\ V-&Split<Tab>^Ws 
 \ <C-w>v<C-w>p:enew<CR><C-w>p
  imenu 70.301 &Window.New\ V-&Split<Tab>^Ws 
 \ <C-O><C-w>v<C-O><C-w>p<C-O>:enew<CR><C-O><C-w>p
  cmenu 70.301 &Window.New\ V-&Split<Tab>^Ws 
 \ <C-O><C-w>v<C-O><C-w>p<C-O>:enew<CR><C-O><C-w>p
  omenu 70.301 &Window.New\ V-&Split<Tab>^Ws 
 \ <C-O><C-w>v<C-O><C-w>p<C-O>:enew<CR><C-O><C-w>p

endif

" MRU Buffer Jumping
" --------------------------------
" Map F12 to Ctrl-^, to toggle between the 
" current buffer and the last used buffer.
" But first!
"   Turn on hidden, so if we're on a modified 
"   buffer, we can hide it without getting a 
"   warning
set hidden
map <F12> :e #<CR>
" inoremap <F12> <C-O>:e #<CR>
" cnoremap <F12> <C-C>:e #!<CR>
" onoremap <F12> <C-C>:e #<CR>
"TODO My keyboard's Fn keys are still
"     jacked (i.e., they don't work!), 
"     so make sure you test the above
"     when your keys are fixed!!
" Allow toggling between MRU buffers
" from Insert mode
inoremap <C-^> <C-O>:e #<CR>
inoremap <C-6> <C-O>:e #<CR>
" cnoremap <F12> <C-C>:e #!<CR>
" onoremap <F12> <C-C>:e #<CR>

" --------------------------------
"  EditPlus // Editing Controls
" --------------------------------

" TODO Should any of the following be mapped:
"      -- to Command mode (cmap)?
"      -- to Operator-pending mode (omap)?
"      -- to Visual mode (vmap)?

" A Better Backspace
" --------------------------------

" Ctrl-Backspace deletes to start of word
noremap <C-BS> db
inoremap <C-BS> <C-O>db

" Ctrl-Shift-Backspace deletes to start of line
noremap <C-S-BS> d<Home>
inoremap <C-S-BS> <C-O>d<Home>

" A Delicious Delete
" --------------------------------

" In EditPlus, Ctrl-Delete deletes characters 
" starting at the cursor and continuing to the 
" end of the word, or until certain punctuation. 
" If the cursor is on whitespace instead of a
" non-whitespace character, Ctrl-Delete just 
" deletes the continuous block of whitespace, 
" up until the next non-whitespace character.
"
" In Vim, the 'dw' and 'de' commands perform
" similarly, but they include whitespace, either 
" after the word is deleted ('dw'), or before 
" it ('de'). Therefore, to achieve the desired 
" behaviour -- such that contiguous blocks of 
" whitespace and non-whitespace are treated 
" independently -- we need a function to tell 
" if the character under the cursor is whitespace 
" or not, and to call 'dw' or 'de' as appropriate.
" NOTE Was originally called DeleteToEndOfWord, 
"      but really,
"   DeleteToEndOfWhitespaceAlphanumOrPunctuation
function! s:Del2EndOfWsAz09OrPunct()
  " If the character under the cursor is 
  " whitespace, do 'dw'; if it's an alphanum, do 
  " 'dw'; if punctuation, delete one character
  " at a time -- this way, each Ctrl-Del deletes 
  " a sequence of characters or a chunk of 
  " whitespace, but never both (and punctuation 
  " is deleted one-by-one, seriously, this is 
  " the way's I like's it).
  let char_under_cursor = 
    \ getline(".")[col(".") - 1]
  " Can't get this to work:
  "    if char_under_cursor =~ "[^a-zA-Z0-9\\s]"
  " But this works:
  if (char_under_cursor =~ "[^a-zA-Z0-9]")
        \ && (char_under_cursor !~ "\\s")
    " Punctuation et al.; just delete the 
    " char or sequence of the same char.
    " Well, I can't get sequence-delete to 
    " work, i.e.,
    "      execute 'normal' . 
    "        \ '"xd/' . char_under_cursor . '*'
    " doesn't do squat. In fact, any time I try 
    " the 'd/' motion it completely fails...
    " Anyway, enough boo-hooing, just delete the 
    " character-under-cursor:
    execute 'normal' . '"xdl'
  elseif char_under_cursor =~ '[a-zA-Z0-9]'
    " This is an alphanum; and same spiel as 
    " above, using 'd/' does not work, so none of 
    " this: 
    "   execute 'normal' . '"xd/[a-zA-Z0-9]*'
    " Instead try this:
    "execute 'normal' . '"xde'
    execute 'normal' . '"xdw'
  elseif char_under_cursor =~ '\s'
    " whitespace
    " Again -- blah, blah, blah -- this does not 
    " work: execute 'normal' . '"xd/\s*'
    execute 'normal' . '"xdw'
  " else
  "   huh? this isn't/shouldn't be 
  "         an executable code path
  endif
endfunction
" Map the function to Ctrl-Delete in normal and 
" insert modes.
noremap <C-Del> :call <SID>Del2EndOfWsAz09OrPunct()<CR>
inoremap <C-Del> 
         \ <C-O>:call <SID>Del2EndOfWsAz09OrPunct()<CR>

" Ctrl-Shift-Delete deletes to end of line
noremap <C-S-Del> d$
inoremap <C-S-Del> <C-O>d$

" Alt-Shift-Delete deletes entire line
noremap <M-S-Del> dd
inoremap <M-S-Del> <C-O>dd

" Fix That Shift
" --------------------------------
" Vim's default Ctrl-Shift-Left/Right behavior is 
" to select all non-whitespace characters (see 
" :help v_aW). We want to change this to not be 
" so liberal. Use vmap to change how Vim selects 
" text in visual mode. By using 'e' instead of 
" 'aW', for example, Vim selects alphanumeric 
" blocks but doesn't cross punctuation boundaries.
" In other words, we want to select blocks of 
" whitespace, alphanums, or punctuation, but 
" never combinations thereof.
" TODO This still isn't quite right -- the first 
"      selection is always too great, i.e., the 
"      cursor jumps boundaries 'b' and 'e' 
"      wouldn't
vnoremap <C-S-Left> b
vnoremap <C-S-Right> e

" Character Transposition
" --------------------------------
" Transpose two characters when in Insert mode
" NOTE We can't just 'Xp' and be all happy -- 
"      rather, if we're at the first column 
"      (start) of the line, 'Xp' does something 
"      completely different. So use 'Xp' if the 
"      cursor is anywhere but the first column, 
"      but use 'xp' otherwise.
function s:TransposeCharacters()
  let cursorCol = col('.')
  if 1 == cursorCol
    execute 'normal ' . 'xp'
  else
    execute 'normal ' . 'Xp'
  endif
endfunction
inoremap <C-T> 
  \ <C-o>:call <SID>TransposeCharacters()<CR>
" NOTE Make a mapping for normal mode -- 
"      but this obscures the original Ctrl-T 
"      command, which inserts a tab at the 
"      beginning of the line; see :help Ctrl-t

" Command-line Copy
" --------------------------------
" gVim/win maps Ctrl-C to yank, but only 
" in Normal and Insert modes. Here we make 
" it so Ctrl-C also works in the 
" Command-line window.
cmap <C-C> <C-Y>

" Indent Selected Text
" --------------------------------
" Vim's <Tab> is used to move the cursor 
" according to the jump list, but it's silly. 
" I.e., in Insert mode, if you have nothing 
" selected, <Tab> does what? Inserts a <Tab>. 
" What happens if you have text selected? 
" And I mean besides entering visual edit mode?
" My computer rings the bell and the Vim window 
" does a quiet beep (so... nothing!).
"
" Thusly, use Tab/Shift-Tab to add/remove indents
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" NOTE Also remember that == smartly fixes  
"      the indent of the line-under-cursor

" --------------------------------
"  EditPlus // Document Navigation
" --------------------------------

" Sane Scrolling
" --------------------------------
" Map Ctrl-Up and Ctrl-Down to scrolling
" the window 'in the buffer', as the :help
" states. Really, it just moves the scrollbar,
" i.e., scrolls your view without moving your
" cursor.
noremap <C-Up> <C-y>
inoremap <C-Up> <C-O><C-y>
cnoremap <C-Up> <C-C><C-y>
onoremap <C-Up> <C-C><C-y>
noremap <C-Down> <C-e>
inoremap <C-Down> <C-O><C-e>
cnoremap <C-Down> <C-C><C-e>
onoremap <C-Down> <C-C><C-e>

" Quick Cursor Jumping
" --------------------------------
" EditPlus, among other editors, maps Ctrl-PageUp
" and Ctrl-PageDown to moving the cursor to the 
" top and bottom of the window (equivalent to 
" H and L in Vim (which also defines M to jump 
" to the middle of the window, which is not 
" mapped here)).
" NOTE In a lot of programs, C-PageUp/Down go to 
"      next/previous tab page; not so here, see
"      Alt-PageUp/Down for that.
noremap <C-PageUp> H
inoremap <C-PageUp> <C-O>H
noremap <C-PageDown> L
inoremap <C-PageDown> <C-O>L

" Ctrl-Tab is for Tabs, Silly... no wait, Buffers!
" --------------------------------
" mswin.vim maps Ctrl-Tab to Next Window. To be 
" more consistent with Windows (the OS), Ctrl-Tab 
" should map to Next Tab... but in this case, I'm 
" going to deviate from the norm and ask that you 
" tab-holders-onners let go and try thinking in 
" terms of buffers. It's all about the buffers, 
" benjamin! (baby?)

" TODO The cursor is not preserved between 
"      buffers! So make code that restores 
"      the cursor...

" This is Ctrl-Tab to Next Buffer
noremap <C-Tab> :bn<CR>
inoremap <C-Tab> <C-O>:bn<CR>
cnoremap <C-Tab> <C-C>:bn<CR>
onoremap <C-Tab> <C-C>:bn<CR>
snoremap <C-Tab> <C-C>:bn<CR>

" This is Ctrl-Shift-Tab to Previous Buffer
noremap <C-S-Tab> :bN<CR>
inoremap <C-S-Tab> <C-O>:bN<CR>
cnoremap <C-S-Tab> <C-C>:bN<CR>
onoremap <C-S-Tab> <C-C>:bN<CR>
snoremap <C-S-Tab> <C-C>:bN<CR>

" NOTE Change :bn to :tabn and :bN to :tabN 
"      if you'd rather have your tabs back

" Ctrl-Shift-PageUp/Down Jumps Windows
" --------------------------------
" NOTE We're using the Shift modifier since 
"      Ctrl-PageUp/Down is used to move the 
"      cursor to the top and bottom of the 
"      screen.

" This is Ctrl-Shift-PageDown to Next Window
noremap <C-S-PageDown> <C-W>w
inoremap <C-S-PageDown> <C-O><C-W>w
cnoremap <C-S-PageDown> <C-C><C-W>w
onoremap <C-S-PageDown> <C-C><C-W>w

" And this is Ctrl-Shift-PageUp to Previous Window
noremap <C-S-PageUp> <C-W>W
inoremap <C-S-PageUp> <C-O><C-W>W
cnoremap <C-S-PageUp> <C-C><C-W>W
onoremap <C-S-PageUp> <C-C><C-W>W

" Karma's an Itch
" --------------------------------
" We taketh, and we giveth.
" Re-map next and previous tab, since we 
" took away Ctrl-PageUp/Down earlier.

" This is Alt-PageDown to Next Tab Page
" NOTE gt is the Normal mode shortcut
noremap <M-PageDown> :tabn<CR>
inoremap <M-PageDown> <C-O>:tabn<CR>
cnoremap <M-PageDown> <C-C>:tabn<CR>
onoremap <M-PageDown> <C-C>:tabn<CR>

" This is Alt-PageUp to Previous Tab Page
" NOTE gT is the Normal mode shortcut
noremap <M-PageUp> :tabN<CR>
inoremap <M-PageUp> <C-O>:tabN<CR>
cnoremap <M-PageUp> <C-C>:tabN<CR>
onoremap <M-PageUp> <C-C>:tabN<CR>

" --------------------------------
"  EditPlus // Special Windows
" --------------------------------

" EditPlus maps Alt-Shift-1..3 to three special 
" windows:
"   1. The so-called Cliptext window, which shows 
"      a list of ANSI characters;
"   2. The Directory window, which shows you your 
"      files; and
"   3. The Output window, which shows search   
"      results.

" NOTE It's not <M-S-1> or <M-S-2>, etc., 
"      but rather <M-!> and <M-@>, etc.... 

" Alt-Shift-1 // Toggle Cliptext
" --------------------------------
" EditPlus has a cool ANSI chart you can bring up 
" quickly (who isn't always referring to ANSI 
" charts?). Our Vim substitute is an even 
" awesomer interactive ASCII table by Christian 
" Habermann.
" NOTE Does not work: nnoremap <M-!> <Leader>ct
nmap <M-!> <Leader>ct
imap <M-!> <C-o><Leader>ct<ESC>
" TODO imap does not restore i-mode when ct done
" NOTE Modified chartab.vim to alias <ESC> and 
"      <M-!> to 'q'
" NOTE chartab.vim opens in new buffer in same 
"      window, rather than creating new vertical 
"      window on left of view and opening there
"      NOTE You can work-around by opening in 
"           QFix window
"           i.e., Alt-Shift-2 followed by 
"                 Alt-Shift-1

" Alt-Shift-2 // Toggle Search Results
" --------------------------------
" Or, in Vim terms, quickfix window
" BUGBUG Sometimes after closing quickfix
"        toggling the window no longer 
"        works (you'll see :QFix in the 
"        command-line window but nothing
"        happens). For now, just use 
"        :copen to force it open, then 
"        toggling works again.
" (Note: It's M-@, not M-S-3)
nnoremap <M-@> :QFix<CR>
inoremap <M-@> <C-O>:QFix<CR>
"cnoremap <M-@> <C-C>:QFix<CR>
"onoremap <M-@> <C-C>:QFix<CR>

" Alt-Shift-3 // Toggle File Browser
" --------------------------------
" NERDTree to the rescue.
" (Note: It's M-#, not M-S-3)
noremap <M-#> :NERDTreeToggle<CR>
inoremap <M-#> <C-O>:NERDTreeToggle<CR>
"cnoremap <M-#> <C-C>:NERDTreeToggle<CR>
"onoremap <M-#> <C-C>:NERDTreeToggle<CR>

" TODO Alt-Shift-4 // Toggle Project Browser
" --------------------------------
" EditPlus doesn't necessarily have an 
" Alt-Shift-4 mapping, but it does have 
" a Project menu. This is similar. But 
" better. =)
" NOTE noremap does not work
nmap <silent> <M-$> <Plug>ToggleProject
imap <silent> <M-$> <C-O><Plug>ToggleProject
"cmap <silent> <M-$> <C-C><Plug>ToggleProject
"omap <silent> <M-$> <C-C><Plug>ToggleProject

" Alt-Shift-5 // Toggle HTML Char Table
" --------------------------------
" This also isn't in EditPlus, but it's 
" similar to the Alt-Shift-1 Cliptext 
" window, only this window shows you 
" HTML Character Entity translations.
" (Note: It's M-%, not M-S-5)
nmap <M-%> <Plug>HCT_ToggleLookup
imap <M-%> <C-O><Plug>HCT_ToggleLookup<ESC>
"cmap <M-%> <C-C><Plug>HCT_ToggleLookup<ESC>
"omap <M-%> <C-C><Plug>HCT_ToggleLookup<ESC>

" Alt-Shift-7 // Toggle Mini Buffer Explorer
" --------------------------------
" First, configure MiniBufExplorer
" to show up just above the status line
" (at the bottom of the gVim window, 
"  rather than at the top)
let g:miniBufExplSplitBelow=1
" I get distracted opening the second buffer
let g:miniBufExplorerMoreThanOne=1
" Start w/ minibufexpl off
let s:MiniBufExplFile = "textile.rb"
let s:MiniBufExplPath = ""
let s:MiniBufExplLoaded = -1
let s:MiniBufExplFile = "minibufexpl.vim"
if filereadable($HOME . "/.vim/plugin/" 
                \ . s:MiniBufExplFile)
  " $HOME/.vim is just *nix
  let s:MiniBufExplPath = $HOME 
    \ . "/.vim/plugin/" . s:MiniBufExplFile
elseif filereadable($USERPROFILE 
                    \ . "/vimfiles/plugin/" 
                    \ . s:MiniBufExplFile)
  " $HOME/vimfiles is just Windows
  let s:MiniBufExplPath = $USERPROFILE 
    \ . "/vimfiles/plugin/" 
    \ . s:MiniBufExplFile
"elseif
  " TODO What about Mac? Probably just 
  "      like *nix, right?
elseif filereadable($VIMRUNTIME 
                    \ . "/plugin/" 
                    \ . s:MiniBufExplFile)
  " $VIMRUNTIME works for both *nix and Windows
  let s:MiniBufExplPath = $VIMRUNTIME 
    \ . "/plugin/" . s:MiniBufExplFile
endif
execute "source " . s:MiniBufExplPath
autocmd VimEnter * nested
    \ let greatest_buf_no = bufnr('$') |
    \ if (greatest_buf_no == 1) 
    \     && (bufname(1) == "") |
    \   execute "CMiniBufExplorer" |
    \ endif
" Next, map Alt-Shift-7 to Toggle it
nmap <M-&> <Plug>TMiniBufExplorer
imap <M-&> <C-O><Plug>TMiniBufExplorer
"cmap <M-&> <C-C><Plug>HCT_ToggleLookup<ESC>
"omap <M-&> <C-C><Plug>HCT_ToggleLookup<ESC>

" ------------------------------------------
" ----------------------------------- EOF --

