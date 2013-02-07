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
  chromium-browser gimp dia freemind\
  haskell-platform\

# install rbenv
sh `dirname $0`/install-rbenv.sh

# install pyenv
sh `dirname $0`/install-pyenv.sh

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
