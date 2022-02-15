function vifd --argument text
   set path (fd -t f "$text" | fzf)
   if test -n "$path"
      vi "$path"
   end
end
