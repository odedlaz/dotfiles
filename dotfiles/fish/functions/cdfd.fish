function cdfd --argument text
   set path (fd $text | fzf)
   if test -z "$path"
      return 0
   end
   if test -f "$path"
      set path (dirname $path)
   end

   cd "$path"; or return 1
end
