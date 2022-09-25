@@@@@@@@@@@@@@@@@@
Dubs Vim Reference
@@@@@@@@@@@@@@@@@@

##################
Dubs Vim Reference
##################

Dubs Vim Reference
==================

See the
`Dubs Vim installation instructions <README.rst#Installation>`__
if you want to download and install Dubs Vim.

About Dubs Vim
--------------

Dubs Vim is one developer's Vim IDE, assembled from a legion of awesome plugins.

Project page: https://github.com/landonb/dubs-vim

About this File
---------------

This document combines all the Dubs Vim plugin READMEs into one file.

You'll find links to each plugin in the following lists,
and you'll find documentation for *everything Dubs* below that!

About this Project
------------------

This project is not a Vim plugin itself, but a collection of
one developers favorite plugins, including their own plugins
and other individuals' plugins.

The plugins used to be included as git submodules, but submodules
are a chore to manage. Fortunately Vim now makes it easier to use
an external multiple repository manager (such as ``myrepos``) to
manage your Vim packages and plugins. So now the plugins are just
referenced from documentation; and it's up to you, the developer-
user, to install and manage them yourself.

tl;dr, you probably don't want to clone and install this project
(e.g., to ``~/.vim``), but you may be curious what Vim plugins I
use and recommend (and maintain).

List of Dubs Vim Plugins
^^^^^^^^^^^^^^^^^^^^^^^^

.. To generate the list of your plugs, copy-and-paste reST-ready:
    cd ~/.vim/pack && tree -d -L 3 -f | \
      grep -e '│       ├──' \
           -e '│       └──' \
           -e '│   │   ├──' \
           -e '│   │   └──' \
           -e '    │   ├──' \
           -e '    │   └──' \
           -e '        └──' \
      | sed s'#[^.]\+\./\(.*\)#\1#' \
      | sed s'#\([^/]\+\)/\([^/]\+\)/\([^/]\+\)#\2: \3: \`\3 <https://github.com/\1/\3>\`__#' \
      | sort \
      | less
.. Using a `| wc -l` instead of `less` and I see: 96 plugins.

These are plugins I've developed and continue to maintain:

.. FIXME/2021-08-15 20:25: LATER: Add once you've forked and published:
.. | `vim-reST-highline <https://github.com/landonb/vim-reST-highline>`__: ...

.. table::
  :widths: 25 75

  ============================================================================================  ==============================================================================================================
  `dubs_after_dark <https://github.com/landonb/dubs_after_dark>`__                              Compelling light on dark color scheme (that uses true black).
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_appearance <https://github.com/landonb/dubs_appearance>`__                              Configure basic Vim look n' feel (that appeals to the author).
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_buffer_fun <https://github.com/landonb/dubs_buffer_fun>`__                              Manage Buffers and Windows.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_edit_juice <https://github.com/landonb/dubs_edit_juice>`__                              Powerful Text Editing commands.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_file_finder <https://github.com/landonb/dubs_file_finder>`__                            Find and Open Files.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_ftype_mess <https://github.com/landonb/dubs_ftype_mess>`__                              Filetype-specific features, like syntax highlighters, etc.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_grep_steady <https://github.com/landonb/dubs_grep_steady>`__                            Clever Text Search including Replace.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_html_entities <https://github.com/landonb/dubs_html_entities>`__                        HTML Entity table.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_mescaline <https://github.com/landonb/dubs_mescaline>`__                                *Choice* Status Line.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_project_tray <https://github.com/landonb/dubs_project_tray>`__                          Project plugin wrapper.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_quickfix_wrap <https://github.com/landonb/dubs_quickfix_wrap>`__                        Elegant Quickfix wrapper.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_style_guard <https://github.com/landonb/dubs_style_guard>`__                            Automatically set whitespace and line-length settings.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_syntastic_wrap <https://github.com/landonb/dubs_syntastic_wrap>`__                      Syntastic wrapper.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_toggle_textwrap <https://github.com/landonb/dubs_toggle_textwrap>`__                    Simple text wrapping wrapper.
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `dubs_web_hatch <https://github.com/landonb/dubs_web_hatch>`__                                ``sensible-browser`` mappings (cross-platform hyperlink opener).
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-classic-taglist <https://github.com/landonb/vim-classic-taglist>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-command-line-clock <https://github.com/landonb/vim-command-line-clock>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-lcd-project-root <https://github.com/landonb/vim-lcd-project-root>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-netrw-cfg-split-explorer <https://github.com/landonb/vim-netrw-cfg-split-explorer>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-netrw-link-resolve <https://github.com/landonb/vim-netrw-link-resolve>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-nicer-file-changed-prompt <https://github.com/landonb/vim-nicer-file-changed-prompt>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-ovm-easyescape-kj-jk <https://github.com/landonb/vim-ovm-easyescape-kj-jk>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-ovm-seven-of-spines <https://github.com/landonb/vim-ovm-seven-of-spines>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-reSTfold <https://github.com/landonb/vim-reSTfold>`__                                    Innovative reStructuredText document folding (manage notes like a pro).
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-reST-highdefs <https://github.com/landonb/vim-reST-highdefs>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-reST-highfive <https://github.com/landonb/vim-reST-highfive>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-select-mode-stopped-down <https://github.com/landonb/vim-select-mode-stopped-down>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-source-reloader <https://github.com/landonb/vim-source-reloader>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-title-bar-time-of-day <https://github.com/landonb/vim-title-bar-time-of-day>`__
  --------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  `vim-tmux-navigator <https://github.com/landonb/vim-tmux-navigator>`__
  ============================================================================================  ==============================================================================================================

