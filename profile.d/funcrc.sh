#!/usr/bin/env zsh

function venvon {
   venv="$1"
   if [ -z "$venv" ]; then
      if [ -d "$(pwd)/.venv" ]; then
         venv=".venv"
      else
         venv=$(basename $(pwd))
      fi
   fi

   if ! source "$(pwd)/$venv/bin/activate" &> /dev/null; then
      echo "./$venv dir is missing"
      return 1
   fi
}

function __mkvenv {
   version="$1"
   venvtype="$2"
   venv="$3"

   if [ -z "$venv" ]; then
      venv=".venv"
   fi

   if [ -d "$(pwd)/$venv" ]; then
      echo "venv already exist"
      return 1
   fi

   python$version -m $venvtype $venv
   venvon $venv
}

function mkvenv2 {
   __mkvenv "2" "virtualenv" "$1"
}

function mkvenv3 {
   __mkvenv "3" "venv" "$1"
}

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

function _git_branch {
   git symbolic-ref HEAD | sed 's!refs\/heads\/!!'
}

function gpom {
   git push origin $(_git_branch)
}

function gpom\! {
   git push -f origin $(_git_branch)
}
