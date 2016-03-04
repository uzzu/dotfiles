# language setting
export LANG=ja_JP.UTF-8

# git prompt
function rprompt-git-current-branch {
    local name st color
    if [[ '$PWD' =~ '/\.git(/.*)?$' ]]; then
        return
    fi
    name=$(basename "`git symbolic-ref HEAD 2> /dev/null `")
    if [[ -z $name ]]; then
        return
    fi

    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color=${fg[green]}
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
        color=${fg[yellow]}
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
        color=${fg_bold[red]}
    else
        color=${fg[red]}
    fi

    echo "%{$color%}$name%{$reset_color%} "
}

# cd git root
function gitt() {
  cd `git rev-parse --show-toplevel`
}

function diffjar() {
  echo "diff "$2/$1" "$3/$1
  mkdir ./a
  mkdir ./b
  cp $2/$1 ./a
  cp $3/$1 ./b
  cd ./a
  jar xvf $1 > /dev/null
  rm $1
  cd ../
  cd ./b
  jar xvf $1 > /dev/null
  rm $1
  cd ../
  diff -r ./a ./b
  rm -rf ./a
  rm -rf ./b
}

# keybind settings
bindkey -v

# autoload settings
autoload -U compinit
compinit
autoload -Uz colors
colors

# color settings
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
zstyle ':completion' list-colors 'di=01:34:ln=01;36:ex=01;32;bd=40;33;01:cd=40;33;01:'

# prompt settings
setopt prompt_subst
PROMPT="%n@%m%# "
RPROMPT='[`rprompt-git-current-branch`%~]'

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_no_store
setopt hist_ignore_space
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# correct settings
setopt auto_cd
setopt auto_menu
setopt correct
setopt list_packed
setopt list_types
setopt magic_equal_subst
setopt print_eight_bit
setopt no_beep

# cd settings
setopt auto_pushd
setopt pushd_ignore_dups

# alias settings
case "$OSTYPE" in
  darwin*)
    alias ls="ls -G"
    alias ll="ls -lFG"
    alias la="ls -aFG"
    alias lal="ls -laFG"
    ;;
  linux*)
    alias ls="ls --color=auto"
    alias ll="ls -lF --color=auto"
    alias la="ls -aF --color=auto"
    alias lal="ls -laF --color=auto"
    alias open="gnome-open"
    ;;
esac
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias tmux="tmux -2"
alias rake="noglob rake"
alias nvm="nodebrew"
alias openapplesys="open http://www.apple.com/support/systemstatus/"
alias openappledev="open https://developer.apple.com/system-status/"

# editor setting
if [ -f /usr/bin/vim ]; then
  EDITOR=/usr/bin/vim
  export EDITOR PATH
fi

# for homebrew's bug
export PATH=/usr/local/bin:$PATH

# user home path
export PATH=~/bin:$PATH

# lua setting
local lua_version=5.1.5
if [ -f  /usr/local/bin/$lua_version/bin ]; then
  export PATH=/usr/local/lib/lua/$lua_version/bin:$PATH
fi

# java setting
case "$OSTYPE" in
  darwin*)
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
    export PATH=$JAVA_HOME/bin:$PATH
    ;;
  linux*)
    local java_version=java-6-sun-1.6.0.26
    if [ -d /usr/lib/jvm/$java_version ]; then
      export JAVA_HOME=/usr/lib/jvm/$java_version
      export PATH=$JAVA_HOME/bin:$PATH
    fi
    ;;
esac

# sdkman(gradle, maven) setting
if [ -d /Users/uzu-h/.sdkman/bin ]; then
  export SDKMAN_DIR=$HOME/.sdkman
  [[ -s $SDKMAN_DIR/bin/sdkman-init.sh ]] && source $SDKMAN_DIR/bin/sdkman-init.sh
fi

# android setting
case "$OSTYPE" in
  darwin*)
    local ndk_version=r10e
    if [ -d /Applications/adt ]; then
      export ANDROID_SDK_HOME=/Applications/adt
      export ANDROID_HOME=$ANDROID_SDK_HOME
      export PATH=$ANDROID_SDK_HOME/tools:$PATH
      export PATH=$ANDROID_SDK_HOME/platform-tools:$PATH
      if [ -d $HOME/.ndk/$ndk_version ]; then
        export ANDROID_NDK_HOME=$HOME/.ndk/$ndk_version
        export ANDROID_NDK_ROOT=$HOME/.ndk/$ndk_version
        export PATH=$ANDROID_NDK_HOME:$PATH
      fi
    fi
    ;;
  linux*)
    ;;
esac

# for flashplayerdebugger
case "$OSTYPE" in
  darwin*)
    if [ -d /Applications/Flash\ Player\ Debugger.app ]; then
      export PATH=/Applications/Flash\ Player\ Debugger.app/Contents/MacOS:$PATH
    fi
    ;;
  linux*)
    ;;
esac

#for alchemy
if [ -d /opt/alchemy/alchemy-setup ]; then
  source /opt/alchemy/alchemy-setup
fi

# for haskell
if [ -d $HOME/.cabal ]; then
  if [ -d $HOME/.cabal/bin ]; then
    export PATH=$HOME/.cabal/bin:$PATH
  fi
fi

# for ruby (using rbenv, and some rbenv plugins)
if [ -d $HOME/.rbenv ]; then
  if [ -d $HOME/.rbenv/bin ]; then
    export PATH=$HOME/.rbenv/bin:$PATH
  fi
  eval "$( rbenv init - zsh )"
  [ -f $HOME/.rbenv/completions/rbenv.zsh ] && source $HOME/.rbenv/completions/rbenv.zsh
fi

# for python (using pyenv, and python-virtualenv)
if [ -d $HOME/.pyenv ]; then
  if [ -d $$HOME/.pyenv/bin ]; then
    export PATH=$HOME/.pyenv/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
elif [ -d /usr/local/share ]; then
  if [ -d /usr/local/share/python ]; then
    export PATH=/usr/local/share/python:$PATH
  fi
fi

# for node.js (using nodebrew)
if [ -d $HOME/.nodebrew/current/bin ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# for golang
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

# use tmux except mac
case "$OSTYPE" in
  darwin*)
    ;;
  linux*)
    if which tmux 2>&1 >/dev/null; then
      test -z "$TMUX" && (tmux attach || tmux new-session)
    fi
    ;;
esac

