# all exports before oh-my-zsh is sourced

# oh my zsh configuration
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
export UPDATE_ZSH_DAYS=7

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
export EDITOR="nvim"
export TERM="xterm-256color"

# force key timeout to 1 second
export KEYTIMEOUT=1

# golang
export GOPATH=$HOME/Dev/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# less syntax highlighting
export PAGER="less"

# gpg-agent
export GPG_TTY=$(tty)

# sourcing oh my zsh and plugins after all exports have been made
plugins=(docker chucknorris command-not-found wifi wd jsontools urltools)
source $ZSH/oh-my-zsh.sh

# VI Mode
bindkey -v

# Allow all local users to display applications on the desktop.
xhost +local: 1> /dev/null

# Path to your oh-my-zsh installation.
# import all aliases and funcs
source ~/.aliasrc
source ~/.funcrc

# ssh-agent
if ! ps -ef | grep "[s]sh-agent -s" &> /dev/null; then
   eval "$(ssh-agent -s)" &> /dev/null
   ssh-add ~/.ssh/github_rsa &> /dev/null
   ssh-add ~/.ssh/digitalocean_rsa &> /dev/null
fi

# add direnv hook
eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zkbd key bindings
autoload zkbd
[[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] && zkbd
source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

fortune | ponysay
