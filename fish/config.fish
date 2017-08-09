if status --is-interactive
   fortune -s kernelnewbies linuxcookie linux computers science tao  | ponysay
end

for path in $HOME/.config/fish/work-functions/*
   source $path
end
