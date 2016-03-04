#!/bin/sh
echo $0: Running.

# prepare for debian
#sudo apt-get install -y \
#  build-essential\
#  autoconf2.64 \
#  git git-core\

# prepare for mac
# curl -o ~/Downloads/GCC-10.7-v2.pkg https://github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.7-v2.pkg
# installer -pkg ~/Downloads/GCC-10.7-v2.pkg
#brew install git

#install pyenv
if [ ! -d $HOME/.pyenv ]; then
  git clone git://github.com/yyuu/pyenv.git $HOME/.pyenv
  mkdir -p $HOME/.pyenv/plugins
  git clone git://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
  SHNAME=`basename $SHELL`
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init - $SHNAME)"
  eval "$(pyenv virtualenv-init - $SHNAME)"
  PYTHON_VERSION=3.5.0
  pyenv install $PYTHON_VERSION
  pyenv rehash
  pyenv global $PYTHON_VERSION
  pip install --upgrade pip virtualenv setuptools
fi

echo $0: Complete!
