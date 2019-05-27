# add local gems to path if ruby is installed
command -v ruby > /dev/null 2>&1 && {
  path=(
    # `-r` loads specified library (`rubygems`)
    # `-e` specify script to run
    "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
    $path
  )
}
