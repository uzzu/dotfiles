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
    alias ll="ls -lF"
    alias la="ls -aF"
    alias lal="ls -laF"
    ;;
  linux*)
    alias ls="ls --color=auto"
    alias ll="ls -lF --color=auto"
    alias la="ls -aF --color=auto"
    alias lal="ls -laF --color=auto"
    ;;
esac
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias tmux="tmux -2"
alias rake="noglob rake"
alias nvm="nodebrew"

# editor setting
if [ -f /usr/bin/vim ]; then
  EDITOR=/usr/bin/vim
  export EDITOR PATH
fi

# lua setting
local lua_version=5.1.5
if [ -f  /usr/local/bin/$lua_version/bin ]; then
  export PATH=/usr/local/lib/lua/$lua_version/bin:$PATH
fi

# java setting
local java_version=java-6-sun-1.6.0.26
if [ -d /usr/lib/jvm/$java_version ]; then
  export JAVA_HOME=/usr/lib/jvm/$java_version
  export PATH=$JAVA_HOME/bin:$PATH
fi

# maven setting
local m2_version=3.0.4
if [ -d /usr/local/lib/maven/$m2_version ]; then
  M2_HOME=/usr/local/lib/maven/$m2_version
  M2=$M2_HOME/bin
  export MAVEN_OPTS="-Xmx1024m"
  export PATH=$M2:$PATH
fi

#for alchemy
if [ -d /opt/alchemy/alchemy-setup ]; then
  source /opt/alchemy/alchemy-setup
fi

# for ruby (using rbenv, and some rbenv plugins)
if [ -d $HOME/.rbenv ]; then
  if [ -d $HOME/.rbenv/bin ]; then
    export PATH=$HOME/.rbenv/bin:$PATH
  fi
  eval "$( rbenv init - zsh )"
  [ -f $HOME/.rbenv/completions/rbenv.zsh ] && source $HOME/.rbenv/completions/rbenv.zsh
fi

# for node.js (using nodebrew)
if [ -d $HOME/.nodebrew/current/bin ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# exec tmux
if which tmux 2>&1 >/dev/null; then
  test -z "$TMUX" && (tmux attach || tmux new-session)
fi
