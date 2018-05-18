# use smart case by default
alias rg='rg --smart-case'

# increase context around match
alias rgc='rg -C 3'

# search for literal strings
alias rgf='rg --fixed-strings'

# force case sensitivity
alias rgs='rg -s'
alias rgus='rg -uuu -s'

# don't respect ignore files, hidden
# directories/files or binaries
alias rgu='rg -uuu'

# whole word
alias rgw='rg -w'
