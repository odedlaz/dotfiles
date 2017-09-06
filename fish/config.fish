if status --is-interactive
   fortune -s kernelnewbies linuxcookie linux computers science tao  | ponysay
end

for dir in functions work-functions
   for path in $HOME/.config/fish/$dir/*
      source $path
   end
end
