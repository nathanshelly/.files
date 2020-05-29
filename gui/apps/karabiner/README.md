# [karabiner-elements](https://karabiner-elements.pqrs.org/)

A keyboard customizer for macOS.

Used to set up various helpful keyboard shortcuts. A few examples:

- Caps Lock mapped to Esc when tapped, Ctrl when held
- Right Command mapped to Cmd+Option+Ctrl ("hyper" key)
- `vi`-like home row movement globally (except in the terminal)
  - `Ctrl-(h|j|k|l)` mapped to ⬅ ⬇ ⬆ ➡
  - `Option-(h|j|k|l)` mapped to Option-( ⬅ ⬇ ⬆ ➡ )
  - `Cmd-(h|j|k|l)` mapped to Cmd-( ⬅ ⬇ ⬆ ➡ )

## quick setup

Make sure the [current profile is called "Default"](https://github.com/yqrashawn/GokuRakuJoudo#usage).

<!-- TODO: automate away need to update profile name? -->

Install `goku`:

```shell
# first install required dependency (automatic dependency
# resolution currently fails with an issue about taps)
brew install "candid82/brew/joker"
brew install "yqrashawn/goku/goku"
```

Finally run the following command from anywhere to apply the config:

```console
~/.files on goku
❯ GOKU_EDN_CONFIG_FILE="$DOTFILES/gui/apps/karabiner/karabiner.edn" goku
Done!
```

## configuration

Karabiner-Elements configuration is done via a `$HOME/.config/karabiner/karabiner.json` file.

Unfortunately, the specification format can be pretty verbose and have a fair amount of redundancy. This config uses a tool called [Goku](https://github.com/yqrashawn/GokuRakuJoudo) to [concisely configure](https://github.com/yqrashawn/GokuRakuJoudo#why-use-goku) Karabiner-Elements.

You write your config in Goku's DSL (which uses the [`.edn` format](https://github.com/edn-format/edn)) and Goku applies it to `$HOME/.config/karabiner/karabiner.json`.

See comments in [`karabiner.edn`](./karabiner.edn) for the full list of rules appplied.

### editing the config (`karabiner.edn`)

See [the tutorial](https://github.com/yqrashawn/GokuRakuJoudo/blob/master/tutorial.md) for additional examples.

To format the file run this (requires `npx` & uses [`cljfmt`](https://github.com/weavejester/cljfmt) under the hood):

```console
❯ npx node-cljfmt "$DOTFILES/gui/apps/karabiner/karabiner.edn"
```
