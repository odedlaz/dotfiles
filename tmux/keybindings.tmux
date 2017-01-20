source $HOME/.tmux/keybindings.tmux.disable
bind-key -n F2 new-window -c "#{pane_current_path}" \; rename-window "-"
bind-key -n C-F2 display-panes \; split-window -h -c "#{pane_current_path}"
bind-key -n S-F2 display-panes \; split-window -v -c "#{pane_current_path}"
bind-key -n C-S-F2 new-session
bind-key -n F3 previous-window
bind-key -n F4 next-window
bind-key -n M-Left previous-window
bind-key -n M-Right next-window
bind-key -n M-Up switch-client -p
bind-key -n M-Down switch-client -n
bind-key -n S-F3 display-panes \; select-pane -t :.-
bind-key -n S-F4 display-panes \; select-pane -t :.+

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator

is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind-key -n S-Up if-shell "$is_vim" "send-keys S-Up"  "display-panes; select-pane -U"
bind-key -n S-Down if-shell "$is_vim" "send-keys S-Down"  "display-panes; select-pane -D"
bind-key -n S-Left if-shell "$is_vim" "send-keys S-Left"  "display-panes; select-pane -L"
bind-key -n S-Right if-shell "$is_vim" "send-keys S-Right"  "display-panes; select-pane -R"
bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "display-panes; select-pane -l"

bind-key -n C-F3 display-panes \; swap-pane -s :. -t :.- \; select-pane -t :.-
bind-key -n C-F4 display-panes \; swap-pane -s :. -t :.+ \; select-pane -t :.+
bind-key -n C-S-F3 swap-window -t :-1
bind-key -n C-S-F4 swap-window -t :+1
bind-key -n M-S-Up resize-pane -U
bind-key -n M-S-Down resize-pane -D
bind-key -n M-S-Left resize-pane -L
bind-key -n M-S-Right resize-pane -R
bind-key -n F6 detach
bind-key -n C-F6 kill-pane
bind-key -n F7 copy-mode
bind-key -n M-NPage copy-mode \; send-keys NPage
bind-key -n M-PPage copy-mode \; send-keys PPage
bind-key -n F8 command-prompt -p "(rename-window) " "rename-window '%%'"
bind-key -n C-F8 command-prompt -p "(rename-session) " "rename-session '%%'"
bind-key -n S-F8 next-layout
bind-key -n M-F11 break-pane
bind-key -n C-F11 join-pane -h -s :. -t :-1
bind-key -n S-F11 resize-pane -Z
bind-key -n M-IC paste-buffer
bind -n WheelUpPane if "[[ #{pane_current_command} =~ vim ]]" "select-pane -t = ; send-keys -M" "select-pane -t = ; send-keys Up"
bind -n WheelDownPane if "[[ #{pane_current_command} =~ vim ]]" "select-pane -t = ; send-keys -M" "select-pane -t = ; send-keys Down"
