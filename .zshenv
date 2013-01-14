# language setting
export LANG=ja_JP.UTF-8

# editor setting
EDITOR=/usr/bin/vim
export EDITOR PATH

# lua setting
export PATH=/usr/local/lib/lua/5.1.5/bin:$PATH

# java setting
export JAVA_HOME=/usr/lib/jvm/java-6-sun-1.6.0.26
export PATH=$JAVA_HOME/bin:$PATH

# maven setting
M2_HOME=/usr/local/lib/maven/3.0.4
M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1024m"
export PATH=$M2:$PATH

#for alchemy
source /opt/alchemy/alchemy-setup

#rvm
export PATH=$PATH:$HOME/.rvm/bin

#nvm
source ~/.nvm/nvm.sh

