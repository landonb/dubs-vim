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

.. table::
  :widths: 30 70

  ================================================================================================  ==============================================================================================================
  🌃 `dubs_after_dark <https://github.com/landonb/dubs_after_dark>`__                                Compelling light on dark color scheme (that uses true black).
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  💅 `dubs_appearance <https://github.com/landonb/dubs_appearance>`__                                Configure basic Vim look n' feel (that appeals to the author).
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🧃 `dubs_edit_juice <https://github.com/landonb/dubs_edit_juice>`__                                Powerful Text Editing commands.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🧹 `dubs_ftype_mess <https://github.com/landonb/dubs_ftype_mess>`__                                Filetype-specific features, like syntax highlighters, etc.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🤹 `dubs_grep_steady <https://github.com/landonb/dubs_grep_steady>`__                              Clever Text Search including Replace.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  👽 `dubs_html_entities <https://github.com/landonb/dubs_html_entities>`__                          HTML Entity table.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🍄 `dubs_mescaline <https://github.com/landonb/dubs_mescaline>`__                                  *Choice* Status Line.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🗂 `dubs_project_tray <https://github.com/landonb/dubs_project_tray>`__                            Project plugin wrapper.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🌯 `dubs_quickfix_wrap <https://github.com/landonb/dubs_quickfix_wrap>`__                          Elegant Quickfix wrapper.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  💂 `dubs_style_guard <https://github.com/landonb/dubs_style_guard>`__                              Automatically set whitespace and line-length settings.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🔘 `dubs_toggle_textwrap <https://github.com/landonb/dubs_toggle_textwrap>`__                      Simple text wrapping wrapper.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  જ⁀➴ `vim-async-map <https://github.com/embrace-vim/vim-async-map>`__                               Wire async mode maps, e.g., type ``kj`` quickly in insert mode to escape to normal mode.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🗯 `vim-better-file-changed-prompt                                                                 Change default file-modified prompt to reload file on <Enter> (Vim's default is to not reload it).
  <https://github.com/embrace-vim/vim-better-file-changed-prompt>`__
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🕹 `vim-blinky-search <https://github.com/embrace-vim/vim-blinky-search>`__                        Visual search enhancements.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🍧 `vim-buffer-delights <https://github.com/embrace-vim/vim-buffer-delights>`__                    Manage Buffers and Windows.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  💍 `vim-buffer-ring <https://github.com/landonb/vim-buffer-ring>`__                                <Ctrl-J> and <Ctrl-K> buffer navigation — like the venerable ``vim-bufsurf`` but with a few improvements.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🏛 `vim-classic-taglist <https://github.com/landonb/vim-classic-taglist>`__                        Clone of http://vim-taglist.sourceforge.net/
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  👣 `vim-clip-expand-path <https://github.com/DepoXy/vim-clip-expand-path>`__                       Press ``<Leader>J`` to copy full file path to clipboard, or ``<Leader>j`` to copy relative path.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🕰️ `vim-command-line-clock <https://github.com/embrace-vim/vim-command-line-clock>`__              Shows the date and clock time in the command line when no other output is displayed.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🥥 `vim-depoxy-coc-defaults <https://github.com/DepoXy/vim-depoxy-coc-defaults>`__                 Sensible coc.nvim defaults and maps.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  💯 `vim-fullscreen-toggle <https://github.com/embrace-vim/vim-fullscreen-toggle>`__                Cycle through a few different Vim window dimensions (e.g., by pressing ``<F11>``).
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🚕 `vim-goto-file <https://github.com/embrace-vim/vim-goto-file>`__                                Enables ``gf`` to resolve shell variable paths, like ``${VIM_PACK:-${HOME}/.vim/pack}``
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🥔 `vim-lcd-project-root <https://github.com/landonb/vim-lcd-project-root>`__                      Sets the working directory when editing a new buffer to the file's Git project root.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🥖 `vim-mkspell-when-stale <https://github.com/landonb/vim-mkspell-when-stale>`__                  Automatically rebuild the Vim spell file on startup.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🌐 `vim-netrw-cfg-split-explorer <https://github.com/landonb/vim-netrw-cfg-split-explorer>`__      Sensible ``:netrw`` defaults.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🥾 `vim-netrw-explore-map <https://github.com/embrace-vim/vim-netrw-explore-map>`__                Wire convenient ``:Explore [dir]`` command maps.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🧩 `vim-netrw-link-resolve <https://github.com/landonb/vim-netrw-link-resolve>`__                  Reopens files opened with `netrw` at their resolved path to avoid a file-exists error on save.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🧼 `vim-ovm-easyescape-kj-jk <https://github.com/landonb/vim-ovm-easyescape-kj-jk>`__              Quickly ype ``jk`` or ``kj`` in Insert mode to switch to Normal mode.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🦴 `vim-ovm-seven-of-spines <https://github.com/landonb/vim-ovm-seven-of-spines>`__                Press <Ctrl-minus> to insert an hrule into reST docs.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🙏 `vim-reSTfold <https://github.com/landonb/vim-reSTfold>`__                                      Innovative reStructuredText document folding (manage notes like a pro).
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🎨 `vim-reST-highdefs <https://github.com/landonb/vim-reST-highdefs>`__                            A plethora of reStructuredText syntax highlights to make maintaining reST notes files beautiful.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🖐 `vim-reST-highfive <https://github.com/landonb/vim-reST-highfive>`__                            Add *FIVER* highlighting to reStructuredText notes files.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  ➖ `vim-reST-highline <https://github.com/landonb/vim-reST-highline>`__                            Highlight lines of repeated characters in reStructuredText notes files, to use as a colorful hrule.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🛑 `vim-select-mode-stopped-down <https://github.com/landonb/vim-select-mode-stopped-down>`__      Tweaked ``select-mode`` Ctrl-Shift-Left and Ctrl-Shift-Right motions, for ``behave mswin``.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🔃 `vim-source-reloader <https://github.com/embrace-vim/vim-source-reloader>`__                    Reload VimL (Vim script) source files (e.g., by pressing ``<F9>``).
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  ⌚ `vim-title-bar-time-of-day <https://github.com/landonb/vim-title-bar-time-of-day>`__            Shows the date and clock time in the titlebar, useful if you hide the macOS menubar.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🧭 `vim-tmux-navigator <https://github.com/landonb/vim-tmux-navigator>`__                          Fork of https://github.com/christoomey/vim-tmux-navigator adds keybindings for previous and next.
  ------------------------------------------------------------------------------------------------  --------------------------------------------------------------------------------------------------------------
  🐣 `vim-webopen <https://github.com/embrace-vim/vim-webopen>`__                                    Open URLs, search selected text/text under cursor, and lookup word definitions in your browser.
  ================================================================================================  ==============================================================================================================

