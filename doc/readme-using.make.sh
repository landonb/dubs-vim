#!/usr/bin/env bash

build_readme_using () {
  cd "${HOME}/.vim/doc"

  local target=../README-USING.rst

  cat readme-using.pt1.rst > ${target}

  local startd="${HOME}/.vim/pack/landonb/start"
  # local optd="${HOME}/.vim/pack/landonb/optd"

  local depoxy="${HOME}/.vim/pack/DepoXy/start"

  local embrace="${HOME}/.vim/pack/embrace-vim/start"

  # PARITY: See directories under ~/.vim/pack/landonb/start
  # OHWELL: Ideally, I'd convert README.md → README.rst (and ensure
  #         README-USING.rst includes all my plugs), but I've been
  #         thinking that having a *huge* README is not so valuable.
  #         - I might just pare README-USING.rst to a list of all
  #           (currently 96) plugs that I use, rather than also
  #           coalescing my plugs' READMEs therein, which is of
  #           questionable utility. (Though really I'll probably
  #           do nothing, because this task is not a priority,
  #           and I need to focus my attention elsewhere.)

  # (forked) md2rst "${startd}/ansible-vim/README.md" >> ${target}
  cat "${startd}/dubs_after_dark/README.rst" >> ${target}
  cat "${startd}/dubs_appearance/README.rst" >> ${target}
  cat "${startd}/dubs_buffer_fun/README.rst" >> ${target}
  cat "${startd}/dubs_edit_juice/README.rst" >> ${target}
  # (opted) cat "${optd}/opt/dubs_file_finder/README.rst" >> ${target}
  cat "${startd}/dubs_ftype_mess/README.rst" >> ${target}
  cat "${startd}/dubs_grep_steady/README.rst" >> ${target}
  cat "${startd}/dubs_html_entities/README.rst" >> ${target}
  cat "${startd}/dubs_mescaline/README.rst" >> ${target}
  cat "${startd}/dubs_project_tray/README.rst" >> ${target}
  cat "${startd}/dubs_quickfix_wrap/README.rst" >> ${target}
  cat "${startd}/dubs_style_guard/README.rst" >> ${target}
  # (opted) cat "${optd}/dubs_syntastic_wrap/README.rst" >> ${target}
  cat "${startd}/dubs_toggle_textwrap/README.rst" >> ${target}
  # (forked) cat ${startd}/QFEnter/README.md" >> ${target}
  md2rst "${embrace}/vim-async-mapper/README.md" >> ${target}
  md2rst "${startd}/vim-buffer-ring/README.md" >> ${target}
  # (forked) md2rst "${startd}/vim-classic-taglist/README.rst" >> ${target}
  md2rst "${depoxy}/vim-clip-expand-path/README.md" >> ${target}
  md2rst "${startd}/vim-command-line-clock/README.md" >> ${target}
  md2rst "${depoxy}/vim-depoxy-coc-defaults/README.md" >> ${target}
  cat "${startd}/vim-fullscreen-toggle/README.rst" >> ${target}
  cat "${embrace}/vim-goto-file-sh/README.rst" >> ${target}
  md2rst "${startd}/vim-lcd-project-root/README.md" >> ${target}
  # (forked) md2rst "${startd}/vim-markdown/README.md" >> ${target}
  cat "${startd}/vim-mkspell-when-stale/README.rst" >> ${target}
  md2rst "${startd}/vim-netrw-cfg-split-explorer/README.md" >> ${target}
  md2rst "${startd}/vim-netrw-link-resolve/README.md" >> ${target}
  cat "${startd}/vim-nicer-file-changed-prompt/README.rst" >> ${target}
  cat "${startd}/vim-ovm-easyescape-kj-jk/README.rst" >> ${target}
  cat "${startd}/vim-ovm-seven-of-spines/README.rst" >> ${target}
  cat "${startd}/vim-reSTfold/README.rst" >> ${target}
  cat "${startd}/vim-reST-highdefs/README.rst" >> ${target}
  cat "${startd}/vim-reST-highfive/README.rst" >> ${target}
  cat "${startd}/vim-reST-highline/README.rst" >> ${target}
  cat "${startd}/vim-select-mode-stopped-down/README.rst" >> ${target}
  cat "${embrace}/vim-web-hatch/README.rst" >> ${target}
  md2rst "${startd}/vim-source-reloader/README.md" >> ${target}
  # (forked) md2rst "${startd}/vim-surround/README.markdown" >> ${target}
  md2rst "${startd}/vim-title-bar-time-of-day/README.md" >> ${target}
  # (forked) md2rst "${startd}/vim-tmux-navigator/README.markdown" >> ${target}
  # (forked) md2rst "${startd}/vim-unimpaired/README.markdown" >> ${target}

  cat "readme-using.pt2.rst" >> ${target}
}

# ***

# REFER: pandoc `--from` and `--to` are not required if the
# file extensions also match. E.g.,
#   # These are the same
#   $ pandoc --output=index.rst index.md
#   $ pandoc --from=markdown --to=rst --output=index.rst index.md

# SAVVY: pandoc doesn't convert Markdown [`links`][links] well
# - It creates ``links` <https://links>`__ which doesn't
#   render as a link, but renders verbatim.
# - So we'll convert [`links`][links] to [links][links] first.
#
# ALTLY: I also tried this Python project, but it similarly had issues
# converting [`links`][links] (so why not stick with pandoc if we have
# to add pre- and post-processing anyway):
# - *Markdown to reStructuredText converter*:
#     pipx install m2r
#     m2r --overwrite README.md && mv README.rst README-m2r.rst
#   https://github.com/miyakogi/m2r

md2rst () {
  local file="$1"

  sanitize_links () {
    sed -E 's/\[`([^`]*)`\]/\[\1\]/g' "${file}"
  }

  # pandoc uses the 5 header level delimiters: === --- ~~~ ^^^ '''
  # Whereas author uses reST level delimiters: ### === ---
  # - Note, too, first header must be overlined, too.
  # - Avoids restview render error: "(SEVERE/4) Title level inconsistent"
  upgrade_headers () {
    sed \
      -e '/^==[=]*/ s/=/#/g' \
      -e '/^--[-]*/ s/-/=/g' \
      -e '/^~~[~]*/ s/~/-/g'
  }

  # 2p prints the second line when it's read.
  # H appends current line to hold space, but with newline prefix.
  # 1h overwrites the hold space for first line without the newline.
  # $!d means if this is not (!) the last line ($), delete the line
  #   from the pattern space (don't print it), and start the next
  #   cycle (so following commands only execute for last line).
  # x swaps contents of the pattern and hold spaces, which only runs
  #   on the last line — and when it runs, the pattern space is the
  #   last line, and the hold space contains everything collected so
  #   far. So the swap puts the hold space in the pattern space, which
  #   is then printed.
  overline_title () {
    sed -e '2p;H;1h;$!d;x'
  }

  pandoc --from=markdown --to=rst <(sanitize_links) \
    | upgrade_headers \
    | overline_title

  # Ensure followed by newline (if not, and next doc's header does
  # not follow a blank line, "Title level inconsistent"). 
  echo
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

main () {
  local before_cd="$(pwd -L)"

  build_readme_using

  cd "${before_cd}"
}

main "$@"

