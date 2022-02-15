set -g base-index 1
set-window-option -g pane-base-index 1

set -sg escape-time 0
set-option -g prefix C-f

set-window-option -g xterm-keys on

set-option -g history-limit 10000
set-option -g display-panes-time 150
set-option -g clock-mode-style 24

set-option -g mode-keys vi
set -g @shell_mode 'vi'

set-window-option -g automatic-rename on
set-window-option -g aggressive-resize on
set-window-option -g monitor-activity on

# Must set default-command to $SHELL, in order to not source ~/.profile
set -g default-command /opt/homebrew/bin/fish
set -g default-shell /opt/homebrew/bin/fish

set -g default-terminal "$TERM"
set -g mouse on
