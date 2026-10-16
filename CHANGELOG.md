## 0.1.0 (2026-10-16)

### Feat

- **emacs28**: add magit
- **emacs31**: add magit
- **task**: add install tasks for vim9, emacs31 and zed
- **emacs29**: add straight.el configuration for Emacs 29 or later
- **vim**: make C-y behave like Emacs yank
- **emacs**: add init.el and early-init.el
- **zed**: set fish as terminal shell
- **zed**: add settings and keymap
- **vim**: align D, Y and M-w with Emacs
- **vim**: bootstrap vim-plug on first run
- **vim**: add vim-commentary and fix comment toggle keymap
- **vim**: add vimrc
- add docs site, Taskfile, release skill and templates

### Fix

- **vim8**: replace <Esc> mapping with C-l to avoid starting in Replace mode
- **vim**: simplify vim8rc paths, guard undofile, fix map-mode comments
- **vim**: match Emacs split direction for C-x 2 and C-x 3
- **vim**: group autocmds, skip trim for markdown/diff, add leader Vim binds
- **vim**: set clipboard per platform when available
- **vim**: use custom status line only when airline is unavailable
- **vim**: hide mode at command line
- **vim**: guard showcmdloc and always show tabline
- **vim**: create backup, swap and undo directories
- **vim**: add missing colon to list functions keymap
- **vim**: correct M-> keymap notation
- **vim**: remove broken insert/cmdline keymap list bindings
- **vim**: move inline comments out of fold mappings
- **vim**: correct trailing space removal on save

### Refactor

- **task**: simplify install tasks with preconditions and for
- **emacs28**: rename emacs29 to emacs28 and install use-package with straight.el
- **emacs**: move emacs configuration to emacs31
- **vim9**: drop obsolete options and use <Cmd> for Emacs-like Ex keys
- **vim**: move vim8rc and vim9rc to vim8/vimrc and vim9/vimrc
- **vim**: split vimrc into vim8rc and vim9rc
- **vim**: derive vim directory from vimrc location
- **zed**: remove claude-acp-custom agent server
- **vim**: remove smartindent
- **vim**: move nocompatible to the top
