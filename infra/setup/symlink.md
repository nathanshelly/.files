# Symlinking Scheme

This script attempts to enable clean symlinking of arbitrary paths in your `$DOTFILES` directory to arbitrary paths on your filesystem (currently only allows arbitrary paths off of `$HOME`, choice made to avoid invoking `sudo`).

Allows for symlinking individual files or whole directory (either by directly linking the directory or recursively linking contained files).

Searches for files/directories that contain `.symlink` in their path starting at `$DOTFILES` environment with a depth of four. The next section is more specific about valid syntax.

> This search descends four directories (e.g. it applies to files at a path `$DOTFILES/<directory_one>/<directory_two>/<directory_three>/<directory_four>` and all shallower directories)

## Syntax

```bash
^(([-._a-zA-Z]+,)*)([-._a-zA-Z]+)\.symlink(\.([_d]{1,2}))?$
```

Allows specifying a path through the file or directory name, using `.symlink` to identify target symlinks. Optional flags can be specified through `._` or `.d` (or their combination).

_Note:_ if you'd like to easily check which names are allowed, define the below function (can copy and paste into terminal) then call it with the potential path like so: `$ check_regex '<path>'`.

```bash
check_regex() {
  re="^(([-._a-zA-Z]+,)*)([-._a-zA-Z]+)\.symlink(\.([_d]{1,2}))?$"
  [[ $1 =~ $re ]] && echo "valid" || echo "invalid";
}

check_regex 'one.one,two_two,tmux.conf.symlink._d'
```

### Syntax Breakdown

#### Part I: `(([-._a-zA-Z]+,)*)([-._a-zA-Z]+)`

Specifies the path of the target for the symlink.

The first capture group - `(([-._a-zA-Z]+,)*)` - allows for specification of a target path relative to `$HOME`. The file or directory name specified by the second capture group will be symlinked at `$HOME/[optional,comma,separated,path,]`.

The second capture group - `([-._a-zA-Z]+)` (the string following the final `,` (or from the start if no path components) up to `.symlink`) specifies the file or directory name for the target.

Combining these, to symlink a file to `$HOME/.vim/colors/.randomfile.zsh` you would name the target file - `vim,colors,.randomfile.zsh` where the first capture group would capture `vim,colors,` and the second group `.randomfile.zsh` (see _Examples_ heading below for more).

By default the path (filename if no path) has `.` appended to the front, prior to appending to `$HOME` (see `._` option to prevent this). for example:

- filename only:
  - `<filename>.symlink` -> `$HOME/.<filename>`
- w/ path:
  - `<one>,<filename>.symlink` -> `$HOME/.<one>/<filename>.symlink`
  - `<one>,<two>,<filename>.symlink` -> `$HOME/.<one>/<two>/<filename>.symlink`

Directories have special behavior. By default this tool recursively traverses a folder to symlink specified by `<directory-name>.symlink`. It recreates the folder structure of `[optional,comma,separated,path,]<directory-name>.symlink` at the path `$HOME/[optional,comma,separated,path,]/<directory-name>`. Any folders that don't exist will be created to generate the same folder structure given by `<directory-name>.symlink`. Any files inside `<directory-name>.symlink` will be symlinked to their respective locations in the created directory structure. e.g. the following file `$DOTFILES/config/config.symlink/alacritty/alacritty.yml` will be symlinked to `$HOME/.config/alacritty/alacritty.yml`. Any directories that don't already exist along the way, like potentially `alacritty` in this example, will be created.

This behavior is the default as I find myself more often wanting to symlink random files at arbitrary locations of an overall folder structure but not wanting to symlink the whole folder since I don't want external programs adding files there that then show up in my dotfiles repo.

#### Part II: `.symlink`

