# scripts

Various infra-related scripts. Scripts without execute permissions used via `source`ing.

- [`is_in_git_repo`](./is_in_git_repo) - determines if current script is running in a `git` repo
- [`is_macos.sh`](./is_macos.sh) - exits with code 0 when the current operating system is `macOS` (determined via `uname`)
- [`prompts.sh`](./prompts.sh) - provides pretty prompts for user interaction
