# settings

These dotfiles are configured via [`.files-settings.json`](../../.files-settings.json). This allows for easy high-level tweaking.

Currently these options are primarily booleans enabling or disabling a specific component. Non-boolean options are theme ("dark" or "light") and editor options (`(n)vi(m)`, `emacs`, `code`, etc.).

## schema

```json
{
  // value of $EDITOR - "nvim", "emacs", "code", etc.
  "editor": "<valid-editor-program>",
  "fzf": boolean, // enable/disable `fzf` including keybindings & completions
  "git-aliases": boolean, // enable/disable git aliases
  "theme": "dark|light", // color theme - "dark" | "light"
  "vi-mode": boolean, // enable/disable `vi-mode` (currently only in `zsh`)
  // conditionally source `.zshrc` config (does not affect `.zshenv` sourcing)
  "zsh": boolean
}
```
