## Installation

Take advantage of Vim's packages feature
([`:h packages`](https://vimhelp.org/repeat.txt.html#packages))
and install under `~/.vim/pack`, e.g.,:

  ```shell
  mkdir -p ~/.vim/pack/ORG_NAME/start
  cd ~/.vim/pack/ORG_NAME/start
  git clone https://github.com/ORG_NAME/PLUG_NAME.git

  " Build help tags
  vim -u NONE -c "helptags PLUG_NAME/doc" -c q
  ```

- Alternatively, install under `~/.vim/pack/ORG_NAME/opt` and call
  `:packadd PLUG_NAME` to load the plugin on-demand.

For more installation tips — including how to easily keep the
plugin up-to-date — please see [`INSTALL.md`](INSTALL.md).

## Attribution

The [`ORG_NAME`][ORG_NAME] logo by [`@landonb`][@landonb] contains
[coffee cup with straw by farra nugraha from Noun Project](https://thenounproject.com/icon/coffee-cup-with-straw-6961731/) (CC BY 3.0).

[ORG_NAME]: https://github.com/ORG_NAME
[@landonb]: https://github.com/landonb

