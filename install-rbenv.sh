#!/bin/sh
echo $0: Running.

# prepare for debian
#sudo apt-get install -y \
#  build-essential\
#  autoconf2.64 \
#  git git-core\
#  wget\
#  libncurses5-dev\
#  libgdbm-dev\
#  libssl-dev\
#  libyaml-dev\
#  libreadline-gplv2-dev\
#  tk-dev\
#  zlib1g-dev\
#  libxslt-dev\
#  libxml2-dev\
#  libffi-dev\

# prepare for mac
# curl -O ~/Downloads/GCC-10.7-v2.pkg https://github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.7-v2.pkg
# installer -pkg ~/Downloads/GCC-10.7-v2.pkg
#brew install git
#brew install openssl
#brew install readline
#brew install libyaml
#brew install autoconf

# install rbenv
if [ ! -d $HOME/.rbenv ]; then
  git clone git://github.com/sstephenson/rbenv.git $HOME/.rbenv
  mkdir -p $HOME/.rbenv/plugins
  git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
  git clone git://github.com/jamis/rbenv-gemset.git $HOME/.rbenv/plugins/rbenv-gemset
  SHNAME=`basename $SHELL`
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - $SHNAME)"
  RUBY_VERSION=2.7.2
  CONFIGURE_OPTS=--enable-shared rbenv install $RUBY_VERSION
  rbenv rehash; rehash;
  rbenv global $RUBY_VERSION
  rbenv exec gem install bundler

#  SHNAME=`basename $SHELL`
#  if [ $SHNAME = 'bash' ]; then
#    CONF=$HOME/.bash_profile
#    COMPLETION=$HOME/.rbenv/completions/rbenv.bash
#  elif [ $SHNAME = 'zsh' ]; then
#    CONF=$HOME/.zshenv
#    COMPLETION=$HOME/.rbenv/completions/rbenv.zsh
#  fi
#  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $CONF
#  echo 'eval "$(rbenv init - )"' >> $CONF
#  echo 'source $COMPLETION' >> $CONF
fi

echo $0: Complete!
