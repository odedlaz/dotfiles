set PREFER_CONFIG_PATH $HOME/.config/prefer
if not test -d $PREFER_CONFIG_PATH
   mkdir -p $PREFER_CONFIG_PATH
end

function _add_prefer_path
   _remove_prefer_path
   set PATH $PREFER_CONFIG_PATH $PATH
end

function _remove_prefer_path
   while contains $PREFER_CONFIG_PATH $PATH
      set idx (echo $PATH | tr " " "\n" | nl | \
               grep $PREFER_CONFIG_PATH | awk '{print $1}')
      set --erase PATH[$idx]
   end
end

_add_prefer_path

function add-prefer --argument preferpath path
   if echo "$preferpath" | grep "$PREFER_CONFIG_PATH" 2>&1 > /dev/null
      echo "preferred path parameter (\$1) is invalid"
      return 1
   end

   if not test -e $preferpath ;or test -z $preferpath
      echo "preferred file doesn't exist at: '$preferpath'"
      return 1
   end

   if echo "$path" | grep "$PREFER_CONFIG_PATH" 2>&1 > /dev/null
      echo "old path parameter (\$2) is invalid"
      return 1
   end

   if not test -e $path ;or test -z $path
      echo "non preferred file doesn't exist at: '$path'"
      return 1
   end

   set scriptpath $PREFER_CONFIG_PATH/(basename $path)
   echo '#!/usr/bin/env fish' > $scriptpath
   echo 'set cmdline (cat /proc/(ps -o ppid= -p %self | xargs)/cmdline)' >> $scriptpath
   echo 'if test $cmdline = (which fish)' >> $scriptpath
   echo "   printf \"\033[0;31m[!]\033[0m consider using" (basename $preferpath) "instead of" (basename $path)"\n\" 1>&2" >> $scriptpath
   echo 'end' >> $scriptpath
   echo "exec $path \$argv" >> $scriptpath

   chmod u+x $scriptpath
end
