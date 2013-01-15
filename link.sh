#!/bin/sh
echo "linking..."

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
      echo "$HOME/dotfile -> $PWD/$dotfile";
      ln -nfs "$PWD/$dotfile" $HOME;
      ;;
  esac
done

# mm.cfg
ln -nfs $PWD/mm.cfg $HOME/mm.cfg

git submodule update --init
