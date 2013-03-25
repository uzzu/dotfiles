#!/bin/sh
echo $0: Running.

if [ ! -d $HOME/.nodebrew ]; then
  curl https://raw.github.com/hokaccha/nodebrew/master/nodebrew | perl - setup
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  NODE_VERSION=v0.8.17
  nodebrew install $NODE_VERSION
  nodebrew alias default $NODE_VERSION
  nodebrew use $NODE_VERSION

#  echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $CONF
fi

echo $0: Complete!