.. AWAIT/2022-09-21: Add DepoXy/waffle-batter-vim, once published: https://github.com/wafflbattr/waffle-batter-vim
.. SKIPD/2022-09-21: DepoXy/vim-trap is private, but worth calling out: https://github.com/YOU/vim-trap

List of Forked Plugins
^^^^^^^^^^^^^^^^^^^^^^

These are plugins I've forked to add value (but haven't bothered asking
upstream to incorporate the changes, either because it wouldn't mesh
with the upstream project's goals, or because I'm lazy):

| `ansible-vim <https://github.com/landonb/ansible-vim>`__:
    "A vim plugin for syntax highlighting Ansible's common filetypes."
      (Upstream: `ansible-vim <https://github.com/pearofducks/ansible-vim>`__)
| `QFEnter <https://github.com/landonb/QFEnter>`__:
    "Open a Quickfix item in a window you choose."
      (Upstream: `QFEnter <https://github.com/yssl/QFEnter>`__)
| `vim-buffer-ring <https://github.com/landonb/vim-buffer-ring>`__:
    "Surf through buffers based on viewing history per window."
      (Upstream: `vim-bufsurf <https://github.com/ton/vim-bufsurf>`__)
| `vim-jsx <https://github.com/landonb/vim-jsx>`__:
    "React JSX syntax highlighting and indenting for Vim."
      (Upstream: `vim-jsx <https://github.com/mxw/vim-jsx>`__)
| `vim-markdown <https://github.com/landonb/vim-markdown>`__:
    "Markdown for Vim."
      (Upstream: `vim-markdown <https://github.com/gabrielelana/vim-markdown>`__)
| `vim-surround <https://github.com/landonb/vim-surround>`__:
    "Quoting and parenthesizing made simple."
      (Upstream: `vim script <http://www.vim.org/scripts/script.php?script_id=1697>`__,
                 `vim-surround <https://github.com/tpope/vim-surround>`__)
| `vim-unimpaired <https://github.com/landonb/vim-unimpaired>`__:
    "Pairs of handy bracket mappings."
      (Upstream: `vim script <http://www.vim.org/scripts/script.php?script_id=1590>`__,
                 `vim-unimpaired <https://github.com/tpope/vim-unimpaired>`__)

List of Third-party Plugins
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The are awesome third-party plugins I find useful or otherwise curious:

| `AutoAdapt <https://github.com/vim-scripts/AutoAdapt>`__:
    "Automatically adapt timestamps, copyright notices, etc."
      [`vim script <http://www.vim.org/scripts/script.php?script_id=4654>`__]
