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

These are plugins I've developed and continue to maintain:

.. | `dubs_after_dark <https://github.com/landonb/dubs_after_dark>`__: Compelling light on dark color scheme.
.. | `dubs_appearance <https://github.com/landonb/dubs_appearance>`__: Configure basic Vim look n' feel.
.. | `dubs_buffer_fun <https://github.com/landonb/dubs_buffer_fun>`__: Manage Buffers and Windows.
.. | `dubs_edit_juice <https://github.com/landonb/dubs_edit_juice>`__: Powerful Text Editing commands.
.. | `dubs_file_finder <https://github.com/landonb/dubs_file_finder>`__: Find and Open Files.
.. | `dubs_ftype_mess <https://github.com/landonb/dubs_ftype_mess>`__: Filetype-specific features, like syntax highlighters, etc.
.. | `dubs_grep_steady <https://github.com/landonb/dubs_grep_steady>`__: Clever Text Search including Replace.
.. | `dubs_html_entities <https://github.com/landonb/dubs_html_entities>`__: HTML Entity table.
.. | `dubs_mescaline <https://github.com/landonb/dubs_mescaline>`__: Simple, elegant status line.
.. | `dubs_project_tray <https://github.com/landonb/dubs_project_tray>`__: Project plugin wrapper.
.. | `dubs_quickfix_wrap <https://github.com/landonb/dubs_quickfix_wrap>`__: Elegant Quickfix wrapper.
.. | `dubs_style_guard <https://github.com/landonb/dubs_style_guard>`__: Automatically set whitespace and line-length settings.
.. | `dubs_syntastic_wrap <https://github.com/landonb/dubs_syntastic_wrap>`__: Syntastic wrapper.
.. | `dubs_toggle_textwrap <https://github.com/landonb/dubs_toggle_textwrap>`__: Simple text wrapping wrapper.
.. | `dubs_web_hatch <https://github.com/landonb/dubs_web_hatch>`__: sensible-browser mappings.

.. | `vim-reSTfold <https://github.com/landonb/vim-reSTfold>`__: reStructuredText power folder.
====================================================================================    =============================================================================================================================================================
`dubs_after_dark <https://github.com/landonb/dubs_after_dark>`__                        Compelling light on dark color scheme.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_appearance <https://github.com/landonb/dubs_appearance>`__                        Configure basic Vim look n' feel.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_buffer_fun <https://github.com/landonb/dubs_buffer_fun>`__                        Manage Buffers and Windows.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_edit_juice <https://github.com/landonb/dubs_edit_juice>`__                        Powerful Text Editing commands.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_file_finder <https://github.com/landonb/dubs_file_finder>`__                      Find and Open Files.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_ftype_mess <https://github.com/landonb/dubs_ftype_mess>`__                        Filetype-specific features, like syntax highlighters, etc.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_grep_steady <https://github.com/landonb/dubs_grep_steady>`__                      Clever Text Search including Replace.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_html_entities <https://github.com/landonb/dubs_html_entities>`__                  HTML Entity table.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_mescaline <https://github.com/landonb/dubs_mescaline>`__                          Choice Status Line.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_project_tray <https://github.com/landonb/dubs_project_tray>`__                    Project plugin wrapper.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_quickfix_wrap <https://github.com/landonb/dubs_quickfix_wrap>`__                  Elegant Quickfix wrapper.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_style_guard <https://github.com/landonb/dubs_style_guard>`__                      Automatically set whitespace and line-length settings.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_syntastic_wrap <https://github.com/landonb/dubs_syntastic_wrap>`__                Syntastic wrapper.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_toggle_textwrap <https://github.com/landonb/dubs_toggle_textwrap>`__              Simple text wrapping wrapper.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`dubs_web_hatch <https://github.com/landonb/dubs_web_hatch>`__                          sensible-browser mappings.
------------------------------------------------------------------------------------    -------------------------------------------------------------------------------------------------------------------------------------------------------------
`vim-reSTfold <https://github.com/landonb/vim-reSTfold>`__                              reStructuredText power folder.
====================================================================================    =============================================================================================================================================================

List of Third-party Plugins
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. To generate list: grep url .gitmodules | sed 's/.*= //' | sort

The are awesome third-party plugins I find useful or otherwise curious:

| `AutoAdapt <https://github.com/vim-scripts/AutoAdapt>`__:
    "Automatically adapt timestamps, copyright notices, etc."
      [`vim script <http://www.vim.org/scripts/script.php?script_id=4654>`__]
| `command-t <https://github.com/wincent/command-t>`__:
    "Fast file navigation for VIM"
| `ctrlp.vim <https://github.com/kien/ctrlp.vim>`__:
    "Fuzzy file, buffer, mru, tag, etc finder."
      [`deets <https://kien.github.io/ctrlp.vim/>`__]
| `editorconfig-vim <https://github.com/editorconfig/editorconfig-vim>`__:
    "EditorConfig plugin for Vim"
      [`more <http://editorconfig.org/>`__]
| `goyo.vim <https://github.com/junegunn/goyo.vim>`__:
    "Distraction-free writing in Vim"
| `ingo-library <https://github.com/vim-scripts/ingo-library>`__:
    "Vimscript library of common functions."
      [`v.s. <http://www.vim.org/scripts/script.php?script_id=4433>`__]
| `limelight.vim <https://github.com/junegunn/limelight.vim>`__:
    "|flashlight| All the world's indeed a stage and we are merely players"
