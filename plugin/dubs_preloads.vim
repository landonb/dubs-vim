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

" ------------------------------------------------------
" Viki settings
" ------------------------------------------------------

" This is a no-op unless you've installed Viki.
" https://github.com/tomtom/viki_vim

" MAYBE: Set VikiMinorMode? Anything else?

let g:vikiOpenFileWith_html  = "silent !firefox %{FILE}"

" ------------------------------------------------------
" MacVim Alt-key sequence mapping enablement
" ------------------------------------------------------

" FIXME/2020-08-26: Find a better spot for this.
if has('macunix')
  set macmeta
  "
  let macvim_skip_colorscheme=1
  let macvim_skip_cmd_opt_movement=1
" a test:
  let macvim_hig_shift_movement=1
endif

