unbind-key -n C-a
set -g prefix ^A
set -g prefix2 ^A
bind a send-prefix


# unbind byobu default bindings
unbind-key -n S-Up
unbind-key -n S-Down
unbind-key -n S-Left
unbind-key -n S-Right
unbind-key -n C-\

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
   is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
   bind-key -n S-Up if-shell "$is_vim" "send-keys S-Up"  "display-panes; select-pane -U"
   bind-key -n S-Down if-shell "$is_vim" "send-keys S-Down"  "display-panes; select-pane -D"
   bind-key -n S-Left if-shell "$is_vim" "send-keys S-Left"  "display-panes; select-pane -L"
   bind-key -n S-Right if-shell "$is_vim" "send-keys S-Right"  "display-panes; select-pane -R"
   bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "display-panes; select-pane -l"

