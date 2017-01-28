function jkill {
   jobs -l | cut -d' ' -f 4 | xargs kill -9
}

function __in_virtualenv {
   echo -e "import sys\nsys.exit(not hasattr(sys,'real_prefix'))" | python
}

function update_python_packages {
   virtualenv="$1"

   in_virtualenv=false
   if __in_virtualenv; then
      in_virtualenv=true
   fi

   if [ $in_virtualenv = false ] && [ -z "$virtualenv" ]; then
      echo "you must supply a virtualenv"
      return 1
   fi

   if [ $in_virtualenv = false ]; then
      workon $virtualenv
   fi

   pip install -U --upgrade pip &> /dev/null

   packages_to_install=$(pip list --outdated --format=legacy)
   if [ -z "$packages_to_install" ]; then
      return 0
   fi

   echo $packages_to_install | cut -d ' ' -f1 | \
      xargs -n1 pip install -U

   if [ $in_virtualenv = false ]; then
      deactivate
   fi
}
