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

# sourcing oh my zsh and plugins after all exports have been made
plugins=(docker chucknorris command-not-found wifi wd jsontools urltools)
source $ZSH/oh-my-zsh.sh

# VI Mode
bindkey -v

# Allow all local users to display applications on the desktop.
xhost +local: 1> /dev/null

fortune -s kernelnewbies linuxcookie linux computers science tao  | ponysay
