#!/bin/sh
echo $0: Running.

if [ ! -d $HOME/.nodebrew ]; then
  curl -L git.io/nodebrew | perl - setup
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  NODE_VERSION=v0.12.0
  nodebrew install $NODE_VERSION
  nodebrew alias default $NODE_VERSION
  nodebrew use $NODE_VERSION

#  echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $CONF
fi

echo $0: Complete!
