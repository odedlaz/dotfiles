#!/usr/bin/env bash

# ONE DARK
# --- ----
# Gnome Terminal color scheme install script
# Based on:
#   https://github.com/chriskempson/base16-gnome-terminal/

function install_fonts() {
   echo "installing fonts..."
   git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
   cd /tmp/fonts && ./install.sh && cd .. && rm -rf /tmp/fonts
}

function dset() {
   key="$1"; shift
   val="$1"; shift

    dconf write "$PROFILE_KEY/$key" "$val"
}

# because dconf still doesn't have "append"
function dlist_append() {
    key="$1"; shift
    val="$1"; shift

    entries="$(
        {
            dconf read "$key" | \
               tr -d '[]' | \
               tr , "\\n" | \
               grep -F -v "$val"

            echo "'$val'"

        } | head -c-1 | tr "\\n" ,
    )"

    dconf write "$key" "[$entries]"
}

# if powerline fonts are already installed,
# we assume that one-dark has already been installed.

if [ "$(ls $HOME/.local/share/fonts 2> /dev/null | \
        grep -c Powerline)" -gt 0 ]; then
   exit 0
fi

PROFILE_NAME="$(whoami)"
BASE_KEY="/org/gnome/terminal/legacy/profiles:"

dconf reset -f "$BASE_KEY"
install_fonts

PROFILE_SLUG="$PROFILE_NAME"
if which uuidgen &> /dev/null; then
   PROFILE_SLUG="$(uuidgen)"
fi

if [[ -n "$(dconf read $BASE_KEY/default)" ]]; then
  DEFAULT_SLUG="$(dconf read $BASE_KEY/default | tr -d \')"
else
  DEFAULT_SLUG="$(dconf list $BASE_KEY/ | \
                  grep '^:' | \
                  head -n1 | \
                  tr -d :/)"
fi

DEFAULT_KEY="$BASE_KEY/:$DEFAULT_SLUG"
PROFILE_KEY="$BASE_KEY/:$PROFILE_SLUG"

# copy existing settings from default profile
dconf dump "$DEFAULT_KEY/" | dconf load "$PROFILE_KEY/"

# add new copy to list of profiles
dlist_append "$BASE_KEY/list" "$PROFILE_SLUG"

# update profile values with theme options
dset visible-name "'$PROFILE_NAME'"
dset palette "['#000000',
               '#E06C75',
               '#98c379',
               '#d19a66',
               '#61aeee',
               '#c678dd',
               '#56b6c2',
               '#abb2bf',
               '#5c6370',
               '#e06c75',
               '#98c379',
               '#d19a66',
               '#62afee',
               '#c678dd',
               '#56b6c2',
               '#ffffff']"
dset background-color "'#282c34'"
dset foreground-color "'#abb2bf'"
dset bold-color "'#ABB2BF'"
dset bold-color-same-as-fg "true"
dset use-theme-colors "false"
dset use-theme-background "false"
dset use-custom-command "true"
dset custom-command "'tmux new -A -s 0'"
dset use-system-font "false"
dset font "'Inconsolata-g for Powerline Medium 12'"
