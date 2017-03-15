#!/bin/sh
if ! ps -ef | grep "[s]sh-agent -s" &> /dev/null; then
   eval "$(ssh-agent -s)" &> /dev/null
   ssh-add ~/.ssh/github_rsa &> /dev/null
   ssh-add ~/.ssh/digitalocean_rsa &> /dev/null
fi