#!/bin/sh
echo "$0: Running."

cd $(dirname $0)
for dotfile in .?*; do
  case $dotfile in
    ..)
      continue;;
    .git)
      continue;;
    .gitignore)
      continue;;
    .gitmodules)
      continue;;
    .*)
      echo "$0: symlink $HOME/$dotfile -> $PWD/$dotfile";
      ln -nfs "$PWD/$dotfile" $HOME;
      ;;
  esac
done

# mm.cfg
dotfile=mm.cfg
echo "$0: symlink $HOME/$dotfile -> $PWD/$dotfile"
ln -nfs $PWD/$dotfile $HOME

# submodule update
git submodule update --init

# update neobundle
vim -c "NeoBundleInstall! | q!"

echo "$0: Complete!"