Identifies file or directory as a target to symlink. regex requires `\` to escape special character `.` - `\.symlink`

#### Part III: `(.([_d]{1,2}))?`

Optional flags specifying behavior. regex requires `\` to escape special character `.` - `(\.([_d]{1,2}))?$`

- `_` ("unhidden", `<>.symlink._`)
  - avoids appending a `.` to target path
- `d` ("direct", `<>.symlink.d`)
  - only valid on a directory
  - symlinks directly, that is the entire directory is symlinked relative to `$HOME` (at a possible path given by `,`-separated path components). any files internal to the directory are then in the correct location to be read by other programs. this has the side effect that if external programs add files to the symlinked directory they will exist in your dotfiles repo and will need to be added to your `.gitignore` or manually avoid adding them (unless you'd like to track them of course)
  - example - `config.symlink.d` -> `$HOME/.config` (and internal files/directories taken along for the ride)

Flags can be combined, like so:

- `_d` | `d_` (`<>.symlink._d` | `<>.symlink.d_`)
  - only valid on a directory
  - combines the effects of each, symlinking the directory directly, w/o appending `.`
  - order doesn't matter

## Examples

### Files

#### Defaults

- `<filename>.symlink` -> `$HOME/.<filename>`
  - `vimrc.symlink` -> `$HOME/.vimrc`
  - `tmux.conf.symlink` -> `$HOME/.tmux.conf`
- `<one>><two>><filename>.symlink` -> `$HOME/.<one>/<two>/<filename>`
  - `vim>colors>onedark.vim.symlink` -> `$HOME/.vim/colors/onedark.vim`

#### With flags

##### `._`

Don't append `.` to path

- `<filename>.symlink._` -> `$HOME/<filename>`
  - `tmux.conf.symlink._` -> `$HOME/tmux.conf`
- `<one>><two>><filename>.symlink._` -> `$HOME/<one>/<two>/<filename>`
  - `vim>colors>onedark.vim.symlink._` -> `$HOME/vim/colors/onedark.vim`

##### `.d` & (`._d` | `.d_`)

Flag not valid for files.

### Directories

For the following examples the directory name `config` (w/ various combinations of `.symlink` & flags) has the following file structure (similar to `$DOTFILES/config/config.symlink` in this repo):

```bash
config.symlink
├── alacritty
│   └── alacritty.yml
├── example.json
└── karabiner
    └── filler_for_demo_purposes
        └── karabiner.json
```

#### Defaults

- `<directory-name>.symlink` -> `$HOME/.<directory-name>`
  - directories inside `<directory-name>.symlink` created at respective target directory, files symlinked to respective targets
  - `config.symlink`:
    - folders `alacritty`, `karabiner` & `filler_for_demo_purposes` created
    - symlinked files:
      - `config.symlink/alacritty/alacritty.yml` -> `$HOME/.config/alacritty/alacritty.yml`
      - `config.symlink/karabiner/filler_for_demo_purposes/karabiner.json` -> `$HOME/.config/karabiner/filler_for_demo_purposes/karabiner.json`
      - `config.symlink/example.json` -> `$HOME/.config/example.json`

#### With flags

##### `._`

Don't append `.` to path

- `<directory-name>.symlink._` -> `$HOME/<directory-name>`
  - directories inside `<directory-name>.symlink` created at respective target directory, files symlinked to respective targets
  - `config.symlink`:
    - folders `alacritty`, `karabiner` & `filler_for_demo_purposes` created
    - symlinked files:
      - `config.symlink/alacritty/alacritty.yml` -> `$HOME/config/alacritty/alacritty.yml`
      - `config.symlink/karabiner/filler_for_demo_purposes/karabiner.json` -> `$HOME/config/karabiner/filler_for_demo_purposes/karabiner.json`
      - `config.symlink/example.json` -> `$HOME/config/example.json`

##### `.d`

Symlink folder directly. Do not recursively traverse to symlink individual files.

- `<directory-name>.symlink.d` -> `$HOME/.<directory-name>`
  - whole folder symlinked, all internal files come along for the ride
  - can clutter up dotfiles repo as external programs may add to symlinked folder

##### `._d` (or `.d_`)

Don't append `.` to path, symlink folder directly. Do not recursively traverse to symlink individual files.

- `<directory-name>.symlink._d` (or `.d_`) -> `$HOME/<directory-name>`
  - whole folder symlinked, all internal files come along for the ride
  - can clutter up dotfiles repo as external programs may add to symlinked folder

## TODO (possibly)

- nested symlinks? like currently created for gpakosz/.tmux?
- allow symlinking inner directory of outer created directory? Any use case?
- allow truly arbitrary paths? not just off of `$HOME`? could require sudo
- allow environment variables in paths?