| `coc-json <https://github.com/neoclide/coc-json>`__
| `coc.nvim <https://github.com/neoclide/coc.nvim>`__
| `coc-tsserver <https://github.com/neoclide/coc-tsserver>`__
| `command-t <https://github.com/wincent/command-t>`__:
    "Fast file navigation for VIM"
| `ctrlp.vim <https://github.com/kien/ctrlp.vim>`__:
    "Fuzzy file, buffer, mru, tag, etc finder."
      [`deets <https://kien.github.io/ctrlp.vim/>`__]
| `editorconfig-vim <https://github.com/editorconfig/editorconfig-vim>`__:
    "EditorConfig plugin for Vim"
      [`more <http://editorconfig.org/>`__]
| `fzf.vim <https://github.com/junegunn/fzf.vim>`__
| `goyo.vim <https://github.com/junegunn/goyo.vim>`__:
    "Distraction-free writing in Vim"
| `improvedft <https://github.com/chrisbra/improvedft>`__
| `ingo-library <https://github.com/vim-scripts/ingo-library>`__:
    "Vimscript library of common functions."
      [`vim script <http://www.vim.org/scripts/script.php?script_id=4433>`__]
| `limelight.vim <https://github.com/junegunn/limelight.vim>`__:
    "|flashlight| All the world's indeed a stage and we are merely players"
| `matchit <https://github.com/chrisbra/matchit>`__
| `nerdcommenter <https://github.com/preservim/nerdcommenter>`__
| `syntastic <https://github.com/scrooloose/syntastic>`__:
    "Syntax checking hacks for vim"
| `tagbar <https://github.com/majutsushi/tagbar>`__
| `tcomment_vim <https://github.com/tomtom/tcomment_vim>`__:
    "An extensible & universal comment plugin"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=1173>`__,
       see also: `vim-commentary <https://github.com/tpope/vim-commentary>`__]
| `tlib_vim <https://github.com/tomtom/tlib_vim>`__:
    "Some utility functions for VIM"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=1863>`__]
| `typescript-vim <https://github.com/leafgarland/typescript-vim>`__
| `vim-colorschemes <https://github.com/flazz/vim-colorschemes>`__
| `vim-easyescape <https://github.com/zhou13/vim-easyescape>`__
| `vim-gnupg <https://github.com/jamessan/vim-gnupg>`__:
    "transparent editing of gpg encrypted files."
  [`vim script <http://www.vim.org/scripts/script.php?script_id=3645>`__]
| `vim-istanbul <https://github.com/juanpabloaj/vim-istanbul>`__
| `vim-javascript <https://github.com/pangloss/vim-javascript>`__:
    "Vastly improved Javascript indentation and syntax support in Vim.
      [`vim script <http://www.vim.org/scripts/script.php?script_id=4452>`__]
| `vim-js <https://github.com/yuezk/vim-js>`__
| `vim-jsx-pretty <https://github.com/MaxMEllon/vim-jsx-pretty>`__
| `vim-mergetool <https://github.com/samoshkin/vim-mergetool>`__
| `vim-misc <https://github.com/xolox/vim-misc>`__:
    "Miscellaneous auto-load Vim scripts"
      [`more <https://peterodding.com/code/vim/misc/>`__]
| `vim-python-matchit <https://github.com/voithos/vim-python-matchit>`__
| `vim-toml <https://github.com/cespare/vim-toml>`__
| `yats.vim <https://github.com/HerringtonDarkholme/yats.vim>`__
| `ZoomWin <https://github.com/vim-scripts/ZoomWin>`__

.. |flashlight| unicode:: 0x1F526 .. flashlight

List of Tim Pope Plugins
^^^^^^^^^^^^^^^^^^^^^^^^

These plugins are maintained by the venerable `Tim Pope <https://github.com/tpope>`__:

| `vim-abolish <https://github.com/tpope/vim-abolish>`__
| `vim-fugitive <https://github.com/tpope/vim-fugitive>`__:
    "fugitive.vim: a Git wrapper so awesome, it should be illegal"
  [`vim script <http://www.vim.org/scripts/script.php?script_id=2975>`__]
| `vim-jdaddy <https://github.com/tpope/vim-jdaddy>`__
| `vim-speeddating <https://github.com/tpope/vim-speeddating>`__:
    "speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=2120>`__]
