########
Dubs Vim
########

Dubs Vim is just one developer's Vim IDE (or very close to it).

Project Overview
================

This project is essentially just the lightweight
top-level ``~/.vim`` directory that I use.

Almost all functionality is provided by installing other projects using
the (newish) ``package`` mechanism, i.e., cloning repositories under
``~/.vim/pack/<author>/start/<project>``.

Rather than hook projects as git submodules, each user is expected to
manage their own repositories.

- This author recommends the excellent
  `myrepos <https://myrepos.branchable.com/>`__
  multiple repository manager, which pairs well
  with this author's myrepos extensions and actions,
  https://github.com/landonb/ohmyrepos

Project Highlights
==================

If nothing else, hopefully you'll find the list of suggested third-party
plugins to be useful. While not completely representative of all the best
plugins -- it's by no means an inclusive Awesome List -- it represents
some of the best plugins I've found, and that I still find to be useful.

I've also written dozen of plugins over the years, to fill in the gaps as
necessary. Hopefully you'll find these plugins of interest, as well.

- For convenience, this project installs a help file compiled from all my
  personally authored help docs, to provide a single point of reference
  (as there are many, many commands and mappings defined).

Feature Overview
================

See `Dubs Vim Reference <doc/README-USING.rst>`__
for a complete list of features of my plugins,
or browse the more terse online help, ``:help dubs-vim``.

Install as Normal Package
=========================

If you plan to install the Dubs Vim plugins and want the single-page
help, install this project, too.

Using the built-in packages feature, you can simply clone this project
to a ``start`` directory under ``~/.vim/pack``, e.g.,

.. code-block:: bash

   mkdir -p ~/.vim/pack/landonb/start
   git clone git://github.com/landonb/dubs-vim.git ~/.vim/pack/landonb/start

If you want access to the best features, install additional packages.

- On Ubuntu, one might run, e.g.,

.. code-block:: bash

   sudo apt install -y \
      vim-gtk \
      silversearcher-ag \
      exuberant-ctags \
      par \
      ruby-dev

- Dubs Vim also works well with
  `ripgrep <https://github.com/BurntSushi/ripgrep>`__
  (which you can install yourself).

Once cloned and addition packages are installed,
restart Vim and rebuild the inline help docs.
From within Vim, run.

.. code-block:: vim

   :Helptags

Install as Top-level Vim Directory
==================================

If your user does not already have a ``~/.vim`` directory, you
can clone the repository to your user's home directory, and then
create a symlink at ``~/.vimrc``. E.g.,

.. code-block:: bash

   cd
   git clone git://github.com/landonb/dubs-vim.git .vim
   /bin/ln -s .vim/.vimrc .vimrc

Next Steps
----------

Install Dubs Vim packages
^^^^^^^^^^^^^^^^^^^^^^^^^

.. FIXME/2020-02-26: Document.

Install third-party packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. FIXME/2020-02-26: Document.

Read the documentation
^^^^^^^^^^^^^^^^^^^^^^

See `Dubs Vim Reference <doc/README-USING.rst>`__
for a list of commands and keyboard shortcuts.
The online help, ``:h dubs``, is an abbreviated
list of the same.

Configure, personalize, dismantle, etc.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

There are a few features you'll need to prime before
they'll be of any utility.

1. Make project symlinks for Command-T wrapper.

The ``<Ctrl-D>`` command pops up Command-T and points
it at the first directory named ``cmdt_paths`` that
it finds within the ``~/.vim`` folder.

When you run Dubs Vim for the first time, it'll copy the file,
``pack/landonb/start/dubs_file_finder/cmdt_paths.template``,
to ``cmdt_paths`` in the same directory.

(You can move this directory somewhere private, to
put it under your own revision control system; then
symlink your path from ``dubs_file_finder/cmdt_paths``.)

Look inside the copied directory and you'll find
a ``generate_links.sh`` script that you can edit
and run to populate the folder.
Currently, it just adds links to your Vim files.

You can also do this manually, e.g.,

.. code-block:: bash

   /bin/ln -s /path/to/projectA /path/to/cmdt_paths
   /bin/ln -s /path/to/projectB /path/to/cmdt_paths
   ...

2. Make list of folders to be easily greppable.

Open the file ``pack/landonb/start/dubs_grep_steady/dubs_projects.vim``
and add your project paths to the list of projects. This list is displayed
when your search with either ``\g`` or the ``F4`` mappings.

(You can also move this file somewhere private, to
put it under your own revision control system; then
symlink that file from ``dubs_grep_steady/dubs_projects.vim``.)

3. Hack away.

Like most things Vim, after reading the docs and
testing a new plugin, you'll want to get your hands
dirty. Happy hacking!

Third-Party Distro Package Descriptions
---------------------------------------

Following is an explanation of the optional
``aptitude`` packages that can be installed
to enable more features:

- `The Silver Searcher <http://geoff.greer.fm/ag/>`__
  is a nice alternative to the built-in `grep` family
  of commands, especially since it honors `.gitignore` files.

- `ripgrep <https://github.com/BurntSushi/ripgrep>`__
  is an even faster alternative to ``ag`` (and is may have
  to be manually installed).

- `Exuberant Ctags <http://ctags.sourceforge.net/>`__
  lets you jump to function definitions using ``Ctrl-]``.
  (You'll have to run ``ctags`` on your source
  to generate one or more ``tags`` files first;
  it's best if you can wire this into your local CI.)

- `Par <http://www.nicemice.net/par/>`__
  lets you reformat text to a preset width (e.g., press ``Shift-F2``
  to intelligently resize a selected text block of code to 80
  characters wide, preserving indents, prefixes and postfixes).

- We include the `ruby-dev` library so we can build
  the Command-T binary.

Third-party Vim Plugins
-----------------------

Dubs Vim includes and incorporates
a number of third-party Vim plugins.

You can generally access each plugin's feature using the
normal commands defined by the plugin, but Dubs Vim also
remaps and wraps calls to third-party plugins to make them
more seamless and easy to access.

See the `Dubs Vim Reference <doc/README-USING.rst>`__
for a list of all Dubs Vim commands, including
those provided by other people's plugins.

Disclaimer
----------

Dubs Vim mostly adds new key bindings not already mapped by
standard Vim or changed by MS-Windows mode (``behave mswin``).
However, a few standard key bindings have been remapped.
You probably won't notice the changes, but you might.
See `Differences from Vim <doc/README-USING.rst#Differences_from_Vim>`__
for the list of binding differences.

