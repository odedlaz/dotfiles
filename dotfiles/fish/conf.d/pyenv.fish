set -x PATH "/home/local/MAGICLEAP/olazar/.pyenv/bin" $PATH
if status --is-interactive
   source (pyenv init - |psub)
   # pyenv virtualenv hooks fish's prompt which is extremely slow
   #source (pyenv virtualenv-init -|psub)
end
