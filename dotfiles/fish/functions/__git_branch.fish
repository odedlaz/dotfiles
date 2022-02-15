function __git_branch --description 'get current git branch'
   git symbolic-ref HEAD | sed 's!refs\/heads\/!!'
end
