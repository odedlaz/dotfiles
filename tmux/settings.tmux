if-shell "test -f ~/.tmux/themes/onedark.tmux" "source ~/.tmux/themes/onedark.tmux"

set-window-option -g pane-base-index 1
set -sg escape-time 0

set -g prefix ^A
set -g prefix2 ^A
bind a send-prefix

set-window-option -g xterm-keys on

set-option -g history-limit 10000
set-option -g display-panes-time 150
set-option -g clock-mode-style 24
set-option -g mode-keys vi

set-window-option -g automatic-rename on
set-window-option -g aggressive-resize on
set-window-option -g monitor-activity on

set -g default-terminal "$TERM"

# # The following helps with Shift-PageUp/Shift-PageDown
set -g terminal-overrides 'xterm*:smcup@:rmcup@'
set-option -ga terminal-overrides ",$TERM:Tc"

# Must set default-command to $SHELL, in order to not source ~/.profile
# BUG: Should *not* hardcode /bin/bash here
set -g default-command $SHELL

set -g status-interval 1
set -g message-fg white
set -g mouse on

