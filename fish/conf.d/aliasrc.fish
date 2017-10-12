#!/usr/bin/env fish
set SCRIPTS_DIR "$HOME/Dev/scripts"

alias vi "nvim"
alias vim "nvim"
alias venvoff "deactivate"
alias readme 'pandoc README.md | lynx -stdin'
alias pingg "ping google.com"
alias unpair "/usr/local/bin/doas $SHELL $SCRIPTS_DIR/unpair.sh"
alias pair "/usr/local/bin/doas $SHELL $SCRIPTS_DIR/pair.sh"
alias fuck='eval "/usr/local/bin/doas $history[1]"'
alias sudo!='/usr/bin/sudo'
alias sudo='/usr/local/bin/doas'