| `QFEnter <https://github.com/yssl/QFEnter>`__:
    "Open a Quickfix item in a window you choose. (Vim plugin)"
| `syntastic <https://github.com/scrooloose/syntastic>`__:
    "Syntax checking hacks for vim"
| `tcomment_vim <https://github.com/tomtom/tcomment_vim>`__:
    "An extensible & universal comment vim-plugin that also handles embedded filetypes"
      [`vs <http://www.vim.org/scripts/script.php?script_id=1173>`__]
      [see also: `vim-commentary <https://github.com/tpope/vim-commentary>`__]
| `tlib_vim <https://github.com/tomtom/tlib_vim>`__:
    "Some utility functions for VIM"
      [`vs <http://www.vim.org/scripts/script.php?script_id=1863>`__]
| `vim-buffer-ring <https://github.com/landonb/vim-buffer-ring>`__:
    "Vim plugin that enables surfing through buffers based on viewing history per window."
| `vim-gnupg <https://github.com/jamessan/vim-gnupg>`__:
    "transparent editing of gpg encrypted files."
  [`vs <http://www.vim.org/scripts/script.php?script_id=3645>`__]
| `vim-javascript <https://github.com/pangloss/vim-javascript>`__:
    "Vastly improved Javascript indentation and syntax support in Vim.
      [`vs <http://www.vim.org/scripts/script.php?script_id=4452>`__]
| `vim-jsx <https://github.com/landonb/vim-jsx>`__:
    "React JSX syntax highlighting and indenting for vim."
      (forked from `vim-jsx <https://github.com/mxw/vim-jsx>`__)
| `vim-markdown <https://github.com/landonb/vim-markdown>`__:
    "Markdown for Vim: a complete environment to create Markdown files
    with a syntax highlight that doesn't suck!"
      (forked from `vim-markdown <https://github.com/gabrielelana/vim-markdown>`__)
| `vim-misc <https://github.com/xolox/vim-misc>`__:
    "Miscellaneous auto-load Vim scripts"
      [`more <https://peterodding.com/code/vim/misc/>`__]

.. |flashlight| unicode:: 0x1F526 .. flashlight

As well as these plugins from the venerable `Tim Pope <https://github.com/tpope>`__:

| `vim-endwise <https://github.com/tpope/vim-endwise>`__:
    "endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc"
  [`vs <http://www.vim.org/scripts/script.php?script_id=2386>`__]
| `vim-fugitive <https://github.com/tpope/vim-fugitive>`__:
    "fugitive.vim: a Git wrapper so awesome, it should be illegal"
  [`vs <http://www.vim.org/scripts/script.php?script_id=2975>`__]
| `vim-scriptease <https://github.com/tpope/vim-scriptease>`__:
    "scriptease.vim: A Vim plugin for Vim plugins"
      [`vs <http://www.vim.org/scripts/script.php?script_id=4394>`__]
| `vim-speeddating <https://github.com/tpope/vim-speeddating>`__:
    "speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more"
      [`vs <http://www.vim.org/scripts/script.php?script_id=2120>`__]
| `vim-surround <https://github.com/landonb/vim-surround>`__:
    "surround.vim: quoting/parenthesizing made simple"
      [`vs <http://www.vim.org/scripts/script.php?script_id=1697>`__]
      (forked from `vim-surround <https://github.com/tpope/vim-surround>`__)
| `vim-unimpaired <https://github.com/tpope/vim-unimpaired>`__:
    "unimpaired.vim: pairs of handy bracket mappings"
      [`vs <http://www.vim.org/scripts/script.php?script_id=1590>`__]
| `vim-vinegar <https://github.com/tpope/vim-vinegar>`__:
    "vinegar.vim: combine with netrw to create a delicious salad dressing"
| `vim-vividchalk <https://github.com/tpope/vim-vividchalk>`__:
    "vividchalk.vim: a colorscheme strangely reminiscent of Vibrant Ink for a certain OS X editor"
      [`vs <http://www.vim.org/scripts/script.php?script_id=1891>`__]

And these plugins that I no longer use (or rarely use) but have yet to scrub:

| `jellybeans.vim <https://github.com/nanotech/jellybeans.vim>`__:
    "A colorful, dark color scheme for Vim."
      [`vim.org <http://www.vim.org/scripts/script.php?script_id=2555>`__]
| `nerdtree <https://github.com/scrooloose/nerdtree>`__:
    "A tree explorer plugin for vim."
| `nord-vim <https://github.com/arcticicestudio/nord-vim>`__:
    "An arctic, north-bluish clean and elegant Vim theme."
| `TeTrIs.vim <https://github.com/vim-scripts/TeTrIs.vim>`__:
    "A tetris game in pure vim"
| `viki_vim <https://github.com/tomtom/viki_vim>`__:
    "A personal wiki for Vim"
      [`vs <http://www.vim.org/scripts/script.php?script_id=861>`__]
| `vim-rails <https://github.com/tpope/vim-rails>`__:
    "rails.vim: Ruby on Rails power tools"
      [`vs <http://www.vim.org/scripts/script.php?script_id=1567>`__]

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
..       work on github. E.g., we cannot simply
..
..        .. include:: https://github.com/landonb/dubs_after_dark/README.rst
..        .. include:: ...
..
..       so instead we'll assemble this file from a script, readme-using.make.sh,
..       which appends all the package docs to this file.

