# scripts

Various infra-related scripts. Scripts without execute permissions used via `source`ing.

- [`component_enabled.sh`](./component_enabled.sh) - tests if given component is enabled (keys to `false`)
- [`is_in_git_repo.sh`](./is_in_git_repo) - determines if current script is running in a `git` repo
- [`is_macos.sh`](./is_macos.sh) - exits with code 0 when the current operating system is `macOS` (determined via `uname`)
- [`get_local_setting.sh`](./get_local_setting.sh) - gets the given key from the local settings file @ `$DOTFILES/.files-settings.json`
- [`prompts.sh`](./prompts.sh) - provides pretty prompts for user interaction
