#!/usr/bin/env bash
# vim:tw=0:ts=2:sw=2:et:norl:ft=bash
# Author: Landon Bouma <https://tallybark.com/>
# Project: https://github.com/landonb/dubs-vim#✌️
# License: GPLv3

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

build_readme_using () {
  cd "${HOME}/.vim/doc"

  local target=../README-USING.rst

  gpwcat "readme-using.pt1.rst" > ${target}

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

  # (forked) filter_mkd "${startd}/ansible-vim/README.md" >> ${target}
  filter_rst "${startd}/dubs_after_dark/README.rst" >> ${target}
  filter_rst "${startd}/dubs_appearance/README.rst" >> ${target}
  filter_rst "${startd}/dubs_edit_juice/README.rst" >> ${target}
  # (opted) filter_rst "${optd}/opt/dubs_file_finder/README.rst" >> ${target}
  filter_rst "${startd}/dubs_ftype_mess/README.rst" >> ${target}
  filter_rst "${startd}/dubs_grep_steady/README.rst" >> ${target}
  filter_rst "${startd}/dubs_html_entities/README.rst" >> ${target}
  filter_rst "${startd}/dubs_mescaline/README.rst" >> ${target}
  filter_rst "${startd}/dubs_project_tray/README.rst" >> ${target}
  filter_rst "${startd}/dubs_quickfix_wrap/README.rst" >> ${target}
  filter_rst "${startd}/dubs_style_guard/README.rst" >> ${target}
  # (opted) filter_rst "${optd}/dubs_syntastic_wrap/README.rst" >> ${target}
  filter_rst "${startd}/dubs_toggle_textwrap/README.rst" >> ${target}
  # (forked) filter_mkd ${startd}/QFEnter/README.md" >> ${target}
  filter_mkd "${embrace}/vim-async-map/README.md" >> ${target}
  filter_rst "${embrace}/vim-blinky-search/README.rst" >> ${target}
  filter_rst "${embrace}/vim-buffer-delights/README.rst" >> ${target}
  filter_mkd "${startd}/vim-buffer-ring/README.md" >> ${target}
  # (forked) filter_rst "${startd}/vim-classic-taglist/README.rst" >> ${target}
  filter_mkd "${depoxy}/vim-clip-expand-path/README.md" >> ${target}
  filter_mkd "${startd}/vim-command-line-clock/README.md" >> ${target}
  filter_mkd "${depoxy}/vim-depoxy-coc-defaults/README.md" >> ${target}
  filter_rst "${startd}/vim-fullscreen-toggle/README.rst" >> ${target}
  filter_rst "${embrace}/vim-goto-file-sh/README.rst" >> ${target}
  filter_mkd "${startd}/vim-lcd-project-root/README.md" >> ${target}
  # (forked) filter_mkd "${startd}/vim-markdown/README.md" >> ${target}
  filter_rst "${startd}/vim-mkspell-when-stale/README.rst" >> ${target}
  filter_mkd "${startd}/vim-netrw-cfg-split-explorer/README.md" >> ${target}
  filter_rst "${embrace}/vim-netrw-explore-map/README.rst" >> ${target}
  filter_mkd "${startd}/vim-netrw-link-resolve/README.md" >> ${target}
  filter_rst "${startd}/vim-nicer-file-changed-prompt/README.rst" >> ${target}
  filter_rst "${startd}/vim-ovm-easyescape-kj-jk/README.rst" >> ${target}
  filter_rst "${startd}/vim-ovm-seven-of-spines/README.rst" >> ${target}
  filter_rst "${startd}/vim-reSTfold/README.rst" >> ${target}
  filter_rst "${startd}/vim-reST-highdefs/README.rst" >> ${target}
  filter_rst "${startd}/vim-reST-highfive/README.rst" >> ${target}
  filter_rst "${startd}/vim-reST-highline/README.rst" >> ${target}
  filter_rst "${startd}/vim-select-mode-stopped-down/README.rst" >> ${target}
  filter_rst "${embrace}/vim-webopen/README.rst" >> ${target}
  filter_mkd "${startd}/vim-source-reloader/README.md" >> ${target}
  # (forked) filter_mkd "${startd}/vim-surround/README.markdown" >> ${target}
  filter_mkd "${startd}/vim-title-bar-time-of-day/README.md" >> ${target}
  # (forked) filter_mkd "${startd}/vim-tmux-navigator/README.markdown" >> ${target}
  # (forked) filter_mkd "${startd}/vim-unimpaired/README.markdown" >> ${target}

  gpwcat "readme-using.pt2.rst" >> ${target}
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

# Remove common "Installation" and "Attribution" sections (that all
# say the same thing and aren't very helpful in the larger help doc).

filter_rst () {
  local file="$1"

  gpwcat "${file}" | filter_common_sections
}

filter_mkd () {
  local file="$1"

  md2rst "${file}" | filter_common_sections
}

# Filter matching sections and their content:
#
#   Installation
#   ============
#   ...
#
# and
#
#   Attribution
#   ===========
#   ...

filter_common_sections () {
  awk '
    BEGIN {
      prev_line = "";
      title_matched = 0;
      ignore_section = 0;
    }

    {
      if ($0 ~ /^===[=]*$/) {
        # Found section delimiter
        if (title_matched) {
          # Found section to ignore.
          ignore_section = 1;
          title_matched = 0;

          next
        }
        else if (ignore_section) {
          # Entered a new section.
          ignore_section = 0;
          # Print previous title.
          print prev_line;
        }
      }
      else if (title_matched) {
        title_matched = 0;
        print prev_line;
      }

      prev_line = $0;

      if (($0 ~ /^Installation$/) || ($0 ~ /^Attribution$/)) {
        title_matched = 1;

        next;
      }

      if (ignore_section) {
        next;
      }

      print;
    }
  '
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

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
    sed -E 's/\[`([^`]*)`\]/\[\1\]/g' <(gpwcat "${file}")
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
  # REFER/2024-12-19: Here's a great sed example — with comments!:
  #   https://github.com/preservim/vim-markdown/blob/8f6cb3a/Makefile#L49-L75
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

source_deps_gpw () {
  # Optional: git-put-wise, for 'identify_scope_ends_at'.
  # CXREF: https://github.com/DepoXy/git-put-wise#🥨
  # - For color support:
  #   ~/.kit/git/git-put-wise/deps/sh-logger/bin/logger.sh
  # - For SCOPING_PREFIX, PRIVATE_PREFIX, etc.:
  #   ~/.kit/git/git-put-wise/lib/common_put_wise.sh
  # - For identify_scope_ends_at:
  #   ~/.kit/git/git-put-wise/lib/dep_scoped_commits.sh
  # - For put_wise_identify_rebase_boundary_and_remotes:
  #   ~/.kit/git/git-put-wise/lib/dep_rebase_boundary.sh
  # SAVVY: common_put_wise.sh requires Bash (it uses `< <()`).
  if command -v git-put-wise > /dev/null; then
    # Assumes on a DepoXy environment (this script not really meant
    # to be usable by *any* developer; otherwise we'd include a copy
    # of this source with the ~/.vim project).
    # - Load git_* functions, including:
    #   git_upstream_parse_remote_name
    #   git_upstream_parse_branch_name
    . "${SHOILERPLATE:-${HOME}/.kit/sh}/sh-git-nubs/lib/git-nubs.sh"

    local put_wise_bin="$(dirname -- "$(realpath -- "$(command -v git-put-wise)")")"
    . "${put_wise_bin}/../deps/sh-logger/bin/logger.sh"
    . "${put_wise_bin}/../lib/common_put_wise.sh"
    . "${put_wise_bin}/../lib/dep_scoped_commits.sh"
    . "${put_wise_bin}/../lib/dep_rebase_boundary.sh"
  fi
}

# When catting files, pluck out the release commit, and ignore any
# scoped ("PROTECTED", "PRIVATE") commits managed by git-put-wise:
#   https://github.com/DepoXy/git-put-wise#🥨
gpwcat () {
  local file="$1"

  (
    cd -- "$(dirname -- "${file}")"

    local curr_dir="${PWD}"

    # commacd always walks up first, so pretend we're one down.
    local git_root="$(_commacd_backward_vcs_root)"

    local rel_path=${curr_dir#${git_root}}

    if [ -n "${rel_path}" ]; then
      rel_path="${rel_path#/}/"
    fi

    local scoped_head
    scoped_head="$(print_scoped_head)"

    git show "${scoped_head}:${rel_path}$(basename -- "${file}")"
  )
}

SCOPING_PREFIX="${SCOPING_PREFIX:-PROTECTED: }"
PRIVATE_PREFIX="${PRIVATE_PREFIX:-PRIVATE: }"

# COPYD: ~/.kit/git/git-bump-version-tag/bin/git-bump-version-tag
print_scoped_head () {
  local scoped_head_sha=""

  # Optional: git-put-wise scope logic.
  if ! command -v git-put-wise > /dev/null; then
    scoped_head_sha="HEAD"
  else
    # Exclude latest commits whose messages start with "PRIVATE: " or
    # "PROTECTED: ". Use case: So you can keep some stuff private to
    # your local repo without needing to maintain a separate feature
    # branch.
    local release_boundary_or_HEAD
    release_boundary_or_HEAD="$( \
      identify_scope_ends_at "^${SCOPING_PREFIX}" "^${PRIVATE_PREFIX}" \
    )"

    if [ "${release_boundary_or_HEAD}" = "HEAD" ]; then
      scoped_head_sha="HEAD"
    else
      scoped_head_sha="${release_boundary_or_HEAD}"
    fi
  fi

  printf "%s" "${scoped_head_sha}"
}

# COPYD: From commacd <https://github.com/shyiko/commacd>
# - Version v0.4.0 [8454f90]
# - With one change: Look at current dir. first.
#
# search backward for the vcs root (`,,`)
_commacd_backward_vcs_root() {
  # local dir="${PWD%/*}"
  local dir="${PWD}"

  while [[ ! -d "$dir/.git" && ! -d "$dir/.hg" && ! -d "$dir/.svn" ]]; do
    dir="${dir%/*}"
    if [[ -z "$dir" ]]; then
      echo -n "$PWD"
      return
    fi
  done
  echo -n "$dir"
}

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

main () {
  set -e

  local before_cd="$(pwd -L)"

  source_deps_gpw

  build_readme_using

  cd "${before_cd}"
}

main "$@"

