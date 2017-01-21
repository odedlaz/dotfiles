
bind-key -n F2 new-window -c "#{pane_current_path}" \; rename-window "-"
bind-key -n S-F2 new-session

bind-key -n F3 previous-window
bind-key -n F4 next-window

bind-key -n S-F3 display-panes \; swap-pane -s :. -t :.- \; select-pane -t :.-
bind-key -n S-F4 display-panes \; swap-pane -s :. -t :.+ \; select-pane -t :.+

bind-key -n F12 copy-mode

bind-key -n F8 command-prompt -p "(rename-window) " "rename-window '%%'"
bind-key -n C-F8 command-prompt -p "(rename-session) " "rename-session '%%'"

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator

is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind-key -n C-J if-shell "$is_vim" "send-keys C-J"  "display-panes; select-pane -U"
bind-key -n C-K if-shell "$is_vim" "send-keys C-K"  "display-panes; select-pane -D"
bind-key -n C-H if-shell "$is_vim" "send-keys C-H"  "display-panes; select-pane -L"
bind-key -n C-L if-shell "$is_vim" "send-keys C-L"  "display-panes; select-pane -R"
bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "display-panes; select-pane -l"

bind-key -n M-Left previous-window
bind-key -n M-Right next-window

bind -n WheelUpPane if "[[ #{pane_current_command} =~ vim ]]" "select-pane -t = ; send-keys -M" "select-pane -t = ; send-keys Up"
bind -n WheelDownPane if "[[ #{pane_current_command} =~ vim ]]" "select-pane -t = ; send-keys -M" "select-pane -t = ; send-keys Down"