| `vim-vinegar <https://github.com/tpope/vim-vinegar>`__:
    "vinegar.vim: combine with netrw to create a delicious salad dressing"

List of Less-used Plugins
^^^^^^^^^^^^^^^^^^^^^^^^^

These plugins that I no longer use (or rarely use) but that I still have installed:

| `jellybeans.vim <https://github.com/nanotech/jellybeans.vim>`__:
    "A colorful, dark color scheme for Vim."
      [`vim.org <http://www.vim.org/scripts/script.php?script_id=2555>`__]
| `nord-vim <https://github.com/arcticicestudio/nord-vim>`__:
    "An arctic, north-bluish clean and elegant Vim theme."
| `TeTrIs.vim <https://github.com/vim-scripts/TeTrIs.vim>`__:
    "A tetris game in pure vim"
| `viki_vim <https://github.com/tomtom/viki_vim>`__:
    "A personal wiki for Vim"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=861>`__]
| `vim-rails <https://github.com/tpope/vim-rails>`__:
    "rails.vim: Ruby on Rails power tools"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=1567>`__]

List of Retired Plugins
^^^^^^^^^^^^^^^^^^^^^^^

For posterity, here are plugins that I used to use, but that I've since stopped using
(this is not a judgement on their merits: sometimes I use certain plugins with certain
technologies that I no longer use, or I maybe some functionality has since been 
incorporated into Vim itself, or maybe I found a different plugin, who knows):

| `asyncomplete-lsp.vim <https://github.com/prabirshrestha/asyncomplete-lsp.vim>`__
| `asyncomplete.vim <https://github.com/prabirshrestha/asyncomplete.vim>`__
| `async.vim <https://github.com/prabirshrestha/async.vim>`__
| `nerdtree <https://github.com/scrooloose/nerdtree>`__:
    "A tree explorer plugin for vim."
| `vim-commentary <https://github.com/tpope/vim-commentary>`__
| `vim-endwise <https://github.com/tpope/vim-endwise>`__:
    "endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc"
  [`vim script <http://www.vim.org/scripts/script.php?script_id=2386>`__]
| `vim-go <https://github.com/editorconfig/vim-go>`__
| `vim-lsp-javascript <https://github.com/ryanolsonx/vim-lsp-javascript>`__
| `vim-lsp-settings <https://github.com/mattn/vim-lsp-settings>`__
| `vim-lsp-typescript <https://github.com/ryanolsonx/vim-lsp-typescript>`__
| `vim-lsp <https://github.com/prabirshrestha/vim-lsp>`__
| `vim-pathogen <https://github.com/tpope/vim-pathogen>`__
| `vim-restructuredtext <https://github.com/marshallward/vim-restructuredtext>`__
| `vim-scriptease <https://github.com/tpope/vim-scriptease>`__:
    "scriptease.vim: A Vim plugin for Vim plugins"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=4394>`__]
| `vim-vividchalk <https://github.com/tpope/vim-vividchalk>`__:
    "vividchalk.vim: a colorscheme strangely reminiscent of Vibrant Ink for a certain OS X editor"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=1891>`__]

Plugins that I used to develop or that I forked, but no longer use:

| `dubs_cycloplan <https://github.com/landonb/dubs_cycloplan>`__
| `vim-jsx <https://github.com/landonb/vim-jsx>`__

Comprehensive Feature List
--------------------------

Each plugin's README.rst is reproduced herein to give a nice,
comprehensive (albeit lengthy) list of all the features.

Most of the features and key mappings are specific to Dubs Vim,
but a few commonly-used (or commonly-forgotten) Vim commands are
also included.

Features are grouped into categories and are identified by
their keyboard mapping or ``:command`` name, followed by a
brief description of the feature and then more detailed notes.

.. NOTE: For security reasons, the include directive does not
..       work on GitHub. E.g., we cannot simply
..
..        .. include:: https://github.com/landonb/dubs_after_dark/README.rst
..        .. include:: ...
..
..       so instead we'll assemble this file from a script, readme-using.make.sh,
..       which appends all the package docs to this file.

