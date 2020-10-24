{
  # ref - https://rycee.gitlab.io/home-manager/options.html#opt-programs.git.enable
  enable = true;

  # TODO: enable when switching to a more recent version of home manager
  # delta.enable = true;

  includes = [
    # local overrides of `git` identity (author name & email)
    # https://git-scm.com/docs/git-config#_includes
    { path = "~/.gitconfig.local"; }
    { path = "~/.gitconfig.work"; condition = "gitdir:~/work/"; }
  ];

  # TODO: confirm what this does
  lfs.enable = true;

  extraConfig = {
    advice = {
      # disable help messages
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-advice
      addEmptyPathspec = false;
      commitBeforeMerge = false;
      detachedHead = false;
      implicitIdentity = false;
      pushNonFastForward = false;
      resolveConflict = false;
      statusHints = false;
      waitingForEditor = false;
    };
    branch = {
      # make `pull` use rebase, not merge
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-branchautoSetupRebase
      autosetuprebase = "always";
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
    core = {
      # maintains original EOL characters on checkout, normalizes CLRF -> LF endings
      # on commit
      # https://stackoverflow.com/a/4425433
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-coreautocrlf
      autocrlf = "input";

      # comment character from `#` -> `;` to enable Markdown `#` headings
      # ref - https://duan.ca/2020/04/13/git-commit-comment/
      commentChar = ";";

      # marks `~/.gitignore` (if it exists) as a global ignore file applying to all
      # `git` repos throughout your machine (unrelated to the `.gitignore` at the
      # root of this repo - `$DOTFILES/.gitignore`)
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-coreexcludesFile
      excludesFile = "~/.gitignore";

      # pager = <set in zsh/dynamic_env_vars.zsh>

      # ensures unicode compatibility between macOS, Windows & Linux
      # https://www.git-tower.com/help/guides/faq-and-tips/faq/unicode-filenames/mac
      precomposeUnicode = true;
    };
    help = {
      # automatically correct and execute mistyped commands
      # https://git-scm.com/docs/git-config#Documentation/git-config.txt-helpautoCorrect
      autoCorrect = -1; # negative value executes command immediately
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
      ff = "only";
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
    "filter \"lfs\"" = {
      clean = "git-lfs clean -- %f";
      smudge = "git-lfs smudge -- %f";
      process = "git-lfs filter-process";
      required = true;
    };
    init = {
      defaultBranch = "main";
    };
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
    "*"

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
