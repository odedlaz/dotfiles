bind-key -n F12 copy-mode

bind-key -n C-F8 command-prompt -p "(rename-window) " "rename-window '%%'"

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind-key -n M-Up if-shell "$is_vim" "send-keys M-Up"  "display-panes; select-pane -U"
bind-key -n M-Down if-shell "$is_vim" "send-keys M-Down"  "display-panes; select-pane -D"
bind-key -n M-Left if-shell "$is_vim" "send-keys M-Left"  "display-panes; select-pane -L"
bind-key -n M-Right if-shell "$is_vim" "send-keys M-Right"  "display-panes; select-pane -R"

bind-key -n C-Up resize-pane -U
bind-key -n C-Down resize-pane -D
bind-key -n C-Left resize-pane -L
bind-key -n C-Right resize-pane -R

bind-key -n "_" split-window -v -c "#{pane_current_path}"

# Choose Window
bind-key w choose-window

bind R source-file ~/.tmux.conf \; display-message "Config reloaded"

# Switch windows alt+number
bind-key -n M-1 if-shell 'tmux select-window -t 1' '' 'new-window -t 1'
bind-key -n M-2 if-shell 'tmux select-window -t 2' '' 'new-window -t 2'
bind-key -n M-3 if-shell 'tmux select-window -t 3' '' 'new-window -t 3'
bind-key -n M-4 if-shell 'tmux select-window -t 4' '' 'new-window -t 4'
bind-key -n M-5 if-shell 'tmux select-window -t 5' '' 'new-window -t 5'
bind-key -n M-6 if-shell 'tmux select-window -t 6' '' 'new-window -t 6'
bind-key -n M-7 if-shell 'tmux select-window -t 7' '' 'new-window -t 7'
bind-key -n M-8 if-shell 'tmux select-window -t 8' '' 'new-window -t 8'
bind-key -n M-9 if-shell 'tmux select-window -t 9' '' 'new-window -t 9'
bind-key -n M-0 if-shell 'tmux select-window -t 10' '' 'new-window -t 10'


# Change current pane to next window
bind-key 1 if-shell 'tmux join-pane -t :1' '' 'new-window -d -t 1; join-pane -t :1 ; kill-pane -a'
bind-key 2 if-shell 'tmux join-pane -t :2' '' 'new-window -d -t 2; join-pane -t :2 ; kill-pane -a'
bind-key 3 if-shell 'tmux join-pane -t :3' '' 'new-window -d -t 3; join-pane -t :3 ; kill-pane -a'
bind-key 4 if-shell 'tmux join-pane -t :4' '' 'new-window -d -t 4; join-pane -t :4 ; kill-pane -a'
bind-key 5 if-shell 'tmux join-pane -t :5' '' 'new-window -d -t 5; join-pane -t :5 ; kill-pane -a'
bind-key 6 if-shell 'tmux join-pane -t :6' '' 'new-window -d -t 6; join-pane -t :6 ; kill-pane -a'
bind-key 7 if-shell 'tmux join-pane -t :7' '' 'new-window -d -t 7; join-pane -t :7 ; kill-pane -a'
bind-key 8 if-shell 'tmux join-pane -t :8' '' 'new-window -d -t 8; join-pane -t :8 ; kill-pane -a'
bind-key 9 if-shell 'tmux join-pane -t :9' '' 'new-window -d -t 9; join-pane -t :9 ; kill-pane -a'
bind-key 0 if-shell 'tmux join-pane -t :10' '' 'new-window -d -t 10; join-pane -t :10 ; kill-pane -a'

# Kill Selected Pane
bind-key q kill-pane
