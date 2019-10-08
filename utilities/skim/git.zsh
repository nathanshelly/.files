# skim ❤️ git
# useful combinations of git & skim
#
# this file specifies keybinding for functions defined in `./functions`
# based off examples written for `fzf`, translates nicely to `skim`
#
# refs:
#   - https://junegunn.kr/2016/07/fzf-git
#   - https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236

# join multi-line output from skim
join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "skim_g${c}_widget() {\
      zle reset-prompt;\
      local result=\$(skim_g$c | join-lines);\
      zle reset-prompt;\
      LBUFFER+=\$result\
    }"
    eval "zle -N skim_g${c}_widget"
    eval "bindkey '\e$c' skim_g${c}_widget"
  done
}

# f - list files (what `git status` would list)
# r - list branches (including remotes)
# h - list hashes (commits)
bind-git-helper f r h
unset -f bind-git-helper