.. AWAIT/2022-09-21: Add DepoXy/waffle-batter-vim, once published: https://github.com/DepoXy/depoxy/tree/release/home/.vim/pack/DepoXy/start/vim-depoxy
.. SKIPD/2022-09-21: DepoXy/vim-trap is private, but worth calling out: https://github.com/YOU/vim-trap

List of Forked Plugins
^^^^^^^^^^^^^^^^^^^^^^

These are plugins I've forked to add value (but haven't bothered asking
upstream to incorporate the changes, either because it wouldn't mesh
with the upstream project's goals, or because I'm lazy):

| `ansible-vim <https://github.com/landonb/ansible-vim>`__:
    "A vim plugin for syntax highlighting Ansible's common filetypes."
    Fork inhibits ``ansible-vim`` from changing ``isfname`` and ``path``,
    tweaks Yaml indent behavior, and disables ``indentexpr``.
      (Upstream: `ansible-vim <https://github.com/pearofducks/ansible-vim>`__)
| `QFEnter <https://github.com/landonb/QFEnter>`__:
    "Open a Quickfix item in a window you choose."
    Fork restores quickfix cursor position after opening error, and it
    avoids opening file in any window showing a special buffer.
      (Upstream: `QFEnter <https://github.com/yssl/QFEnter>`__)
