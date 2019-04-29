# ref - http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# `bindkey`
#   - `-M <keymap>` -> specify keymap for keybinding
# `zle`
#   - `-n <widget> [function]` -> create new widget (bound to optional function)
# `autoload`
#   - `-U` -> alias expansion is supressed when the function is loaded

# turn on vim mode
# Note: spaceship vi mode enabled in prompt.zsh
bindkey -v

# shorten key delay to .2 seconds
# most important for quickly exiting
# vi insert mode
export KEYTIMEOUT=20

# map jk to esc in insert mode
bindkey -M viins 'jk' vi-cmd-mode

# change movement to home row
# hjkl -> jkl; in normal mode
bindkey -M vicmd 'j' vi-backward-char
bindkey -M vicmd 'k' down-line-or-history
bindkey -M vicmd 'l' up-line-or-history
bindkey -M vicmd ';' vi-forward-char

# enable normal backspace behavior
bindkey "^?" backward-delete-char

# disable character level manipulation
bindkey -rM vicmd 's'
bindkey -rM vicmd 'S'
bindkey -rM vicmd 'x'
bindkey -rM vicmd 'X'
bindkey -rM vicmd 'r'
bindkey -rM vicmd 'R'

# start/end of line movement
bindkey -M vicmd "'" vi-end-of-line
bindkey -M vicmd '"' vi-digit-or-beginning-of-line

# edit zsh commands in $EDITOR
# ref - https://nuclearsquid.com/writings/edit-long-commands/
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# << inner & surround extensions >>
# ref - https://www.reddit.com/r/vim/comments/7wj81e/you_can_get_vim_bindings_in_zsh_and_bash/du3tx3z?utm_source=share&utm_medium=web2x

# ci"
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(
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
