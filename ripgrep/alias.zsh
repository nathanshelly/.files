# use smart case by default
alias rg='rg --smart-case'

# increase context around match
alias rgc='rg -C 3'

# search for literal strings
alias rgf='rg --fixed-strings'

# show only matching filenames
alias rgl='rg -l'

# ignore tests - exclude any filename/directory matching the given patterns
alias rgnt="rg -g '!*test*' -g '!*spec*'"

# search only tests - any filename/directory matching the given patterns
alias rgt="rg -g '*test*' -g '*spec*'"

# force case sensitivity
alias rgs='rg -s'
alias rgus='rg -uuu -s'

# don't respect ignore files, hidden
# directories/files or binaries
alias rgu='rg -uuu'

# whole word
alias rgw='rg -w'
