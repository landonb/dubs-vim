" Vim startup script sourced before system scripts are loaded.
" Author: Landon Bouma (landonb &#x40; retrosoft &#x2E; com)
" Project: https://github.com/landonb/dubs-vim#🖖
" License: https://creativecommons.org/publicdomain/zero/1.0/

" ------------------------------------------
" About:

" If you want to set any g:global variables to override stock
" Vim script behavior, you have to set the globals *before*
" sourcing the shared Vim files. So the `.vimrc` for Dubs Vim
" sources this script before loading any system scripts.

" ------------------------------------------------------------
" Add user local bin to path.
" ------------------------------------------------------------

let s:user_local_bin_path = $HOME . '/.local/bin'
if isdirectory(s:user_local_bin_path)
  let $PATH = $PATH . ':' . s:user_local_bin_path
endif

" ------------------------------------------------------------
" Add system usr local bin to path.
" ------------------------------------------------------------

" 2020-09-23: Added so Vim Coc can run Homebrew node.
let s:usr_local_bin_path = '/usr/local/bin'
if isdirectory(s:usr_local_bin_path)
  let $PATH = $PATH . ':' . s:usr_local_bin_path
endif

" ------------------------------------------------------------
" Add user gopath bin to path.
" ------------------------------------------------------------

let s:user_gopath_bin_path = $HOME . '/.gopath/bin'
if isdirectory(s:user_gopath_bin_path)
  let $PATH = $PATH . ':' . s:user_gopath_bin_path
endif

" ------------------------------------------------------------
" Extend the reST syntax highlighter's code vocabulary
" by overriding the ``.. code-block:: <language>`` mapping.
" ------------------------------------------------------------
" SYNC_ME: Similar *.rst changes in dubs_ftyle_mess's
"          dubs_preloads.vim and rst_dubsvim.vim.
"
" Sets: g:rst_syntax_code_list

let s:plugin_dubs_ftyle_mess_preload =
  \ $HOME . '/.vim/pack/landonb/start/dubs_ftype_mess/plugin/dubs_preloads.vim'
if filereadable(s:plugin_dubs_ftyle_mess_preload)
  execute 'source ' . s:plugin_dubs_ftyle_mess_preload
endif

" ======================================================
" ------------------------------------------------------
" ======================================================

" MAYBE/2022-12-07: The remainding config could be farmed out to another
" plugin script, because it doesn't really fit in here. But the core of
" Dubs Vim is pretty bare (99.9% of features are from plugins), and this
" being the only ~/.vim/plugin/ file so far, and so long as from here to
" the end of the file is just a few crumbs, well, I'll abide.

" ------------------------------------------------------
" Viki settings
" ------------------------------------------------------

" This is a no-op unless you've installed Viki.
" https://github.com/tomtom/viki_vim

let g:vikiOpenFileWith_html = "silent !firefox %{FILE}"

" ------------------------------------------------------
" MacVim Alt-key sequence mapping enablement
" ------------------------------------------------------

" CXREF: /Applications/MacVim.app/Contents/Resources/vim/gvimrc

if has('macunix')
  " Enable Alt-key (aka Meta, aka Option) mappings (e.g., <M-a>).
  set macmeta

  " Don't let MacVim call `colorscheme macvim`.
  " - Dubs Vim sets its own colorscheme (see plugin
  "   ~/.vim/pack/landonb/start/dubs_after_dark/).
  " - CXREF: :h macvim-colorscheme
  let macvim_skip_colorscheme=1

  " Glossary: HIG: Apple's Human interface Guidelines.

  " Disable HIG Cmd and Option (Alt) movement mappings.
  " - Dubs Vim makes its own mappings.
  " - CXREF: :h alt-movement
  let macvim_skip_cmd_opt_movement=1

  " Enable so-called HIG shift movement, which makes Vim a little more like
  " GUI text editors, e.g., holding down Shift + a movement key will extend
  " the selection.
  " - Dubs Vim makes its own mappings.
  " - CXREF: :h macvim-shift-movement
  let macvim_hig_shift_movement=1
endif

" ------------------------------------------------------
" NERDCommenter config
" ------------------------------------------------------

" 2022-12-07: AFAIK, we cannot control plugin load order, and I'm
" seeing NERDCommenter loading (and setting its mappings, which I
" don't want) before another plugin runs and disables the default
" mappings setting. So guesswegotta do it here.

let g:NERDCreateDefaultMappings = 0

