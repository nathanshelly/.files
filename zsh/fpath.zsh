# add topic folders to fpath to enable functions and completion scripts
for topic_folder ($DOTFILES/*) do
  if [ -d $topic_folder ]; then
    fpath=($topic_folder $fpath);
  fi;
done
