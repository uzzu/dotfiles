#!/bin/sh
echo $0: Running.

# oracle java
sudo add-apt-repository ppa:webupd8team/java

# jenkins
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
  build-essential\
  autoconf2.64 \
  libncurses5-dev\
  libgdbm-dev\
  libssl-dev\
  libreadline-gplv2-dev\
  tk-dev\
  zlib1g-dev\
  libffi-dev\
  libyaml-dev\
  libxml2-dev\
  libxslt-dev\
  curl libcurl3 libcurl4-openssl-dev\
  sqlite3 libsqlite3-dev\
  nkf\
  wget\
  git git-core gitk tig\
  fluxbox tmux zsh vim\
  chromium-browser\
  haskell-platform\

# install rbenv
if [ ! -d $HOME/.rbenv ]; then
  git clone git://github.com/sstephenson/rbenv.git $HOME/.rbenv
  mkdir -p $HOME/.rbenv/plugins
  git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
  git clone git://github.com/jamis/rbenv-gemset.git $HOME/.rbenv/plugins/rbenv-gemset
  SHNAME=`basename $SHELL`
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - $SHNAME)"
  RUBY_VERSION=1.9.3-p194
#  RUBY_VERSION=1.9.3-p374
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

# install nodebrew
if [ ! -d $HOME/.nodebrew ]; then
  curl https://raw.github.com/hokaccha/nodebrew/master/nodebrew | perl - setup
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  NODE_VERSION=v0.8.17
  nodebrew install $NODE_VERSION
  nodebrew alias default $NODE_VERSION
  nodebrew use $NODE_VERSION

#  echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $CONF
fi

sh `dirname $0`/link.sh

echo $0: Complete!
