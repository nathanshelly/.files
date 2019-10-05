# replacement for `grep`
# ref - https://github.com/BurntSushi/ripgrep

# TODO: remove once habit broken
alias rg='echo "use generic f, not specific rg (use /usr/local/bin/rg if needed)"'
# # use smart case by default
# alias f='f --smart-case'

# increase context around match
alias fcc='f --context 3'

# search for literal strings
alias ff='f --fixed-strings'

# show only matching filenames
alias fl='f --files-with-matches'

# search only tests - any filename/directory matching the given patterns
alias ft="f --glob '*test*' --glob '*spec*'"

# ignore tests - exclude any filename/directory matching the given patterns
alias fnt="f --glob '!*test*' --glob '!*spec*'"

# `-uuu` (`--unrestricted`) ignores .gitignore files, and searches hidden files
# and directories along with binary files
alias fu='f -uuu'
alias fus='f -uuu --case-sensitive'

# whole word
alias fw='f --word-regexp'
