#!/usr/bin/env fish
set SCRIPTS_DIR "$HOME/Dev/scripts"

alias vi "nvim"
alias vim "nvim"
alias venvoff "deactivate"
alias readme 'pandoc README.md | lynx -stdin'
alias pingg "ping google.com"
alias unpair "/usr/local/bin/doas $SHELL $SCRIPTS_DIR/unpair.sh"
alias pair "suex $SHELL $SCRIPTS_DIR/pair.sh"
alias fuck='eval "suex $history[1]"'
alias fuck!='eval "/usr/bin/sudo $history[1]"'
alias sudo!='/usr/bin/sudo'
alias sudo='suex'
