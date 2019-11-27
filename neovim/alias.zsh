#! /usr/bin/env zsh

# `enc` for `editor no config`, `-u <config file>`
# would need to update with new editors
# TODO: check that this still works (if so setting `backspace` behavior in `options.vim` may no longer be necessary)
alias enc="$EDITOR -u /dev/null"

# `emp` for `editor markdown preview`, `-c MarkdownPreview`
# requires https://github.com/iamcco/markdown-preview.nvim
alias emp="$EDITOR -c MarkdownPreview"
