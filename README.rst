=================
Dubsack's Toolkit
=================

Dubsacks Toolkit (DTK) is just one developer's Vim IDE.

Why You Might Care
------------------

Are you newish to Vim? Dubsacks is a well-documented, curated IDE.
It includes what I think are some of the best plugins, and it
includes a number of custom features to fill in the gaps.
It's also easy to hack away and to make it your own.

Are you oldish to Vim? Then you're probably just doing what
I like to do, which is to peek at other people's vims.
You never know what you might find.

Dubsacks uses a lot of third-party scripts and bundles,
and all custom Dubsacks code is also packaged as modules,
and includes online documentation, so it's easy to peel off
any pieces you might like.

Dubsacks is a full-featured Vim IDE designed to provide a fast,
friendly development environment and to include the best Vim
plugins. Many thanks to all of the brilliant and passionate
developers who've made and continue to make Vim such a cool tool.

Feature Overview
----------------

See `Dubsacks Vim Reference <USING.rst>`__
for a complete list of features, or browse
the more terse online help, ``:help dubsacks``.

Quick Install
-------------

Pathogen makes installing Dubsacks a breeze.

If you're already using Pathogen, download Dubsacks to
your ``bundle`` directory, quit Vim, zap your Session
file, are restart Vim.

.. code-block:: bash

   git clone git://github.com/landonb/dubsacks_vim.git ~/.vim/bundle
   # Make sure Vim is dead before zapping the Session file.
   /bin/rm -f ~/.vim/Session.vim
   gvim

And then run ``:Helptags`` to rebuild all the docs.

If you want access to the best features, install additional packages.
E.g., on Ubuntu, run

.. code-block:: bash

   sudo apt-get install -y \
      silversearcher-ag exuberant-ctags par

If you need a little more guidance, read on.

Longform Install
----------------

.. note:: These instructions are for Linux Mint MATE.

          Dubsacks is known to work on other \*nixes.

          In you're running Gnome but not MATE,
          change ``vim-gtk`` to ``vim-gnome``.

          If you're installing on Fedora, replace
          ``sudo apt-get install`` with ``sudo yum install``
          and fix any package names (such as changing
          ``exuberant-ctags`` to ``ctags-etags``).

..          Dubsacks also works on Windows, but unless you're
..          installing in `Cygwin <https://www.cygwin.com/>`__
..          you could `grab the MSI installer
..          (FIXME: update installer and add link) <FIXME>`__.

1. Install platform packages.

Install at least gVim. Include the other packages to access more features.

.. code-block:: bash

   sudo apt-get install -y \
      vim-gtk \
      silversearcher-ag \
      exuberant-ctags \
      par

- See below for a description of the additional packages.

2. Install Pathogen.

Install the
`Pathogen <https://github.com/tpope/vim-pathogen>`__
Vim package manager.

.. code-block:: bash

   mkdir -p ~/.vim/autoload ~/.vim/bundle
   curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Add the pathogen wiring command to your ``.vimrc`` or equivalent:

.. code-block:: vim

   execute pathogen#infect()

2. Download and install Dubsacks.

Download Dubsacks from
`github <http://github.com/landonb/dubsacks>`__
and install to the Pathogen space.

.. code-block:: bash

   git clone git://github.com/landonb/dubsacks_vim.git ~/.vim/bundle

3. Download all the Submodules.

.. code-block:: bash

   cd ~/.vim/bundle/dubsacks_vim

   git submodules update

4. Update your infection string.

   In ``~/.vimrc``, or wherever you've got it, add the new ``bundle`` path.

.. code-block:: vim

   execute pathogen#infect('bundle/{}', 'bundle/dubsacks_vim/bundle/{}')

5. Restart Vim.

Quit Vim if it's running, delete the session file if it exists
(so that Vim reloads its runtime), and restart Vim.

.. code-block:: bash

   # Quit Vim, then:
   /bin/rm -f ~/.vim/Session.vim
   gvim

6. Build Documentation.

From within Vim, build documentation.

.. code-block:: vim

   :Helptags

Next Steps
----------

Read the documentation
^^^^^^^^^^^^^^^^^^^^^^

See `Dubsacks Vim Reference <USING.rst>`__
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

When you run Dubsacks for the first time, it'll make a
copy of ``dubs_file_finder/cmdt_paths.template`` and link
it from ``dubs_all/cmdt_paths``.

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

Open the file ``dubs_all/dubs_projects.vim``
and add your project paths to the list of
projects. This list is display when your search
with either ``\g`` or the ``F4`` mappings.

3. Hack away.

Like most things Vim, after reading the docs and
testing a new plugin, you'll want to get your hands
dirty. Happy hacking!

Third-Party Package Descriptions
--------------------------------

Following is an explanation of the optional
``aptitude`` packages that can be installed
to enable more features:

- `Exuberant Ctags <http://ctags.sourceforge.net/>`__
  lets you jump to function definitions using ``Ctrl-]``.
  (You'll have to run ``ctags`` on your source
  to generate one or more ``tags`` files first;
  edit the file ``dubs_all/dubs_tagpaths.vim``.)

- `Par <http://www.nicemice.net/par/>`__
  lets you reformat text to a preset width (e.g., press ``Shift-F2``
  to intelligently resize a selected text block of code to 80
  characters wide, preserving indents, prefixes and postfixes).

Third-party Vim Plugins
-----------------------

Dubsacks includes and incorporates
a number of third-party Vim plugins.

You can generally access each plugin's feature using the
normal commands defined by the plugin, but Dubsacks also
remaps and wraps calls to third-party plugins to make them
more seamless and easy to access.

See the `Dubsacks Vim Reference <USING.rst>`__
for a list of all Dubsacks commands, including
those provided by other people's plugins.

Disclaimer
----------

Dubsacks mostly adds new key bindings not already mapped by
standard Vim or changed by MS-Windows mode (``behave mswin``).
However, a few standard key bindings have been remapped.
You probably won't notice the changes, but you might.
See `Differences from Vim <USING.rst#Differences_from_Vim>`__
for the list of binding differences.

Contributing
------------

Dubsacks is just one developer's IDE, and it's pretty mature,
so I can't imagine receiving pull requests. However, feel free
to send one, or a note, or add a comment if you'd like to suggest
any plugins to add or other changes to make. Though I might be
slow to respond.

Licenses
--------

Custom Dubsacks code (in files with names beginning ``dubs``)
is licensed under `GPLv3 <https://www.gnu.org/copyleft/gpl.html>`__.

Third-party code is copyright by their respective authors
and licensed according to their own licenses, which are
mostly Vim, or MIT- or GPL-like. See each Vendor's
source file for the specific license.

And "Vim is charityware. Its `license <http://www.vim.org/about.php>`__
is GPL-compatible, so it's distributed freely, but we ask that if you
find it useful you make a donation to help children in Uganda through the
`ICCF <http://iccf-holland.org/>`__.
The full license text can be found in the
`documentation
<http://vimdoc.sourceforge.net/htmldoc/uganda.html#license>`__.
Much more information
about charityware on
`Charityware.info <http://charityware.info/>`__."

