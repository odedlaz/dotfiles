for dir in functions work-functions
   for path in $HOME/.config/fish/$dir/*
      source $path
   end
end

if test -d $HOME/.local/bin
   set -gx PATH $PATH $HOME/.local/bin
end
