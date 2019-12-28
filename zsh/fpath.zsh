# enable completions for homebrew-installed programs
# ref - https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if command -v brew &> /dev/null; then
  # hardcoding path given by following command for performance
  # `$(brew --prefix)/share/zsh/site-functions`
  fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)
fi
