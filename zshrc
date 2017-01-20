# Path to your oh-my-zsh installation.
# import all aliases and funcs
source ~/.aliasrc
source ~/.funcrc

# oh my zsh configuration
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
export UPDATE_ZSH_DAYS=7

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
export EDITOR="nvim"
export TERM="xterm-256color"

# VI Mode
bindkey -v
export KEYTIMEOUT=1

# python virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/Dev

# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/Dev/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# ssh-agent
if ! ps -ef | grep "[s]sh-agent -s" &> /dev/null; then
   eval "$(ssh-agent -s)" &> /dev/null
   ssh-add ~/.ssh/github_rsa &> /dev/null
fi

# python virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.3

# less syntax highlighting
export PAGER="less"
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# less colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[37;44m'       # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

# added by travis gem
[ -f /home/odedlaz/.travis/travis.sh ] && source /home/odedlaz/.travis/travis.sh

# added by fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# remap caps lock to ESC
setxkbmap -option caps:escape

# add direnv hook
eval "$(direnv hook zsh)"

# sourcing oh my zsh and plugins after all exports have been made
plugins=(virtualenvwrapper aws docker chucknorris command-not-found wifi debian wd jsontools urltools sudo)
source $ZSH/oh-my-zsh.sh

fortune | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n 1)
