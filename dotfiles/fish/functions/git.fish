#!/usr/bin/env fish

function _git_branch --description 'get current git branch'
   git symbolic-ref HEAD | sed 's!refs\/heads\/!!'
end

function gpob --description 'git push CURRENT-BRANCH'
   git push $argv origin (_git_branch)
end

function gpob\! --description "git push -f CURRENT-BRANCH"
   gpob --force $argv
end

function gpub --description 'git pull CURRENT-BRANCH'
   git pull --rebase $argv origin (_git_branch)
end

function greset --argument branch
   if test -z $branch
      set branch (_git_branch)
   end

   echo "fetching branch: $branch"
   git fetch origin $branch

   echo "checking out branch: $branch"
   git checkout $branch

   echo "resetting branch: $branch..."
   git reset --hard origin/$branch

   echo "cleaning directory to clean slate..."
   git clean --force -d (git rev-parse --show-toplevel)
end

function git_set_parent --argument parent
   set branch (_git_branch)
   git branch $branch -u $parent
end
