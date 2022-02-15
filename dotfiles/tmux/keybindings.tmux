
bind-key _ split-window -v -c '#{pane_current_path}' # Split panes vertically
bind-key | split-window -h -c '#{pane_current_path}' # Split panes horizontallyj

# shift+command key + ...
bind-key -n S-M-Up resize-pane -U
bind-key -n S-M-Down resize-pane -D
bind-key -n S-M-Left resize-pane -L
bind-key -n S-M-Right resize-pane -R

# command key + ...
bind-key -n M-Up "display-panes; select-pane -U"
bind-key -n M-Down "display-panes; select-pane -D"
bind-key -n M-Left "display-panes; select-pane -L"
bind-key -n M-Right "display-panes; select-pane -R"

# reload config with prefix + R
bind-key R source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded"

