# scripts

Various infra-related scripts. Scripts without execute permissions primarily used via `source`ing.

- [`check_dotfiles_variable.sh`](./check_dotfiles_variable.sh) - verify that \$DOTFILES environment variable is set, otherwise attempts to set it via user input (quits calling script (when sourced) if cancelled)
- [`is_macos.sh`](./is_macos.sh) - exits with code 0 when the current operating system is `macOS` (determined via `uname`)
- [`prompts.sh`](./prompts.sh) - provides pretty prompts for user interaction
