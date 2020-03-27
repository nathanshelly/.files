#! /usr/bin/env zsh

# ref - http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# `bindkey`
#   - `-M <keymap>` -> specify keymap for keybinding
# `zle`
#   - `-n <widget> [function]` -> create new widget (bound to optional function)
# `autoload`
#   - `-U` -> alias expansion is supressed when the function is loaded

# use `Shift+Tab` to cycle backwards through completions
# ref - https://unix.stackexchange.com/questions/84867/zsh-completion-enabling-shift-tab
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# <<<<<<<<<<< vi mode >>>>>>>>>>>

"$DOTFILES/infra/scripts/component_enabled.sh" 'vi-mode' || return 0

# turn on vim mode
bindkey -v

# shorten key delay to .2 seconds to allow quick exiting of insert mode
export KEYTIMEOUT=20

# map jk to esc in insert mode
bindkey -M viins 'jk' vi-cmd-mode

# enable normal backspace behavior
bindkey "^?" backward-delete-char

# edit zsh commands in $EDITOR
# ref - https://nuclearsquid.com/writings/edit-long-commands/
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# << inner & surround extensions >>
# ref - https://www.reddit.com/r/vim/comments/7wj81e/you_can_get_vim_bindings_in_zsh_and_bash/du3tx3z?utm_source=share&utm_medium=web2x

# ci", ci', ci`
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci[, ci<
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround
