#! /usr/bin/env zsh

# enables functions defined in any folder named `functions` throughout this repo
# e.g. $DOTFILES/**/functions
#
# there are two ways (that I'm aware of) to enable functions in `zsh`. Let's say
# we have a function called `example` defined at "$DOTFILES/functions/example".
# We could either:
#
# 1. Source the function on load, e.g. `source "$DOTFILES/functions/example"`.
#    This can slow down load time for particularly complex functions.
# 2. Add the directory containing our function to `$fpath` and autoload the
#    function, e.g.
#    ```zsh
#    # the order of these two lines doesn't matter
#    autoload example
#    fpath=("$DOTFILES/functions" $fpath)
#    ```
#    The idea here is to declare our function to `zsh` and then tell it where to
#    look when (if) we actually call it. This nicely avoids loading it into
#    memory until we actually need to use it and can slightly speed up our shell
#    load time.
#
# This file takes the second approach for the aforementioned performance benefit
#
# ref - http://zsh.sourceforge.net/Intro/intro_4.html (search `autoload` for
# explanation of loading behavior described above)

# add all directories named `functions` throughout this repo to `fpath` and
# autoload any executable files in those folders
setopt extended_glob # required for below expansion
for dir in $DOTFILES/**/functions; do
  # `.#(.x:t)` selects all hidden (`.#` selects files starting with 0 or more
  # `.`s) & non-hidden executable (the `x`) files (the `.`) & extracts the
  # filename (the `:t`)
  # refs
  # - http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Qualifiers
  # - http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Operators
  autoload -Uz "$dir"/.#*(.x:t)
  fpath=("$dir" $fpath)
done
unset dir
setopt no_extended_glob # disable after use
