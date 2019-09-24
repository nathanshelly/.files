# lib

Helper code for setup scripts

- [`check_dotfiles_variable.sh`](./check_dotfiles_variable.sh) - verify that \$DOTFILES environment variable is set, otherwise attempts to set it via user input (quits calling script (when sourced) if cancelled)
- [`prompts.sh`](./prompts.sh) - provides pretty prompts for user interaction
- [`util.sh`](./util.sh) - defines `join_by` function for joining arrays