| `vim-unimpaired <https://github.com/landonb/vim-unimpaired#👿>`__:
    "Pairs of handy bracket mappings."
    Fork adds ``[om`` and ``[om`` to show/hide menubar (for Linux users).
      (Upstream: `vim script <http://www.vim.org/scripts/script.php?script_id=1590>`__,
                 `vim-unimpaired <https://github.com/tpope/vim-unimpaired>`__)

List of LSP Plugins
^^^^^^^^^^^^^^^^^^^

These are `LSP <https://langserver.org/>`__ client and server plugins,
which empower Vim to be a great choice for all your development needs
(they integrate features like auto completion, go to definition, etc.).

| `coc-json <https://github.com/neoclide/coc-json>`__:
    JSON LSP server
| `coc.nvim <https://github.com/neoclide/coc.nvim>`__:
    LSP (Language Server Protocol) plugin
| `coc-tsserver <https://github.com/neoclide/coc-tsserver>`__:
    TypeScript LSP server

List of Motion Plugins
^^^^^^^^^^^^^^^^^^^^^^

Note that many of these plugins each redefine or improve upon the
built-in ``f``, ``F``, ``t``, ``T``, ``;``, and ``,`` commands,
so generally you want to choose one of these to use. (The others
you'll find under ``opt/``.)

One nicety about ``vim-easymotion`` is that all its features are *opt-in*,
so you can leave it under its ``start/`` directory and it won't wire
anything unless you add wiring from your config (as opposed to, say,
``improveft``, which adds its maps (e.g., to ``s``) when it loads).

| `improvedft <https://github.com/chrisbra/improvedft>`__
| `vim-easymotion <https://github.com/easymotion/vim-easymotion>`__
| `vim-sneak <https://github.com/justinmk/vim-sneak>`__

Motion plugins that implement two-character jumpers:

| `vim-easymotion <https://github.com/easymotion/vim-easymotion>`__:
    The pinnacle of motion plugins, it seems
| `vim-sneak <https://github.com/justinmk/vim-sneak>`__:
    Jump to any location specified by two characters;
    "minimalist alternative to *EasyMotion*"
| `hop.nvim <https://github.com/smoka7/hop.nvim>`__:
    *EasyMotion*-like plugin for Neovim
| `leap.nvim <https://github.com/ggandor/leap.nvim>`__:
    Neovim vim-sneak fork with target label previews
| `vim-seek <https://github.com/goldfeld/vim-seek>`__
| `vim-smalls <https://github.com/t9md/vim-smalls>`__:
    grays out doc to highlight cursor and matches

Motion plugins that implement single-character `f`, `F`, `t`, and `T`
improvements, e.g., multiline, smart case, repeat with `;` and `,`,
and highlighting:

| `improvedft <https://github.com/chrisbra/improvedft>`__
| `clever-f.vim <https://github.com/rhysd/clever-f.vim>`__
| `vim-extended-ft <https://github.com/svermeulen/vim-extended-ft>`__
| `vim-fanfingtastic <https://github.com/dahu/vim-fanfingtastic>`__
| `flash.nvim <https://github.com/folke/flash.nvim>`__ (Neovim)

List of Window-related Plugins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| `BufOnly.vim <https://github.com/vim-scripts/BufOnly.vim>`__
| `limelight.vim <https://github.com/junegunn/limelight.vim>`__:
    "|flashlight| All the world's indeed a stage and we are merely players"
| `ZoomWin <https://github.com/vim-scripts/ZoomWin>`__

List of Programming, Language, and Markup Plugins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

General:

| `editorconfig-vim <https://github.com/editorconfig/editorconfig-vim>`__:
    "EditorConfig plugin for Vim"
      [`more <http://editorconfig.org/>`__]
| `matchit <https://github.com/chrisbra/matchit>`__
    `matchit docs <https://github.com/chrisbra/matchit/blob/master/doc/matchit.txt>`__
| `nerdcommenter <https://github.com/preservim/nerdcommenter>`__:
    Easily add and remove comment leaders
| `tagbar <https://github.com/majutsushi/tagbar>`__

Coverage:

| `vim-istanbul <https://github.com/juanpabloaj/vim-istanbul>`__

Git:

| `vim-fugitive <https://github.com/tpope/vim-fugitive>`__:
    "fugitive.vim: a Git wrapper so awesome, it should be illegal"
  [`vim script <http://www.vim.org/scripts/script.php?script_id=2975>`__]
| `vim-mergetool <https://github.com/samoshkin/vim-mergetool>`__

JSON:

| `vim-jdaddy <https://github.com/tpope/vim-jdaddy>`__

Markdown:

| `vim-markdown <https://github.com/preservim/vim-markdown>`__

Python:

| `vim-python-matchit <https://github.com/voithos/vim-python-matchit>`__

Ruby:

| `vim-rails <https://github.com/tpope/vim-rails>`__:
    "rails.vim: Ruby on Rails power tools"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=1567>`__]

TOML:

| `vim-toml <https://github.com/cespare/vim-toml>`__

TypeScript/JavaScript:

| `vim-javascript <https://github.com/pangloss/vim-javascript>`__:
    "Vastly improved JavaScript indentation and syntax support in Vim.
      [`vim script <http://www.vim.org/scripts/script.php?script_id=4452>`__]
| `vim-js <https://github.com/yuezk/vim-js>`__
| `vim-jsx-pretty <https://github.com/MaxMEllon/vim-jsx-pretty>`__
| `yats.vim <https://github.com/HerringtonDarkholme/yats.vim>`__

List of Tim Pope Plugins
^^^^^^^^^^^^^^^^^^^^^^^^

These plugins are maintained by the venerable `Tim Pope <https://github.com/tpope>`__
(and that are not included in the lists above):

| `vim-abolish <https://github.com/tpope/vim-abolish>`__
| `vim-fugitive <https://github.com/tpope/vim-fugitive>`__ (see above)
| `vim-jdaddy <https://github.com/tpope/vim-jdaddy>`__ (see above)
| `vim-rails <https://github.com/tpope/vim-rails>`__ (see above)
| `vim-repeat <https://github.com/tpope/vim-repeat>`__
| `vim-surround <https://github.com/landonb/vim-surround#🔄>`__:
    "Quoting and parenthesizing made simple."
    (Inspired by `a vim script <http://www.vim.org/scripts/script.php?script_id=1697>`__)
| `vim-speeddating <https://github.com/tpope/vim-speeddating>`__:
    "speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=2120>`__]
| `vim-unimpaired <https://github.com/tpope/vim-unimpaired>`__ (see above)
| `vim-vinegar <https://github.com/tpope/vim-vinegar>`__:
    "vinegar.vim: combine with netrw to create a delicious salad dressing"

Tim Pope plugins I've tried but don't currently use:

| `vim-commentary <https://github.com/tpope/vim-commentary>`__:
    I use `NERD Commenter <https://github.com/preservim/nerdcommenter>`__;
    see also `tcomment.vim <https://github.com/tomtom/tcomment_vim>`__
| `vim-endwise <https://github.com/tpope/vim-endwise>`__:
    "endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc";
    I tried but found it disruptive (I'm not a huge fan of auto-completion...)
  [`vim script <http://www.vim.org/scripts/script.php?script_id=2386>`__]
| `vim-obsession <https://github.com/tpope/vim-obsession>`__:
    *obsession.vim: continuously updated session files*;
    see instead `my approach
    <https://github.com/landonb/dubs_appearance/blob/release/plugin/session_file_boss.vim>`__
| `vim-pathogen <https://github.com/tpope/vim-pathogen>`__:
    I use the `myrepos <https://myrepos.branchable.com/>`__ and
    `Oh, My Repos! <https://github.com/landonb/ohmyrepos>`__ to
    manage Vim plugins as a group of managed Git repositories
| `vim-scriptease <https://github.com/tpope/vim-scriptease>`__:
    "scriptease.vim: A Vim plugin for Vim plugins"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=4394>`__]
| `vim-vividchalk <https://github.com/tpope/vim-vividchalk>`__:
    "vividchalk.vim: a colorscheme strangely reminiscent of Vibrant Ink for a certain OS X editor"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=1891>`__]

See below for `Other Tim Pope plugins to consider`_.

List of Fuzzy-Finder Plugins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I like ``junegunn/fzf.vim``:

| `fzf.vim <https://github.com/junegunn/fzf.vim>`__:
    Fuzzy-find plugin

See also:

| `command-t <https://github.com/wincent/command-t>`__:
    "Fast file navigation for VIM"
| `ctrlp.vim <https://github.com/kien/ctrlp.vim>`__:
    "Fuzzy file, buffer, mru, tag, etc finder."
      [`deets <https://kien.github.io/ctrlp.vim/>`__]
| `ddu.vim <https://github.com/Shougo/ddu.vim>`__:
    "Dark deno-powered UI framework for Vim/Neovim"
      [`deets <https://github.com/Shougo/ddu.vim/blob/main/doc/ddu.txt>`__]

List of Other Plugins
^^^^^^^^^^^^^^^^^^^^^

These are other awesome third-party plugins I find useful or otherwise
curious (though some I rarely use, I'll admit):

| `Tabular <https://github.com/godlygeek/tabular>`__:
    "Vim script for text filtering and alignment"
    (also required by `vim-markdown <https://github.com/tpope/vim-markdown>`__)
| `vim-gnupg <https://github.com/jamessan/vim-gnupg>`__:
    "transparent editing of gpg encrypted files."
  [`vim script <http://www.vim.org/scripts/script.php?script_id=3645>`__]

.. |flashlight| unicode:: 0x1F526 .. flashlight

List of Color Scheme Plugins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The author created the ``dubs_after_dark`` color scheme because I wanted a true
black background and vibrant foreground colors, and most (none?) of the other
color schemes that I demoed use true black (most dark themes uses a darkish grey).

These plugins are installed under ``pack/*/opt/`` paths, so you can load them
first via ``:packadd {plugin-name}`` and then run ``colorscheme {scheme-name}``
to try out different color schemes.

| `jellybeans.vim <https://github.com/nanotech/jellybeans.vim>`__:
    "A colorful, dark color scheme for Vim."
      [`vim.org <http://www.vim.org/scripts/script.php?script_id=2555>`__]
| `nord-vim <https://github.com/arcticicestudio/nord-vim>`__:
    "An arctic, north-bluish clean and elegant Vim theme."
| `vim-colorschemes <https://github.com/flazz/vim-colorschemes>`__
| `vim-vividchalk <https://github.com/tpope/vim-vividchalk>`__ (see above)

List of Retired or Optional Plugins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For posterity, here are plugins that I used to use, but that I've since stopped using
(this is not a judgement on their merits: sometimes I use certain plugins with certain
technologies that I no longer use, or I maybe some functionality has since been 
incorporated into Vim itself, or maybe I found a different plugin, who knows).

Note that many of these plugins I simply moved under their related ``opt/``
directory, so you can load them on-demand. (E.g., there's no reason to
always load *TeTrIs*, but if you want to try it, run ``:packadd TeTrIs.vim``
and then ``\te``.)

| `asyncomplete-lsp.vim <https://github.com/prabirshrestha/asyncomplete-lsp.vim>`__
| `asyncomplete.vim <https://github.com/prabirshrestha/asyncomplete.vim>`__
| `async.vim <https://github.com/prabirshrestha/async.vim>`__
| `AutoAdapt <https://github.com/vim-scripts/AutoAdapt>`__:
    "Automatically adapt timestamps, copyright notices, etc."
      [`vim script <http://www.vim.org/scripts/script.php?script_id=4654>`__]
| `goyo.vim <https://github.com/junegunn/goyo.vim>`__:
    "Distraction-free writing in Vim"
| `ingo-library <https://github.com/vim-scripts/ingo-library>`__:
    "Vimscript library of common functions."
      [`vim script <http://www.vim.org/scripts/script.php?script_id=4433>`__]
| `nerdtree <https://github.com/scrooloose/nerdtree>`__:
    "A tree explorer plugin for vim."
| `syntastic <https://github.com/scrooloose/syntastic>`__:
    "Syntax checking hacks for vim"
| `tcomment_vim <https://github.com/tomtom/tcomment_vim>`__:
    "An extensible & universal comment plugin"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=1173>`__,
       see also: `vim-commentary <https://github.com/tpope/vim-commentary>`__]
| `TeTrIs.vim <https://github.com/vim-scripts/TeTrIs.vim>`__:
    "A tetris game in pure vim"
| `tlib_vim <https://github.com/tomtom/tlib_vim>`__:
    "Some utility functions for VIM"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=1863>`__]
| `typescript-vim <https://github.com/leafgarland/typescript-vim>`__:
    Circa TypeScript 1.0, since superseded by Vim's
    `typescript.vim <https://github.com/vim/vim/blob/master/runtime/syntax/typescript.vim>`__
    and `YATS <https://github.com/HerringtonDarkholme/yats.vim>`__.
| `viki_vim <https://github.com/tomtom/viki_vim>`__:
    "A personal wiki for Vim"
      [`vim script <http://www.vim.org/scripts/script.php?script_id=861>`__]
| `vim-easyescape <https://github.com/zhou13/vim-easyescape>`__
| `vim-go <https://github.com/editorconfig/vim-go>`__
| `vim-lsp-javascript <https://github.com/ryanolsonx/vim-lsp-javascript>`__
| `vim-lsp-settings <https://github.com/mattn/vim-lsp-settings>`__
| `vim-lsp-typescript <https://github.com/ryanolsonx/vim-lsp-typescript>`__
| `vim-lsp <https://github.com/prabirshrestha/vim-lsp>`__
| `vim-misc <https://github.com/xolox/vim-misc>`__:
    "Miscellaneous auto-load Vim scripts"
      [`more <https://peterodding.com/code/vim/misc/>`__]
| `vim-restructuredtext <https://github.com/marshallward/vim-restructuredtext>`__
| `vim-slash <https://github.com/junegunn/vim-slash>`__
    "Enhancing in-buffer search experience":
    "Automatically clears search highlight when cursor is moved"
    (see also `vim-evanesco <https://github.com/pgdouyon/vim-evanesco>`__)
    but also has a nifty optional match highlight blink feature
    that grifted for
    `vim-blinky-search <https://github.com/embrace-vim/vim-blinky-search>`__

Plugins that I used to develop or that I forked, but no longer use:

| `dubs_cycloplan <https://github.com/landonb/dubs_cycloplan>`__
| `dubs_file_finder <https://github.com/landonb/dubs_file_finder>`__
    Find and open files quickly using ``:CommandT`` and ``:CtrlP`` plugins.
| `dubs_syntastic_wrap <https://github.com/landonb/dubs_syntastic_wrap#🤸>`__:
    Syntastic wrapper.
| `vim-jsx <https://github.com/landonb/vim-jsx>`__:
    "React JSX syntax highlighting and indenting for Vim."
      (Upstream: `vim-jsx <https://github.com/mxw/vim-jsx>`__)
| `vim-markdown <https://github.com/landonb/vim-markdown#👇>`__:
    "Markdown for Vim."
    Fork fixes issues seeing XML tags and content being white on white
    (though might be specific to my Vim environment).
      (Upstream: `vim-markdown <https://github.com/gabrielelana/vim-markdown>`__)

Other Tim Pope plugins to consider
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Other Tim Pope plugins to consider (that author has not tried; listed
here just to be sure you're not missing anything useful):

| `vim-dadbod <https://github.com/tpope/vim-dadbod>`__:
    "dadbod.vim: Modern database interface for Vim",
    e.g., ``:DB postgresql:///foobar``
| `vim-eunuch <https://github.com/tpope/vim-eunuch>`__:
    "eunuch.vim: Helpers for UNIX",
    e.g., ``:Chmod``
| `vim-projectionist <https://github.com/tpope/vim-projectionist>`__:
    "projectionist.vim: Granular project configuration",
    helps work with boilerplate or similarly-configured projects
| `vim-git <https://github.com/tpope/vim-git>`__:
    "syntax, indent, and filetype plugin files for git, gitcommit, gitconfig, gitrebase, and gitsendemail",
    "earlier versions of these files are shipped with Vim"
    [`vim script <https://www.vim.org/scripts/script.php?script_id=1654>`__]
| `vim-sleuth <https://github.com/tpope/vim-sleuth>`__:
    "sleuth.vim: Heuristically set buffer options",
    "automatically adjusts ``shiftwidth`` and ``expandtab`` heuristically based on the current file",
    "Modelines and EditorConfig are also consulted"
| `vim-haml <https://github.com/tpope/vim-haml>`__:
    "Vim runtime files for Haml, Sass, and SCSS",
    "You only need it if you want the very latest updates."
| `vim-dispatch <https://github.com/tpope/vim-dispatch>`__:
    "dispatch.vim: Asynchronous build and test dispatcher"
| `vim-salve <https://github.com/tpope/vim-salve>`__:
    "salve.vim: Static Vim support for Leiningen, Boot, and the Clojure CLI"
| `vim-sensible <https://github.com/tpope/vim-sensible>`__:
    "sensible.vim: Defaults everyone can agree on"
    (`plugin/sensible.vim <https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim>`__)
| `vim-markdown <https://github.com/tpope/vim-markdown>`__:
    "Vim Markdown runtime files",
    "you don't need to install these if you are running a recent version of Vim"
| `vim-rvm <https://github.com/tpope/vim-rvm>`__:
    "rvm.vim: Switch Ruby versions from inside Vim"
| `vim-cucumber <https://github.com/tpope/vim-cucumber>`__:
    "Vim Cucumber runtime files",
    "development version of Vim's included runtime files for the Ruby acceptance testing framework Cucumber"
| `rbenv-ctags <https://github.com/tpope/rbenv-ctags>`__:
    "Automatically generate ctags for rbenv Ruby stdlibs"
| `vim-rake <https://github.com/tpope/vim-rake>`__:
    "rake.vim: it's like rails.vim without the rails",
    leverages "projectionist.vim to enable you to use all those parts of
    rails.vim that you wish you could use on your other Ruby projects"
| `mta-settings <https://github.com/tpope/mta-settings>`__:
    "Configure ActionMailer or Mail delivery settings based on the environment",
    Ruby gem "enables transparent MTA (mail transport agent) configuration from the environment
    for both `ActionMailer <https://github.com/rails/rails/tree/main/actionmailer>`__
    and `Mail <https://github.com/mikel/mail>`__
| `vim-bundler <https://github.com/tpope/vim-bundler>`__:
    "bundler.vim: Lightweight support for Ruby's Bundler"
| `vim-flagship <https://github.com/tpope/vim-flagship>`__:
    "flagship.vim: Configurable and extensible tab line and status line",
    "Vim status line and tab line that are both easily customizable by the user and extensible by other plugins"
| `vim-capslock <https://github.com/tpope/vim-capslock>`__:
    "capslock.vim: Software caps lock",
    "Press ``<C-G>c`` in insert mode to toggle a temporary software caps lock,
    or ``gC`` in normal mode to toggle a slightly more permanent one"
| `vim-rhubarb <https://github.com/tpope/vim-rhubarb>`__:
    "rhubarb.vim: GitHub extension for fugitive.vim",
    "If fugitive.vim is the Git, rhubarb.vim is the Hub",
    e.g., ``:GBrowse`` to open GitHub URLs
| `vim-rsi <https://github.com/tpope/vim-rsi>`__:
    "rsi.vim: Readline style insertion",
    "C-a, C-b, C-d, C-e, C-f, C-t, M-b, M-d, M-f, M-n, and M-p are provided"
    (`plugin/rsi.vim <https://github.com/tpope/vim-rsi/blob/master/plugin/rsi.vim>`__)
| `vim-tbone <https://github.com/tpope/vim-tbone>`__:
    "tbone.vim: tmux basics"
| `vim-sexp-mappings-for-regular-people <https://github.com/tpope/vim-sexp-mappings-for-regular-people>`__:
    "`vim-sexp <https://github.com/guns/vim-sexp>`__ mappings for regular people"
| `vim-ragtag <https://github.com/tpope/vim-ragtag>`__:
    "ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)"
| `vim-heroku <https://github.com/tpope/vim-heroku>`__:
    "heroku.vim: Heroku CLI wrapper"
| `vim-dotenv <https://github.com/tpope/vim-dotenv>`__:
    "dotenv.vim: Basic support for ``.env`` and ``Procfile``"
| `vim-liquid <https://github.com/tpope/vim-liquid>`__:
    "Vim `Liquid <https://jekyllrb.com/docs/liquid/>`__ runtime files
    with `Jekyll <https://jekyllrb.com/>`__ enhancements"
| `vim-apathy <https://github.com/tpope/vim-apathy>`__:
    "apathy.vim: Set the 'path' option for miscellaneous file types",
    "sets the five path searching options — ``path``, ``suffixesadd``,
    ``include``, ``includeexpr``, and ``define``
| `vim-classpath <https://github.com/tpope/vim-classpath>`__:
    "classpath.vim: Set 'path' from the Java class path"
| `vim-haystack <https://github.com/tpope/vim-haystack>`__:
    "haystack.vim: fuzzy matching algorithm",
    "a fuzzy matching algorithm for use by other Vim plugins"
| `vim-afterimage <https://github.com/tpope/vim-afterimage>`__:
    "afterimage.vim: edit binary files by converting them to text equivalents",
    "Edit ICO, PNG, and GIF icons. No really. They're converted with ImageMagick to XPM,
    a plain text image format with beautiful syntax highlighting in GUI versions of Vim"
| `vim-flatfoot <https://github.com/tpope/vim-flatfoot>`__:
    "flatfoot.vim: experimental enhancement of "f" and "t" keys"
    (`plugin/flatfoot.vim <https://github.com/tpope/vim-flatfoot/blob/master/plugin/flatfoot.vim>`__)

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

