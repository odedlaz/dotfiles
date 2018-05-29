# List of plugins
set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'odedlaz/tmux-onedark-theme'
set -g @onedark_widgets '#{free_mem} #{package_updates} #{uptime}'

set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-pain-control'

set -g @plugin 'odedlaz/tmux-status-variables'
set -g @status_variables_debug "true"
set -g @ipinfo_format "#isp"

# invalidate cache every 30 minutes
set -g @package_updates_invalidate_cache_interval 30

set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

set -g @plugin 'tmux-plugins/tmux-yank'

set -g @prefix_highlight_show_copy_mode 'on'
