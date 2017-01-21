set -g status "on"
set -g status-justify "left"

set -g status-left-length "100"
set -g status-right-length "100"
set -g status-right-attr "none"

set -g message-fg "#abb2bf"
set -g message-bg "#282c34"

set -g message-command-fg "#abb2bf"
set -g message-command-bg "#282c34"

set -g status-attr "none"
set -g status-left-attr "none"

setw -g window-status-fg "#282c34"
setw -g window-status-bg "#282c34"
setw -g window-status-attr "none"

setw -g window-status-activity-bg "#282c34"
setw -g window-status-activity-fg "#282c34"
setw -g window-status-activity-attr "none"

setw -g window-status-separator ""

set -g window-style 'fg=#5c6370,bg=#282c34'
set -g window-active-style 'fg=#abb2bf,bg=#282c34'

set -g pane-border-fg "#abb2bf"
set -g pane-active-border-fg "#abb2bf"

set-option -g display-panes-active-colour "#e5c07b"
set-option -g display-panes-colour "#61afef"

set -g status-bg "#282c34"
set -g status-fg "#abb2bf"

set -g status-left "#[fg=#3e4452,bg=#98c379,bold] #S #[fg=#98c379,bg=#3e4452,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#aab2bf,bg=#282c34,nounderscore,noitalics]%H:%M:%S  %d/%m/%y #[fg=#3e4452,bg=#282c34]#[fg=#3e4452,bg=#3e4452]#[fg=#aab2bf, bg=#3e4452]#(free -h | awk '/Mem:/{print $7}') #[fg=#98c379,bg=#3e4452,nobold,nounderscore,noitalics]#[fg=#282c34,bg=#98c379,bold] #h #[fg=#e5c07b, bg=#98c379]#[fg=#e06c75,bg=#e5c07b]"

setw -g window-status-format "#[fg=#282c34,bg=#282c34,nobold,nounderscore,noitalics]#[fg=#abb2bf,bg=#282c34] #I  #W #[fg=#282c34,bg=#282c34,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#282c34,bg=#3e4452,nobold,nounderscore,noitalics]#[fg=#abb2bf,bg=#3e4452,nobold] #I  #W #[fg=#3e4452,bg=#282c34,nobold,nounderscore,noitalics]"
