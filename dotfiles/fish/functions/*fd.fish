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

function vifd --argument text
   set path (fd -t f "$text" | fzf)
   if test -n "$path"
      vi "$path"
   end
end
