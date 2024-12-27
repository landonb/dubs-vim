Installation
============

.. |help-packages| replace:: ``:h packages``
.. _help-packages: https://vimhelp.org/repeat.txt.html#packages

.. |INSTALL.md| replace:: ``INSTALL.md``
.. _INSTALL.md: INSTALL.md

Take advantage of Vim's packages feature (|help-packages|_)
and install under ``~/.vim/pack``, e.g.,:

.. code-block::

  mkdir -p ~/.vim/pack/ORG_NAME/start
  cd ~/.vim/pack/ORG_NAME/start
  git clone https://github.com/ORG_NAME/PLUG_NAME.git

  " Build help tags
  vim -u NONE -c "helptags PLUG_NAME/doc" -c q

- Alternatively, install under ``~/.vim/pack/ORG_NAME/opt`` and call
  ``:packadd PLUG_NAME`` to load the plugin on-demand.

For more installation tips — including how to easily keep the
plugin up-to-date — please see |INSTALL.md|_.

Attribution
===========

.. |ORG_NAME| replace:: ``ORG_NAME``
.. _ORG_NAME: https://github.com/ORG_NAME

.. |@landonb| replace:: ``@landonb``
.. _@landonb: https://github.com/landonb

The |ORG_NAME|_ logo by |@landonb|_ contains
`coffee cup with straw by farra nugraha from Noun Project
<https://thenounproject.com/icon/coffee-cup-with-straw-6961731/>`__
(CC BY 3.0).

