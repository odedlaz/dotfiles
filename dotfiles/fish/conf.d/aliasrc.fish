#!/usr/bin/env fish
set SCRIPTS_DIR "$HOME/Dev/scripts"

alias vi "nvim"
alias reload "source $HOME/.config/fish/config.fish"
alias venvoff "deactivate"
alias readme 'pandoc README.md | lynx -stdin'
alias pingg "ping google.com"
alias unpair "/usr/local/bin/doas $SHELL $SCRIPTS_DIR/unpair.sh"
alias pair "sudo $SHELL $SCRIPTS_DIR/pair.sh"
alias fuck='eval "sudo $history[1]"'
