#!/usr/bin/fish
function venvon
   set venv $argv[1]
   if test -z "$venv"
      if test -d (pwd)/.venv
         set venv ".venv"
      else
         set venv (basename (pwd))
      end
   end
   if not source (pwd)/$venv/bin/activate.fish > /dev/null ^&1
      echo "./$venv dir is missing"
      return 1
   end
end

function __mkvenv
   set version $argv[1]
   set venvtype $argv[2]
   set venv $argv[3]

   if test -z "$venv"
      set venv ".venv"
   end

   if test -d (pwd)/$venv
      echo "venv already exist"
      return 1
   end

   eval python$version -m $venvtype $venv
   venvon $venv
end
#
function mkvenv2
   __mkvenv "2" "virtualenv" "$argv[1]"
end

function mkvenv2
   __mkvenv "3" "venv" "$argv[1]"
end
