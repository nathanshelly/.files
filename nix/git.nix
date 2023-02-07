{
  # ref - https://rycee.gitlab.io/home-manager/options.html#opt-programs.git.enable
  enable = true;

  # syntax highlighted fancy pager
  # ref: https://github.com/dandavison/delta
  delta = {
    # TODO: figure out why this config still needs `delta` in the user packages
    # but only when in a tmux session
    enable = true;
    # https://github.com/dandavison/delta#configuration
    options = {
      # TODO: allow dyanmic dark/light theme setting
      syntax-theme = "TwoDark";
      plus-style = "syntax #1c3428";
      plus-emph-style = "syntax #37664e";
      minus-style = "syntax #390423";
      minus-emph-style = "syntax #af0d6c";
      tabs = 2;
      hunk-style = "plain";
      highlight-removed = true;
    };
  };

  # local overrides of `git` identity (author name & email)
  # https://git-scm.com/docs/git-config#_includes
  includes = [{ path = "~/.gitconfig.local"; }];

  lfs.enable = true; # set up optional handy config for LFS
  extraConfig = {
    # disable help messages to reduce verbosity
    # https://git-scm.com/docs/git-config#Documentation/git-config.txt-advice
    advice = {
      addEmptyPathspec = false;
      commitBeforeMerge = false;
      detachedHead = false;
      implicitIdentity = false;
      pushNonFastForward = false;
      resolveConflict = false;
      statusHints = false;
      waitingForEditor = false;
    };
    "color \"diff\"" = {
      oldMoved = 212;
      newMoved = 135;
    };
    "color \"status\"" = {
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-colorstatusltslotgt
      added = 045;
      branch = 135;
      changed = 212;
      localBranch = 135;
      remoteBranch = 159;
      untracked = 004;
    };
    commit.gpgsign = true;
    core = {
      # maintains original EOL characters on checkout, normalizes CLRF -> LF endings
      # on commit
      # https://stackoverflow.com/a/4425433
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-coreautocrlf
      autocrlf = "input";

      # comment character from `#` -> `;` to enable Markdown `#` headings
      # ref - https://duan.ca/2020/04/13/git-commit-comment/
      commentChar = ";";

      # ensures unicode compatibility between macOS, Windows & Linux
      # https://www.git-tower.com/help/guides/faq-and-tips/faq/unicode-filenames/mac
      precomposeUnicode = true;
    };
    diff = {
      # https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---color-movedltmodegt
      colorMoved = "dimmed-zebra";
      colorMovedWS = "allow-indentation-change";
    };
    fetch.prune = true;
    # sign commits w/ `gpg` via `ssh` key
    # ref: https://developer.1password.com/docs/ssh/git-commit-signing#step-1-configure-git-commit-signing-with-ssh
    gpg = {
      format = "ssh";
      # TODO: make platform-agnostic
      ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    };
    help = {
      # automatically correct and execute mistyped commands
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-helpautoCorrect
      autoCorrect = -1; # negative value executes command immediately
    };
    init = {
      defaultBranch = "main";
    };
    pager = {
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-pagerltcmdgt
      diff = true;
      log = true;
      show = true;
    };
    pull = {
      # allows only fast-forward merges (no creation of a merge commit)
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-pullff
      rebase = true;
    };
    push = {
      # `git push` treated as `git push remote <current-checkout-out-branch-name>`
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-pushdefault
      default = "current";
      # push annotated tags missing from remote
      # equivalent of typing `git push --follow-tags`
      # https://git-scm.com/docs/git-push#Documentation/git-push.txt---follow-tags
      followTags = true;
    };
    rebase = {
      # automatically runs `git stash` when you start a rebase, and `git stash pop`
      # when you finish that rebase
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-rebaseautoStash
      autostash = true;
    };
    rerere = {
      # remember & automatically apply past merge conflict resolutions
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-rerereenabled
      # https://stackoverflow.com/a/49501436
      enabled = true;
    };
    tag = {
      # properly sort semver tags (`v-0.9.1x` after `v-0.9.9`)
      # https://stackoverflow.com/a/22634649
      sort = "version:refname";
    };
    # TODO: generate dynamically from file someday?
    user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMgSNWmZn4+qYF/HtSutoay85MBQ0Vh4sMi7EV+bvs5B";
  };

  # ref - https://tekin.co.uk/2020/10/better-git-diff-output-for-ruby-python-elixir-and-more
  attributes = [
    "*.css   diff=css"
    "*.html  diff=html"
    "*.go    diff=golang"
    "*.py    diff=python"
    "*.md    diff=markdown"
    "*.rb    diff=ruby"
    "*.rake  diff=ruby"
    "*.rs    diff=rust"
  ];

  ignores = [
    # Python
    ".mypy_cache"
    "*.pyc"

    # Node
    "node_modules"
    "logs"
    "*.log"
    "npm-debug.log"

    # Folder view configuration files
    ".DS_Store"
    "Desktop.ini"

    # Thumbnail cache files
    "._*"
    "Thumbs.db"

    # Files that might appear on external disks
    ".Trashes"

    # System files
    "*~"

    # vim swap files
    ".*.sw"
    "?"

    # VSCode
    ".vscode"

    # terraform
    ".terraform"

    # direnv cache (generated by `nix-direnv`)
    ".direnv"
  ];
}
