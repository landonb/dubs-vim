################
Additional Notes
################

The Alt-Shift Mappings (Revisited)
==================================

The alt-shift commands show and hide special windows.

Most of these commands were introduced above, but they're
produced here, in one nice, cozy list.

You should be able to use your left hand to access these
commands -- with a thumb on the ``<Alt>`` key and your pinky on
the ``<Shift>`` key, you should be able to peck a number key
with your pointer or middle finger.

===========================  ============================  ==============================================================================
 Key Mapping                  Description                   Notes
===========================  ============================  ==============================================================================
 ``<Shift-Alt-1>``            Toggle ASCII                  Decimal and Hexadecimal 8-bit character set
                              Character Table               (based on `CharTab <http://www.vim.org/scripts/script.php?script_id=898>`__).
                                                            
                                                            *Hint:* Hit ``b`` to toggle between bases (radices).
                                                            To return to the previous buffer, hit ``q``, ``<ESC>`` or ``<Shift-Alt-1>``.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Shift-Alt-2>``            Toggle                        Show/Hide the
                              MiniBufExplorer               `MiniBuf Explorer <http://www.vim.org/scripts/script.php?script_id=159>`__
                                                            window.
                                                            
                                                            Shows a compact list of open buffers, highlights the unsaved buffers,
                                                            and let's you double-click (or cursor-over and hit ``ENTER``) to load
                                                            buffers. It occupies the bottom of the screen, sitting above the
                                                            command line and beneath the quickfix window.
                                                            
                                                            *Caveat:* Using the MiniBuf Explorer can be tedious, especially
                                                            if you've loaded a lot of buffers. There are easier ways to switch
                                                            buffers -- specifically, the ``Shift-F2`` command maps to the built-in
                                                            ``:ls<CR>:b`` command sequence and supports autocomplete.
                                                            You can also quickly find files (and not just loaded buffers),
                                                            using the Control-T command, mapped to ``Ctrl-D``, which also
                                                            supports autocomplete,
                                                            or by using the Project plugin, mapped to ``Alt-Shift-F4``.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Shift-Alt-3>``            Toggle                        Show/Hide the
                              Quickfix Window               `QuickFix <http://vimdoc.sourceforge.net/htmldoc/quickfix.html>`__
                                                            window.
                                                            
                                                            The QuickFix list shows search results, stack traces, and log file output.
                                                            It occupies the bottom part of the screen, above the command line
                                                            (or above the MiniBufExplorer, if that's showing).
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Shift-Alt-4>``            Toggle                        Show/Hide the
                              Project Plugin Tray           `Project <http://www.vim.org/scripts/script.php?script_id=69>`__ window.
                                                            Also, position and resize side-by-side windows vertically (see below).
                                                            
                                                            The project window shows all of your source files.
                                                            See ``:help project``.
                                                            
                                                            *Hint:* If you know the name of the file you want to open, move your
                                                            cursor to the project window and type ``/`` to start a search, search
                                                            for the file, then click ``ENTER`` to open the file.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Shift-Alt-5>``            Toggle HTML                   Show special HTML character entity lookup.
                              Character Entity Table        You can switch between decimal, hexadecimal, and friendly names.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Shift-Alt-6>``            Toggle Tag list               Show/Hide the
                                                            `Tag List <http://www.vim.org/scripts/script.php?script_id=273>`__
                                                            window.
                                                            
                                                            Calls ``:TlistToggle``. See ``:help taglist``.
                                                            
                                                            *Hint:* Run ``ctags`` on your code to make a ``tags`` file first,
                                                            and then ``:set tags=<path,path,...>`` in Vim to point to the ``tags`` file.
                                                            You can setup different tags for different file types and projects;
                                                            see ``dubs_file_finder/dubs_projects.vim``, which you can customize.
===========================  ============================  ==============================================================================

Differences from Vim
====================

Note: This list is incomplete. Sorry!
(But it's probably not *that* incomplete.)

===========================  ============================  ==============================================================================
 Key Mapping                  Description                   Notes
===========================  ============================  ==============================================================================
 ``<Ctrl-Q><Shift-Click>``    Block Select                  In Vim without customization, Block Select is mapped to ``<Ctrl-V>``.
                                                            I suppose this is because Vim was coded before Ctrl-Z/-X/-C/-V became convention.
                                                            Still, you'd think they'd have let go of the past by now...
                                                            shows you how much old-skool geeks love their quirks.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Alt-f>c``                 Close Buffer                  In gVim without customization, closing a file either closes the window
                              (File > Close)                (if there are two or more open) or just creates a new buffer and shows that;
                                                            it doesn't actually unload the buffer, which is what you'd think a close should do:
                                                            Hey, I'm done with this file, get it out of my buffer list.
                                                            Oh, and load the last buffer I was viewing instead of a new one
                                                            (which is what Vim's default File > Close does,
                                                            which is to load a new buffer rather than show the most-recently-shown buffer).
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Alt-f>e``                 Close All Buffers             When you quit Vim, it remembers your opened buffers,
                              (File > Close All)            which is cool the next time you open Vim.
                                                            (Though it'd be nice if it remembered your undo/redo
                                                            command history, as well).
                                                            But if you've edited anything under ~/.vim and quit Vim,
                                                            on reload, Vim just loads ~/.vim/Session.vim and
                                                            ignores ~/.vim/plugin, because Session.vim exists.
                                                            So hit Alt-f e to close all buffers **and** to delete
                                                            Session.vim. Hint: After ``<Alt-f>e`` hit ``<Alt-f>x``
                                                            to quit Vim. Restart it to reload your plugins;
                                                            hopefully Vim doesn't complain about errors.
                                                            Caveat: Sometimes when you reload Vim and the
                                                            Project window is open, double-clicking does nothing.
                                                            Hit ``<Alt-f e>`` to close all windows,
                                                            then hit ``<Shift-Alt-4>`` to re-open the
                                                            Project window, which should now respond as expected.
                                                            Uses the great
                                                            `BufOnly plugin <http://www.vim.org/scripts/script.php?script_id=1071>`__.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Alt-f>l``                  Save All Buffers             This is an EditPlus mapping: type ``<Alt-f>l`` to save all buffers
                               (File > Save All)            that have been edited.
                                                            (This could have been mapped, e.g., to ``<Alt-Shift-S>``,
                                                            but that's not a very ergonomically-happy hand position to type,
                                                            at least for six-finger typers who aren't well-versed with using
                                                            pinkies and ring-fingies to strike the 's' key;
                                                            anyway, Alt-f with the left hand followed by the 'l' key with the right hand
                                                            is a nice way of saying, "I'm saving!")
                                                            Caveat: This displaces the default gVim command for ``<Alt-f>l``
                                                            which we've mapped to ``<Alt-f>t`` which does a Split Open,
                                                            i.e., presents an Open Dialog and then creates a split window to show the new buffer.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Alt-f>n``                 Open New Buffer               Opens a new buffer in the active window.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Alt-w>n``                 Open New Buffer               Starts a new buffer in a new window above the active window.
                              in New Window Above           Caveat: [lb] nevers uses this; though it might be useful for notes;
                                                            it's just that it's tedious to save a new buffer from Vim: it's easier to
                                                            'touch' a file in a terminal and then send it to gVim (from the terminal)
                                                            than it is to create a new buffer in Vim and save that (because ``<Ctrl-s>``
                                                            complains that there's no name, so you have to type ``<Alt-f>s``
                                                            and then you're never in the directory that you want to be in,
                                                            and you have to use your mouse to find the directory where you want to save;
                                                            so it's easier to just ``<Alt-Tab>`` to a terminal and touch a blank file and go from there).
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Alt-PageUp/-PageDown>``   Switch Tabs                   I [lb] almost never uses tabs in Vim
                                                            (with the exception of ``:TabMessage`` which is often the only way to copy the output of a Vim command).
                                                            But if you do, ``<Alt-PageUp>`` and ``<Alt-PageDown>`` can be used to iterate
                                                            through the list of tabs.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<[Shift-]Ctrl-Tab>``       Walk Buffer List              In stock Vim, ``<Ctrl-Tab>`` and ``<Shift-Ctrl-Tab>`` move the cursor between windows.
                                                            In Dubs Vim, they walk the buffer list by order the buffers were loaded.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Ctrl-D>``                 Command-T Wrapper             In stock Vim, ``<Ctrl-D>`` scrolls the window downwards in the buffer.
                                                            In Dubs Vim, it triggers the Command-T wrapper feature.
---------------------------  ----------------------------  ------------------------------------------------------------------------------
 ``<Ctrl-E>``                 Syntastic Wrapper             In stock Vim, ``<Ctrl-E>`` scrolls the window downwards in the buffer.
                                                            In Dubs Vim, it triggers the Syntastic wrapper feature.
===========================  ============================  ==============================================================================

Customizable Features
=====================

Some plugins are customizable, as discussed above.

Also, don't forget to reload the runtime after editing sources.
You can do this in a few different ways:

   - Quit Vim and delete ``~/.vim/Session.vim``; or

   - Use the ``:runtime! {file}`` command; or

   - If you're running Dubs Vim, release all buffers and
     quit, which will delete the Session file.
     Type ``<Alt-f>e`` to close all windows and then
     type ``<Alt-f>x`` to quit,
     and Dubs Vim will destroy Session.vim on its way out.

Non-Interactive Features
========================

Silent Features
---------------

Dubs Vim uses a few plugins under the hood which
run seamlessly and with which you probably won't
interact.

Most of these were already mentioned, save for the
one that rules them all:

`Pathogen <https://github.com/tpope/vim-pathogen>`__
manages third-party plugins.
It wires Vim's runtimepath so
that multiple ``~/.vim``-like directories can live
under ``~/.vim/bundle``, precluding you from having
to move everything to the same directory, e.g.,
you no longer need to copy all plugins to your
``~/.vim/plugin`` directory.

OS Workflow Tips and Tricks
===========================

Bash Aliases
------------

If you want to open files from the command line and want them
to open in the same instance of gVim, you'll have to use the same
``--servername`` name, otherwise a new gVim is started for
each file you open.

To make it easy for me to open a file in a specific gVim
instance, I alias a number of easily-typed commands.

.. code-block:: bash

   alias fa='gvim --servername ALPHA --remote-silent'
   alias fs='gvim --servername SAMPI --remote-silent'
   alias fd='gvim --servername DELTA --remote-silent'
   alias ff='gvim --servername DIGAMMA --remote-silent'

I usually type ``fs <filename>`` to open files from the
command line. Rarely, I use one of the other commands
when I want to use a new instance to open a file.

Global Keyboard Shortcut
------------------------

Using the ``xdotool`` and Keyboard Shortcuts, you can
map, e.g., ``Windows-~`` to your favorite gVim instance
so you can always jump to it easily.

Install ``xdotool``.

.. code-block:: bash

   sudo yum install xdotool

Now configure your window manager.

On MATE, the Windows (``Super``) key is already mapped
to the MATE menu, so remap it.

- Right-click MATE Menu and Choose "Preferences".

- Click the button after "Keyboard shortcut"
  (probably named "Super_L") once to clear the key mapping.

- Click the same button, now named "Pick an accelerator",
  to set a new mapping.

- Press a new key combination, e.g., ``Super-Shift``
  changes the button to "<Super>Shift_L".

On MATE or Gnome, the instructions to set a shortcut to bring
gVim to the foreground are similar.

- Click the MATE or Gnome Menu and
  open "Preferences > Keyboard Shortcuts".

- Click "Add" and fill in the dialog:

 - Name: ``gVim [fs]``

 - Command: ``xdotool search --name SAMPI windowactivate``

- Click "Apply".

- Click the text entitled "Disabled" to set a key mapping.

- Press the desired key sequence, e.g., ``Windows-key+\`backtick``.

- Verify that the Shortcut column now indicates ``Mod4+\```.

Alternatively, you can use the shell to do the above,
but note that the ``custom0`` location might already
exist on your system. This example is for Linux Mint MATE.

.. code-block:: bash

   sudo apt-get install -y gconf-editor dconf-cli xdotool

   gsettings set com.linuxmint.mintmenu hot-key '<Super>Shift_L'

   dconf write /org/mate/desktop/keybindings/custom0/action \
      "'xdotool search --name SAMPI windowactivate'"
   dconf write /org/mate/desktop/keybindings/custom0/binding \
      "'<Mod4>grave'"
   dconf write /org/mate/desktop/keybindings/custom0/name \
      "'gVim [fs]'"

Influences
==========

The first Dubs Vim loosely followed popular keyboard mappings
used by the wonderful `EditPlus <https://www.editplus.com/>`__
editor for Windows.

- If you're familiar with EditPlus, you'll notice that
  ``<Alt-Shift-3>`` opens the quickfix window (where file search
  results live), ``<Alt-Shift-4>`` opens the project tray,
  and ``<Ctrl-T>`` transposes characters, among other similarities.

But that was years ago, and Dubs Vim has evolved very much since then.

More recent improvements and changes have been influenced
by projects on which the author has worked, such as
`Cyclopath <http://cyclopath.org>`__, and by finding and
incorporating more and more useful plugins into the project.

Obsolete Help/Troubleshooting Installation
==========================================

Install Par on Fedora
---------------------

These are old instructions for building an ``rpm``
installation package for ``par``, for Fedora.

- On Ubuntu, ``par`` is found in the package repository,
  and it's recommended that you install that.
  It may also be the case nowadays that ``par`` is also
  part of the ``yum`` package repository, but the author
  hasn't confirmed.

See the `par homepage <http://www.nicemice.net/par/>`__.
These steps worked for the author back in 2010.

.. code-block:: bash

   rpm --eval '%{_sourcedir}'
   /home/your_username/rpmbuild/SOURCES

   mkdir -p ~/rpmbuild/SOURCES
   pushd ~/rpmbuild/SOURCES
   wget -N http://www.nicemice.net/par/Par152.tar.gz
   wget -N http://www.nicemice.net/par/par-1.52-1.spec.gz
   gunzip -v par-1.52-1.spec.gz``

   rpmbuild -ba ~/rpmbuild/SOURCES/par-1.52-1.spec``

Look for the output:

.. code-block:: bash

   Wrote: /home/your_username/rpmbuild/SRPMS/par-1.52-1.src.rpm
   Wrote: /home/your_username/rpmbuild/RPMS/x86_64/par-1.52-1.x86_64.rpm
   Wrote: /home/your_username/rpmbuild/RPMS/x86_64/par-debuginfo-1.52-1.x86_64.rpm

Install the package:

.. code-block:: bash

   sudo rpm -Uvh ~/rpmbuild/RPMS/x86_64/par-1.52-1.x86_64.rpm

NOTE: I did not try building par directly. You could try either:

.. code-block:: bash

   make -f protoMakefile
   # or
   make -f protoMakefile \
     CC="gcc -c -ansi -pedantic -O3 -DDONTFREE" LINK1="gcc -s"

GLib-GObject Errors
-------------------

Make sure you install the correct ``vim-*`` GUI for your OS.

If you install the wrong package, you'll have problems.

E.g., this happens if you install the Gnome version of gVim
in Linux Mint MATE:

.. code-block:: bash

   $ gvim <some_file>
   (gvim:23463): GLib-GObject-WARNING **: Attempt to add property GnomeProgram::sm-connect after class was initialised
   (gvim:23463): GLib-GObject-WARNING **: Attempt to add property GnomeProgram::show-crash-dialog after class was initialised
   (gvim:23463): GLib-GObject-WARNING **: Attempt to add property GnomeProgram::display after class was initialised
   (gvim:23463): GLib-GObject-WARNING **: Attempt to add property GnomeProgram::default-icon after class was initialised

   $ dpkg --status vim-gnome
   ...
   Status: install ok installed
   ...
   $ dpkg --status vim-gtk
   dpkg-query: package 'vim-gtk' is not installed and no information is available

To solve it, install the correct gVim:

.. code-block:: bash

   sudo apt-get remove vim-gnome
   sudo apt-get install vim-gtk

Happy Hacking!
==============

Thanks for your interest in Dubs Vim and all things Vim. Good luck!

