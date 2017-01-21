# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-pain-control'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-copycat'

set -g @plugin 'tmux-plugins/tmux-net-speed'
set -g @net_speed_interfaces "wlp3s0 enp0s25"

set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @prefix_highlight_show_copy_mode 'on'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
