fish_add_path /opt/homebrew/bin/

# homebrew python
fish_add_path /opt/homebrew/opt/python@3.10/libexec/bin
fish_add_path /opt/homebrew/opt/python@3.10/bin
fish_add_path /opt/homebrew/opt/node@16/bin
set -gx LDFLAGS "-L/opt/homebrew/opt/python@3.10/lib"
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/python@3.10/lib/pkgconfig"
