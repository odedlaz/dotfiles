#!/usr/bin/zsh

function update_python_packages {
   USERNAME=$(logname)
   # run command as the user who logged in. see: https://goo.gl/akX2eo
   echo "Updating neovim python$1 libraries ..."

   source /opt/nvim/python$1/bin/activate
   pip install -u --upgrade pip &> /dev/null
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

   update_python_packages "2"
   update_python_packages "3"
done
