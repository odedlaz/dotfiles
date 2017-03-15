# List of plugins
set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'odedlaz/tmux-onedark-theme'
set -g @onedark_widgets '#{free_mem} #{package_updates} #{ipinfo}'

set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-pain-control'

set -g @plugin 'odedlaz/tmux-status-variables'
set -g @status_variables_debug "true"
set -g @ipinfo_format "#isp"
# invalidate cache every five minutes
set -g @ipinfo_invalidate_cache_interval 300
# invalidate cache every 30 minutes
set -g @package_updates_invalidate_cache_interval 1800

set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @prefix_highlight_show_copy_mode 'on'
