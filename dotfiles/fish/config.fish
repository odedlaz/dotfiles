function is_disabled -a 'path'
   if echo $path | grep '.disabled$' > /dev/null
      return 0
   else
      return 1
   end
end

for dir in functions work-functions
   for path in $HOME/.config/fish/$dir/*
      if is_disabled $path
         continue
      else
         source $path
      end
   end
end

if test -d $HOME/.local/bin
   set -gx PATH $PATH $HOME/.local/bin
end
