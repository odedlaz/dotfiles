# List of plugins
set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'odedlaz/tmux-onedark-theme'
set -g @onedark_widgets '#{free_mem} #{package_updates} #{ipinfo}'

set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-pain-control'

set -g @plugin 'odedlaz/tmux-status-variables'
set -g @ipinfo_format "#isp"

set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @prefix_highlight_show_copy_mode 'on'
