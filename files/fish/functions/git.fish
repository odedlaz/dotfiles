#!/usr/bin/env fish

function _git_branch --description 'get current git branch'
   git symbolic-ref HEAD | sed 's!refs\/heads\/!!'
end

function gpob --description 'git push CURRENT-BRANCH'
   git push $argv origin (_git_branch)
end

function gpob\! --description "git push -f CURRENT-BRANCH"
   gpob --force-with-lease $argv
end

function gpub --description 'git pull CURRENT-BRANCH'
   git pull --rebase $argv origin (_git_branch)
end