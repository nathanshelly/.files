# replacement for `grep`
# ref - https://github.com/BurntSushi/ripgrep

# use smart case by default
alias rg='rg --smart-case'

# increase context around match
alias rgc='rg --context 3'

# search for literal strings
alias rgf='rg --fixed-strings'

# show only matching filenames
alias rgl='rg --files-with-matches'

# ignore tests - exclude any filename/directory matching the given patterns
alias rgnt="rg --glob '!*test*' --glob '!*spec*'"

# search only tests - any filename/directory matching the given patterns
alias rgt="rg --glob '*test*' --glob '*spec*'"

# force case sensitivity
alias rgs='rg --case-sensitive'

# `-uuu` (`--unrestricted`) ignores .gitignore files, and searches hidden files
# and directories along with binary files
alias rgu='rg -uuu'
alias rgus='rg -uuu --case-sensitive'

# whole word
alias rgw='rg --word-regexp'
