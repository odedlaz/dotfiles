#!/usr/bin/env fish
set SCRIPTS_DIR "$HOME/Dev/scripts"

# remove ag alias for silver searcher
unalias ag ^ /dev/null

alias vi "nvim"
alias vim "nvim"
alias venvoff "deactivate"
alias readme 'pandoc README.md | lynx -stdin'
alias pingg "ping google.com"
alias unpair "sudo $SHELL $SCRIPTS_DIR/unpair.sh"
alias pair "sudo $SHELL $SCRIPTS_DIR/pair.sh"
alias fuck='eval sudo $history[1]'`
