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

# autoload any functions defined in directories named `functions` throughout
# this repo
typeset -u topic_functions
# `(x:t)` selects only executables (the `x`) & extracts the filename (the `:t`)
# ref - http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Qualifiers
topic_functions=($DOTFILES/**/functions/*(x:t))
for function in $topic_functions
do
  autoload -Uz "$function"
done
unset topic_functions

# add all directories named `functions` throughout this repo to `fpath`
typeset -u topic_functions_folders
topic_functions_folders=($DOTFILES/**/functions)
for topic_functions_folder in $topic_functions_folders
do
  fpath=("$topic_functions_folder" $fpath);
done
unset topic_functions_folders
