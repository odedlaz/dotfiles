#!/usr/bin/zsh

function update_python_packages {
   workon "$1"
   pip install -U --upgrade pip &> /dev/null
   packages_to_install=$(pip list --outdated --format=legacy)
   if [ ! -z "$packages_to_install" ]; then
      echo $packages_to_install | awk '{print $1}' | \
         xargs -n1 pip install -U
   fi
   deactivate
}

while IFS= read -r line; do
   # check if neovim is being installed
   # if so, update the client libraries!
   if ! echo "$line" | grep "[n]eovim" &>/dev/null; then
      continue
   fi

   # run command as the user who logged in. see: https://goo.gl/akX2eo
   USERNAME=$(logname)
   echo "Updating neovim python libraries ..."

   # setup virtualenv
   export WORKON_HOME="$HOME/.virtualenvs"
   export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
   source /usr/local/bin/virtualenvwrapper.sh

   update_python_packages "neovim2"
   update_python_packages "neovim3"
done
